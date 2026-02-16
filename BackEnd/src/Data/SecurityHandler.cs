using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace BackEnd.src.Data
{
    public class SecurityHandler
    {
        private readonly string _secret;
        private readonly string _issuer;
        private readonly string _audience;
        private readonly int _expiryMinutes;

        // PBKDF2 settings
        private const int SaltSize = 16; // 128 bit
        private const int KeySize = 32; // 256 bit
        private const int Iterations = 100_000;

        public SecurityHandler(string secret, string issuer = null, string audience = null, int expiryMinutes = 60)
        {
            if (string.IsNullOrWhiteSpace(secret)) throw new ArgumentException("Secret must be provided", nameof(secret));
            _secret = secret;
            _issuer = issuer;
            _audience = audience;
            _expiryMinutes = expiryMinutes;
        }

        // Create JWT token for given subject, optional email and roles and additional claims
        public string CreateToken(string subject, string email = null, IEnumerable<string> roles = null, IDictionary<string, string> additionalClaims = null)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_secret));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Sub, subject),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            if (!string.IsNullOrWhiteSpace(email))
                claims.Add(new Claim(JwtRegisteredClaimNames.Email, email));

            if (roles != null)
                claims.AddRange(roles.Select(r => new Claim(ClaimTypes.Role, r)));

            if (additionalClaims != null)
                claims.AddRange(additionalClaims.Select(kv => new Claim(kv.Key, kv.Value)));

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: _issuer,
                audience: _audience,
                claims: claims,
                notBefore: now,
                expires: now.AddMinutes(_expiryMinutes),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        // Validate JWT and return ClaimsPrincipal if valid, otherwise null
        public bool TryValidateToken(string token, out ClaimsPrincipal principal)
        {
            principal = null;
            if (string.IsNullOrWhiteSpace(token)) return false;

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes(_secret);

            var parameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = !string.IsNullOrWhiteSpace(_issuer),
                ValidIssuer = _issuer,
                ValidateAudience = !string.IsNullOrWhiteSpace(_audience),
                ValidAudience = _audience,
                ValidateLifetime = true,
                ClockSkew = TimeSpan.FromMinutes(2)
            };

            try
            {
                principal = tokenHandler.ValidateToken(token, parameters, out var validatedToken);

                // optional: further checks to ensure token uses expected algorithm
                if (!(validatedToken is JwtSecurityToken jwt) ||
                    !jwt.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.OrdinalIgnoreCase))
                {
                    principal = null;
                    return false;
                }

                return true;
            }
            catch
            {
                principal = null;
                return false;
            }
        }

        // Hash password using PBKDF2. Returned format: iterations.saltBase64.hashBase64
        public string HashPassword(string password)
        {
            if (password == null) throw new ArgumentNullException(nameof(password));

            using var rng = RandomNumberGenerator.Create();
            var salt = new byte[SaltSize];
            rng.GetBytes(salt);

            var key = Rfc2898DeriveBytes.Pbkdf2(password.AsSpan(), salt, Iterations, HashAlgorithmName.SHA256, KeySize);

            return $"{Iterations}.{Convert.ToBase64String(salt)}.{Convert.ToBase64String(key)}";
        }

        // Verify password given stored hash in format iterations.salt.hash
        public bool VerifyPassword(string storedHash, string providedPassword)
        {
            if (string.IsNullOrWhiteSpace(storedHash)) return false;
            if (providedPassword == null) return false;

            var parts = storedHash.Split('.', 3);
            if (parts.Length != 3) return false;

            if (!int.TryParse(parts[0], out var iterations)) return false;
            var salt = Convert.FromBase64String(parts[1]);
            var key = Convert.FromBase64String(parts[2]);

            var computedKey = Rfc2898DeriveBytes.Pbkdf2(providedPassword.AsSpan(), salt, iterations, HashAlgorithmName.SHA256, key.Length);

            return CryptographicOperations.FixedTimeEquals(computedKey, key);
        }
    }
}