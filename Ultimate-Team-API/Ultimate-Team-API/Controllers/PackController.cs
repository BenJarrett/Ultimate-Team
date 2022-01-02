using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;
using Ultimate_Team_API.Models;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/pack")]
    [ApiController]

    public class PackController : ControllerBase
    {

        PackRepository _packRepository;
        CardRepository _cardRepository;
        UserRepository _userRepository;

        public PackController(PackRepository packRepo, CardRepository cardRepo, UserRepository userRepo)
        {
            _packRepository = packRepo;
            _cardRepository = cardRepo;
            _userRepository = userRepo;
        }

        // Get All Packs //
        [HttpGet]
        public IActionResult GetAllPacks()
        {
            return Ok(_packRepository.GetAll());
        }


        // Get A Pack by Pack Id //
        [HttpGet("{id}")]
        public IActionResult GetASinglePack(Guid id)
        {
            var card = _packRepository.GetAPackByPackId(id);

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
            return Ok(_packRepository.GetUsersPacksByUserId(id));
        }

        // Get User's Unopened Packs //

        [HttpGet("unopened/user/{id}")]
        public IActionResult GetUsersUnopenedPacks(Guid id)
        {
            return Ok(_packRepository.GetUsersUnopenedPacksByUserId(id));
        }

         //Get User's Opened Packs //

        [HttpGet("opened/user/{id}")]
        public IActionResult GetUsersOpenedPacks(Guid id)
        {
            return Ok(_packRepository.GetUsersOpenedPacksByUserId(id));
        }

        [HttpPut("{id}")]
        public IActionResult OpenPack(Guid id, Pack pack)
        {
            var packToUpdate = _packRepository.GetAPackByPackId(id);

            if (packToUpdate == null) NotFound($"Could Not find Pack with the id {id} to update");

            var updatedPack = _packRepository.UpdateStatus(id, pack);
            return Ok(updatedPack);
        }


    }
}
