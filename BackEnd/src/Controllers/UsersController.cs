using System.Runtime.ConstrainedExecution;
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

        [HttpGet("{cpf}")]
        public async Task<ActionResult<Users>> GetUserDetails(string cpf)
        {
            var user = await _repository.GetUserDetails(cpf);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(new { user });
        }

        [HttpPost("register")]
        public async Task<ActionResult<Users>> RegisterUser(Users user)
        {
            var createdUser = await _repository.RegisterUser(user);
            if (createdUser == false)
            {
                return BadRequest("User registration failed");
            }

            var secHandler = new SecurityHandler("543wefadsadfgasfqwadc654332adsfgdsas");
            var token = secHandler.CreateToken(user.email);
            return Ok(new { token });
        }

        [HttpPost("login")]
        public async Task<ActionResult<Users>> LoginUser(Users user)
        {
            var loggedInUser = await _repository.LoginUser(user);
            if (loggedInUser == false)
            {
                return Unauthorized("Invalid CPF or password");
            }

            var secHandler = new SecurityHandler("543wefadsadfgasfqwadc654332adsfgdsas");
            var token = secHandler.CreateToken(user.email);
            return Ok(new { token });
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