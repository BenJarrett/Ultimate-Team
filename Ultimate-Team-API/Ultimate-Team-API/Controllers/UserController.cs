
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/user")]
    [ApiController]
    public class UserController : ControllerBase
    {

        UserRepository _repo;

        public UserController(UserRepository repo)
        {
            _repo = repo;
        }

        // Get All Users //
        [HttpGet]
        public IActionResult GetAllUsers()
        {
            return Ok(_repo.GetAll());
        }


        // Get A Single User by Id //
        [HttpGet("{id}")]
        public IActionResult GetASingleUser(Guid id)
        {
            var card = _repo.GetSingleUserById(id);

            if (card == null)
            {
                return NotFound($"No User with the Id of {id} was found.");
            }

            return Ok(card);
        }

    }
}
