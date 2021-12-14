using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/pack")]
    [ApiController]

    public class PackController : ControllerBase
    {

        PackRepository _repo;

        public PackController(PackRepository repo)
        {
            _repo = repo;
        }

        // Get All Packs //
        [HttpGet]
        public IActionResult GetAllPacks()
        {
            return Ok(_repo.GetAll());
        }


        // Get A Pack by Pack Id //
        [HttpGet("{id}")]
        public IActionResult GetASinglePack(Guid id)
        {
            var card = _repo.GetAPackByCardId(id);

            if (card == null)
            {
                return NotFound($"No Pack with the Id of {id} was found.");
            }

            return Ok(card);
        }

        // Get User's Packs //
        [HttpGet("user/{id}")]
        public IActionResult GetUsersPacks(Guid id)
        {
            return Ok(_repo.GetUsersPacksByUserId(id));
        }
    }
}
