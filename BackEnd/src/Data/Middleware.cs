using Microsoft.AspNetCore.Http;
using System;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;

namespace BackEnd.src.Data
{
    public class Middleware
    {
        private readonly RequestDelegate _next;

        public Middleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            if (context.Request.Path.HasValue && context.Request.Path.Value=="/api/Users/register" || context.Request.Path.HasValue && context.Request.Path.Value=="/api/Users/login")
            {
                await _next(context);
            }
            else
            {
                if (!context.Request.Headers.ContainsKey("Authorization"))
                {
                    context.Response.StatusCode = 401;
                    await context.Response.WriteAsync("Unauthorized");
                    return;
                }

                var token = context.Request.Headers["Authorization"].ToString().Split(" ")[1];

                var applicationContext = context.RequestServices.GetService<ApplicationContext>();
                if(applicationContext != null)
                {
                    var securityHandler = context.RequestServices.GetService<SecurityHandler>();
                    if (securityHandler == null)
                    {
                        throw new Exception("SecurityHandler not found");
                    }

                    if (!securityHandler.TryValidateToken(token, out var principal))
                    {
                        context.Response.StatusCode = 401;
                        await context.Response.WriteAsync("Unauthorized token");
                        return;
                    }
                    context.User = principal;
                }
                else
                {
                    throw new Exception("Application context not found");
                }

                await _next(context);
            }
        }
    }
}