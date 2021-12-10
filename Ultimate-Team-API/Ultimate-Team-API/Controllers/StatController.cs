using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/stat")]
    [ApiController]
    public class StatController : ControllerBase
    {
        StatRepository _repo;

        public StatController(StatRepository repo)
        {
            _repo = repo;
        }

        // Get All Stats //
        [HttpGet]
        public IActionResult GetAllStats()
        {
            return Ok(_repo.GetAll());
        }
    }
}
