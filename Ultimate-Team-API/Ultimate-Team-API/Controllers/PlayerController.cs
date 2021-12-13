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
        TeamRepository _teamRepository;

        public PlayerController(PlayerRepository repo, TeamRepository teamRepo)
        {
            _repo = repo;
            _teamRepository = teamRepo;
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
            var player = _repo.GetPlayerById(id);

            if (player == null)
            {
                return NotFound($"No Player with the Id of {id} was found.");
            }

            return Ok(player);
        }

        // Get Player's by Team Id //
        [HttpGet("team/{id}")]
        public IActionResult GetAllPlayersByTeam(Guid id)
        {
            return Ok(_repo.GetPlayersByTeamId(id));
        }

        // Get All Players in Western Conference //
        [HttpGet("team/conference/western")]
        public IActionResult GetAllPlayersInWesternConference()
        {
            return Ok(_repo.GetPlayersInWesternConference());
        }

         
        // Get All Players in Eastern Conference //
        [HttpGet("team/conference/eastern")]
        public IActionResult GetAllPlayersInEasternConference()
        {
            return Ok(_repo.GetPlayersInEasternConference());
        }

        // Get Player's by Card Id //
        [HttpGet("card/{id}")]
        public IActionResult GetPlayerByCard(Guid id)
        {
            return Ok(_repo.GetPlayersByCardId(id));
        }

        // Get Player's by User Id //
        [HttpGet("user/{id}")]
        public IActionResult GetUsersPlayers(Guid id)
        {
            return Ok(_repo.GetUsersPlayersByUserId(id));
        }
    }
}
