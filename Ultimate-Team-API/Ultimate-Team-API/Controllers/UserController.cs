
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;
using Ultimate_Team_API.Models;

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

        // Add User //
        [HttpPost]

        public IActionResult AddUser(User newUser)
        {
            if (string.IsNullOrEmpty(newUser.FirstName) || string.IsNullOrEmpty(newUser.LastName) || string.IsNullOrEmpty(newUser.CustomerEmail))
            {
                return BadRequest("First Name, Last Name and Contact Email are required fields");
            }

            _repo.Add(newUser);

            return Created($"/api/users/{newUser.Id}", newUser);
        }

        //Update User //

        [HttpPut("{id}")]


        public IActionResult UpdateUser(Guid id, User user)
        {

            var userToUpdate = _repo.GetSingleUserById(id);

            if (userToUpdate == null)
            {
                return NotFound($"The User associated with the Id of {id} could not be located ");
            }

            var updatedUser = _repo.UpdateUser(id, user);

            return Ok(updatedUser);


        }

    }
}
