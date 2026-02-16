using BackEnd.src.Data;
using BackEnd.src.Models;
using BackEnd.src.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.src.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecBillController : ControllerBase

    {
        private readonly ApplicationContext _context;
        private readonly IApplicationRepository _repository;

        public RecBillController(ApplicationContext context)
        {
            _context = context;
            _repository = new DapperRepository(context.Database.GetDbConnection());
        }

        [HttpGet("{userId}")]
        public async Task<ActionResult<IEnumerable<RecurrentBills>>> GetRecBillsByUserId(int userId)
        {
            var recBills = await _repository.GetAllUserRecurrentBills(userId);
            return Ok(recBills);
        }

        [HttpGet("{userId}/{recBillId}")]
        public async Task<ActionResult<RecurrentBills>> GetRecBillById(int userId, int recBillId)
        {
            var recBill = await _repository.GetUserRecurrentBillById(userId, recBillId);
            if (recBill == null)
            {
                return NotFound();
            }
            return Ok(recBill);
        }

        [HttpPost]
        public async Task<ActionResult<RecurrentBills>> CreateRecBill(RecurrentBills recBill)
        {
            throw new NotImplementedException("Create recurrent bill endpoint not implemented yet");
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<RecurrentBills>> UpdateRecBill(int id, RecurrentBills recBill)
        {
            if (id != recBill.id)
            {
                return BadRequest("Recurrent bill ID mismatch");
            }

            var updatedRecBill = await _repository.UpdateUserRecurrentBill(recBill);
            if (updatedRecBill == null)
            {
                return NotFound();
            }
            return Ok(updatedRecBill);
        }
    }
}