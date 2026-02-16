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

        public Task<IEnumerable<Users>> GetAllUsers()
        {
            throw new NotImplementedException();
        }

        public Task<Users?> GetUserById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<Users?> RegisterUser(Users user)
        {
            throw new NotImplementedException();
        }

        public Task<Users?> LoginUser(Users user)
        {
            throw new NotImplementedException();
        }

        public Task<Users?> UpdateUser(Users user)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteUser(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<UserTransactions>> GetAllUserTransactions(int id_user)
        {
            throw new NotImplementedException();
        }

        public Task<UserTransactions?> GetUserTransactionById(int id_user, int id_transaction)
        {
            throw new NotImplementedException();
        }

        public Task<UserTransactions?> CreateUserTransaction(UserTransactions transaction)
        {
            throw new NotImplementedException();
        }

        public Task<UserTransactions?> UpdateUserTransaction(UserTransactions transaction)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Budgets>> GetAllUserBudgets(int id_user)
        {
            throw new NotImplementedException();
        }

        public Task<Budgets?> GetUserBudgetById(int id_user, int id_budget)
        {
            throw new NotImplementedException();
        }

        public Task<Budgets?> CreateUserBudget(Budgets budget)
        {
            throw new NotImplementedException();
        }

        public Task<Budgets?> UpdateUserBudget(Budgets budget)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteUserBudget(int id_user, int id_budget)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Pots>> GetAllUserPots(int id_user)
        {
            throw new NotImplementedException();
        }

        public Task<Pots?> GetUserPotById(int id_user, int id_pot)
        {
            throw new NotImplementedException();
        }

        public Task<Pots?> CreateUserPot(Pots pot)
        {
            throw new NotImplementedException();
        }

        public Task<Pots?> UpdateUserPot(Pots pot)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteUserPot(int id_user, int id_pot)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<RecurrentBills>> GetAllUserRecurrentBills(int id_user)
        {
            throw new NotImplementedException();
        }

        public Task<RecurrentBills?> GetUserRecurrentBillById(int id_user, int id_recurrent_bill)
        {
            throw new NotImplementedException();
        }

        public Task<RecurrentBills?> CreateUserRecurrentBill(RecurrentBills bill)
        {
            throw new NotImplementedException();
        }

        public Task<RecurrentBills?> UpdateUserRecurrentBill(RecurrentBills bill)
        {
            throw new NotImplementedException();
        }
    }
}
