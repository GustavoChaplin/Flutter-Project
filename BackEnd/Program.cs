using BackEnd.src.Data;
using Microsoft.EntityFrameworkCore;
using System.Data; // for IDbConnection
using Microsoft.Data.SqlClient; // SQL Server connection implementation
using BackEnd.src.Repositories; // register repository types

// This is the entry point of the web application. It creates a new WebApplication instance
// and configures it using the builder pattern.
var builder = WebApplication.CreateBuilder(args);

// Add endpoints API explorer, which provides a UI for exploring the APIs of the application.
builder.Services.AddEndpointsApiExplorer();

// Add Swagger generator, which generates documentation for the APIs of the application.
builder.Services.AddSwaggerGen();

// Get the connection string for the default database connection from the configuration.
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Add a DbContext to the services, which is used to interact with the database.
// The UseSqlServer method specifies the database provider and the connection string.
// The ServerVersion.AutoDetect method detects the version of the database server.
builder.Services.AddDbContext<ApplicationContext>(options => options.UseSqlServer(connectionString));

// Add controllers to the services, which handle HTTP requests and responses.
builder.Services.AddControllers();

// Register IDbConnection for Dapper usage.
// We register a transient IDbConnection that will open a SqlConnection
// using the same connection string configured in appsettings.json.
// Dapper uses IDbConnection for executing SQL and stored procedures.
builder.Services.AddTransient<IDbConnection>(_ => new SqlConnection(connectionString));

// Register Dapper repository implementation. Prefer registering by interface
// so callers depend on `IApplicationRepository` rather than the concrete type.
builder.Services.AddScoped<IApplicationRepository, DapperRepository>();

builder.Services.AddCors(options =>
{
   options.AddDefaultPolicy(builder =>{
       builder.WithOrigins("http://localhost:5000")
       .AllowAnyHeader()
       .AllowAnyMethod();
   });
});

// Build the WebApplication instance using the configured services.
var app = builder.Build();

// Configure the HTTP request pipeline.
// If the application is running in development environment, enable Swagger UI.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Redirect HTTP requests to HTTPS.
app.UseHttpsRedirection();

app.UseCors();

// Use the routing middleware to route HTTP requests to the appropriate handlers.
app.UseRouting();

app.UseMiddleware<Middleware>();

// Use the controller middleware to handle HTTP requests.
app.MapControllers();

// Use the authorization middleware to authorize HTTP requests.
app.UseAuthorization();

// Start the web server and begin accepting HTTP requests.
app.Run();