using BackEnd.src.Models;
namespace BackEnd.src.Repositories
{
    // Interface for user-related data access. Implementations may use Dapper,
    // ADO.NET, EF Core, etc. Keeping an interface makes testing and swapping
    // implementations easy.
    internal interface IApplicationRepository
    {
        // Returns all users. Method returns a task so it can be awaited.
        Task<IEnumerable<Users>> GetAllUsersAsync();

        // Returns a single user by id, or null if not found.
        Task<Users?> GetByIdAsync(int id);
        Task<Users?> CreateUserAsync(Users user);
    }
}
