using BackEnd.src.Data;
using BackEnd.src.Models;
using BackEnd.src.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.src.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PotsController : ControllerBase
    {
        private readonly ApplicationContext _context;
        private readonly IApplicationRepository _repository;

        public PotsController(ApplicationContext context)
        {
            _context = context;
            _repository = new DapperRepository(context.Database.GetDbConnection());
        }

        [HttpGet("{userId}")]
        public async Task<ActionResult<IEnumerable<Pots>>> GetPotsByUserId(int userId)
        {
            var pots = await _repository.GetAllUserPots(userId);
            return Ok(pots);
        }

        [HttpGet("{userId}/{potId}")]
        public async Task<ActionResult<Pots>> GetPotById(int userId, int potId)
        {
            var pot = await _repository.GetUserPotById(userId, potId);
            if (pot == null)
            {
                return NotFound();
            }
            return Ok(pot);
        }

        [HttpPost]
        public async Task<ActionResult<Pots>> CreatePot(Pots pot)
        {
            var createdPot = await _repository.CreateUserPot(pot);
            if (createdPot == null)
            {
                return BadRequest("Failed to create pot");
            }
            return CreatedAtAction(nameof(GetPotById), new { userId = createdPot.id_user, potId = createdPot.id }, createdPot);
        }

        [HttpPut("{potId}")]
        public async Task<ActionResult<Pots>> UpdatePot(int potId, Pots pot)
        {
            if (potId != pot.id)
            {
                return BadRequest("Pot ID mismatch");
            }

            var updatedPot = await _repository.UpdateUserPot(pot);
            if (updatedPot == null)
            {
                return NotFound();
            }
            return Ok(updatedPot);
        }

        [HttpDelete("{id_user}/{id_pot}")]
        public async Task<ActionResult> DeletePot(int id_user, int id_pot)
        {
            var success = await _repository.DeleteUserPot(id_user, id_pot);
            if (!success)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}