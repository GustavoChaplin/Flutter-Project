using BackEnd.src.Data;
using BackEnd.src.Models;
using BackEnd.src.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.src.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BudgetsController : ControllerBase
    {
        private readonly ApplicationContext _context;
        private readonly IApplicationRepository _repository;

        public BudgetsController(ApplicationContext context)
        {
            _context = context;
            _repository = new DapperRepository(context.Database.GetDbConnection());
        }

        [HttpGet("{userId}")]
        public async Task<ActionResult<IEnumerable<Budgets>>> GetBudgetsByUserId(int userId)
        {
            var budgets = await _repository.GetAllUserBudgets(userId);
            return Ok(budgets);
        }

        [HttpGet("{userId}/{budgetId}")]
        public async Task<ActionResult<Budgets>> GetBudgetById(int userId, int budgetId)
        {
            var budget = await _repository.GetUserBudgetById(userId, budgetId);
            if (budget == null)
            {
                return NotFound();
            }
            return Ok(budget);
        }

        [HttpPost]
        public async Task<ActionResult<Budgets>> CreateBudget(Budgets budget)
        {
            var createdBudget = await _repository.CreateUserBudget(budget);
            if (createdBudget == null)
            {
                return BadRequest("Failed to create budget");
            }
            return CreatedAtAction(nameof(GetBudgetById), new { userId = createdBudget.id_user, budgetId = createdBudget.id }, createdBudget);
        }

        [HttpPut("{budgetId}")]
        public async Task<ActionResult<Budgets>> UpdateBudget(int budgetId, Budgets budget)
        {
            if (budgetId != budget.id)
            {
                return BadRequest("Budget ID mismatch");
            }

            var updatedBudget = await _repository.UpdateUserBudget(budget);
            if (updatedBudget == null)
            {
                return NotFound();
            }
            return Ok(updatedBudget);
        }
    }
}