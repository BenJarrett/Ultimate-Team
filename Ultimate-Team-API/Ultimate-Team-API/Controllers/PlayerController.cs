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

        // Get Player by Id // 
        [HttpGet("{id}")]
        public IActionResult GetSinglePlayerById(Guid id)
        {
            var player = _repo.GetPlayerByTeamId(id);

            if (player == null)
            {
                return NotFound($"No Player with the Id of {id} was found.");
            }

            return Ok(player);
        }

        // Get Player's by Team Orders //
        [HttpGet("team/{id}")]
        public IActionResult GetAllPlayersByTeam(Guid id)
        {
            return Ok(_repo.GetPlayersByTeamId(id));
        }
    }
}
