using BackEnd.src.Data;
using BackEnd.src.Models;
using BackEnd.src.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.src.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserTransactionsController : ControllerBase
    {
        private readonly ApplicationContext _context;
        private readonly IApplicationRepository _repository;

        public UserTransactionsController(ApplicationContext context)
        {
            _context = context;
            _repository = new DapperRepository(context.Database.GetDbConnection());
        }

        [HttpGet("{userId}")]
        public async Task<ActionResult<IEnumerable<UserTransactions>>> GetUserTransactions(int userId)
        {
            var transactions = await _repository.GetAllUserTransactions(userId);
            if (transactions == null || !transactions.Any())
            {
                return NotFound();
            }
            return Ok(transactions);
        }

        [HttpGet("{userId}/{transactionId}")]
        public async Task<ActionResult<UserTransactions>> GetUserTransaction(int userId, int transactionId)
        {
            var transaction = await _repository.GetUserTransactionById(userId, transactionId);
            if (transaction == null)
            {
                return NotFound();
            }
            return Ok(transaction);
        }

        [HttpPost]
        public async Task<ActionResult<UserTransactions>> CreateUserTransaction(UserTransactions transaction)
        {
            var createdTransaction = await _repository.CreateUserTransaction(transaction);
            if (createdTransaction == null)
            {
                return BadRequest("Failed to create transaction");
            }
            return CreatedAtAction(nameof(GetUserTransaction), new { userId = createdTransaction.id_user, transactionId = createdTransaction.id }, createdTransaction);
        }

        [HttpPut("{userId}/{transactionId}")]
        public async Task<ActionResult<UserTransactions>> UpdateUserTransaction(int userId, int transactionId, UserTransactions transaction)
        {
            transaction.id_user = userId;
            transaction.id = transactionId;
            var updatedTransaction = await _repository.UpdateUserTransaction(transaction);
            if (updatedTransaction == null)
            {
                return BadRequest("Failed to update transaction");
            }
            return Ok(updatedTransaction);
        }
    }
}