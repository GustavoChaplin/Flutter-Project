using BackEnd.src.Models;
using Dapper;
using System.Data;

namespace BackEnd.src.Repositories
{
    // Dapper-based repository implementation.
    // This class demonstrates how to call stored procedures and map results
    // to the `Users` model. Because stored-procedure result shapes can
    // differ from entity models, you can create DTOs instead and map them
    // here before returning to callers.
    internal class DapperRepository : IApplicationRepository
    {
        private readonly IDbConnection _db;

        // IDbConnection is injected from DI. We registered SqlConnection in Program.cs.
        public DapperRepository(IDbConnection db)
        {
            _db = db;
        }

        // Example: call a stored procedure that returns all users.
        public async Task<IEnumerable<Users>> GetAllUsersAsync()
        {
            var sql = "dbo.GetAllUsers";
            // Dapper will map columns returned by the procedure to properties on Users by name.
            return await _db.QueryAsync<Users>(sql, commandType: CommandType.StoredProcedure);
        }

        // Example: call a stored procedure that returns a single user by id.
        public async Task<Users?> GetByIdAsync(int id)
        {
            var sql = "dbo.GetUserById"; // replace with your proc name
            var result = await _db.QueryAsync<Users>(sql, new { Id = id }, commandType: CommandType.StoredProcedure);
            return result.FirstOrDefault();
        }

        public async Task<Users?> CreateUserAsync(Users user)
        {
            var sql = "dbo.CreateUser"; // replace with your proc name
            var parameters = new
            {
                user_name = "Teste",
                sur_name = "User",
                email = "teste@example.com",
                password = "password123",
                cpf = "12345678900",
                income = 5000.00m,
                expenses = 2000.00m,
                balance = 3000.00m,
                gender = "F",
                created_at = DateTime.UtcNow

            };
            var result = await _db.QueryAsync<Users>(sql, parameters, commandType: CommandType.StoredProcedure);
            return result.FirstOrDefault();
        }
    }
}
