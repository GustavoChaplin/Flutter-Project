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

        public Task<IEnumerable<Users>> GetAllUsers()
        {
            throw new NotImplementedException();
        }

        public Task<Users?> GetUserById(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool?> RegisterUser(Users user)
        {
            var sql = "dbo.pCreateUser";
            var parameters = new
            {
                fname = user.user_name,
                lname = user.sur_name,
                email = user.email,
                password = user.user_password,
                cpf = user.cpf,
                gender = user.gender,
            };

            var result = _db.Query<Users>(sql, parameters, commandType: CommandType.StoredProcedure);
            Console.WriteLine(result);
            if (result != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task<bool?> LoginUser(Users user)
        {
            var sql = "dbo.pLoginUser";

            var parameters = new
            {
                cpf = user.cpf,
                password = user.user_password,
            };

            var resultTask = await _db.QueryAsync<int>(sql, parameters, commandType: CommandType.StoredProcedure);
            var count = resultTask.FirstOrDefault();
            Console.WriteLine(count);
            if (count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

         public async Task<Users?> GetUserDetails(string cpf)
        {
            var sql = "dbo.pGetUserDetails";

            var parameters = new
            {
                cpf = cpf,
            };

            var result = _db.Query<Users>(sql, parameters, commandType: CommandType.StoredProcedure);
            var user = result.FirstOrDefault();
            Console.WriteLine(user);
            if (user != null)
            {
                return user;
            }
            else
            {
                return null;
            }

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
