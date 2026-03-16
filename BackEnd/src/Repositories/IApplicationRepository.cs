using BackEnd.src.Models;
namespace BackEnd.src.Repositories
{
    // Interface for user-related data access. Implementations may use Dapper,
    // ADO.NET, EF Core, etc. Keeping an interface makes testing and swapping
    // implementations easy.
    internal interface IApplicationRepository
    {
        Task<IEnumerable<Users>> GetAllUsers();
        Task<Users?> GetUserDetails(string cpf);
        Task<bool?> RegisterUser(Users user);
        Task<bool?> LoginUser(Users user);
        Task<Users?> UpdateUser(Users user);
        Task<bool> DeleteUser(int id);
        Task<IEnumerable<UserTransactions>> GetAllUserTransactions(int id_user);
        Task<UserTransactions?> GetUserTransactionById(int id_user, int id_transaction);
        Task<UserTransactions?> CreateUserTransaction(UserTransactions transaction);
        Task<UserTransactions?> UpdateUserTransaction(UserTransactions transaction);
        Task<IEnumerable<Budgets>> GetAllUserBudgets(int id_user);
        Task<Budgets?> GetUserBudgetById(int id_user, int id_budget);
        Task<Budgets?> CreateUserBudget(Budgets budget);
        Task<Budgets?> UpdateUserBudget(Budgets budget);
        Task<bool> DeleteUserBudget(int id_user, int id_budget);
        Task<IEnumerable<Pots>> GetAllUserPots(int id_user);
        Task<Pots?> GetUserPotById(int id_user, int id_pot);
        Task<Pots?> CreateUserPot(Pots pot);
        Task<Pots?> UpdateUserPot(Pots pot);
        Task<bool> DeleteUserPot(int id_user, int id_pot);
        Task<IEnumerable<RecurrentBills>> GetAllUserRecurrentBills(int id_user);
        Task<RecurrentBills?> GetUserRecurrentBillById(int id_user, int id_recurrent_bill);
        Task<RecurrentBills?> CreateUserRecurrentBill(RecurrentBills bill);
        Task<RecurrentBills?> UpdateUserRecurrentBill(RecurrentBills bill);
    }
}
