using BackEnd.src.Data;
using BackEnd.src.Models;
using BackEnd.src.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.src.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly ApplicationContext _context;
        private readonly IApplicationRepository _repository;

        public UsersController(ApplicationContext context)
        {
            _context = context;
            _repository = new DapperRepository(context.Database.GetDbConnection());
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Users>>> GetAllUsers()
        {
            var users = await _repository.GetAllUsers();
            return Ok(users);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Users>> GetUserById(int id)
        {
            var user = await _repository.GetUserById(id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPost("register")]
        public async Task<ActionResult<Users>> RegisterUser(Users user)
        {
            var createdUser = await _repository.RegisterUser(user);
            if (createdUser == null)
            {
                return BadRequest("User registration failed");
            }
            return CreatedAtAction(nameof(GetUserById), new { id = createdUser.id }, createdUser);
        }

        [HttpPost("login")]
        public async Task<ActionResult<Users>> LoginUser(Users user)
        {
            var loggedInUser = await _repository.LoginUser(user);
            if (loggedInUser == null)
            {
                return Unauthorized("Invalid email or password");
            }
            return Ok(loggedInUser);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Users>> UpdateUser(int id, Users user)
        {
            if (id != user.id)
            {
                return BadRequest("User ID mismatch");
            }

            var updatedUser = await _repository.UpdateUser(user);
            if (updatedUser == null)
            {
                return NotFound();
            }
            return Ok(updatedUser);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteUser(int id)
        {
            var success = await _repository.DeleteUser(id);
            if (!success)
            {
                return NotFound();
            }
            return NoContent();
        }

    }
}