using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/player")]
    [ApiController]

    public class PlayerController : ControllerBase
    {

        PlayerRepository _repo;

        public PlayerController(PlayerRepository repo)
        {
            _repo = repo;
        }

        // Get All Players //
        [HttpGet]
        public IActionResult GetAllPlayers()
        {
            return Ok(_repo.GetAll());
        }
    }
}
