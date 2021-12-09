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
    }
}
