using System;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/team")]
    [ApiController]

    public class TeamController : ControllerBase
    {

        TeamRepository _repo;

        public TeamController(TeamRepository repo)
        {
            _repo = repo;
        }

        // Get All Teams //
        [HttpGet]
        public IActionResult GetAllTeams()
        {
            return Ok(_repo.GetAll());
        }

        // Get All Teams in Eastern Conference //
        [HttpGet("conference/eastern")]
        public IActionResult GetAllTeamsInEasternConference()
        {
            return Ok(_repo.GetTeamsInEasternConference());
        }

        // Get All Teams in Western Conference //
        [HttpGet("conference/western")]
        public IActionResult GetAllTeamsInWesternConference()
        {
            return Ok(_repo.GetTeamsInWesternConference());
        }
    }
}
