using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/card")]
    [ApiController]
    public class CardController : ControllerBase
    {

        CardRepository _repo;

        public CardController(CardRepository repo)
        {
            _repo = repo;
        }

        // Get All Cards //
        [HttpGet]
        public IActionResult GetAllCards()
        {
            return Ok(_repo.GetAll());
        }

        // Get All Cards of a Specific Player //
        [HttpGet("player/{id}")]
        public IActionResult GetAllPlayerCards(Guid id)
        {
            return Ok(_repo.GetCardByPlayerId(id));
        }

        // Get User's Cards//
        [HttpGet("user/{id}")]
        public IActionResult GetAllUsersCards(Guid id)
        {
            return Ok(_repo.GetCardsByUserId(id));
        }
    }
}
