using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Data_Access;
using Ultimate_Team_API.Models;

namespace Ultimate_Team_API.Controllers
{
    [Route("api/card")]
    [ApiController]
    public class CardController : ControllerBase
    {

        CardRepository _repo;
        UserRepository _userRepo;

        public CardController(CardRepository repo, UserRepository userRepo)
        {
            _repo = repo;
            _userRepo = userRepo;
        }

        // Get All Cards //
        [HttpGet]
        public IActionResult GetAllCards()
        {
            return Ok(_repo.GetAll());
        }

        // Get All Cards of a Specific Player //
        [HttpGet("player/{id}")]
        public IActionResult GetAllPlayerCards(string id)
        {
            return Ok(_repo.GetCardByPlayerId(id));
        }

        // Get User's Cards//
        [HttpGet("user/{id}")]
        public IActionResult GetAllUsersCards(Guid id)
        {
            return Ok(_repo.GetCardsByUserId(id));
        }

        // Get User's Cards by TeamId//
        [HttpGet("user/team/{id}/{teamId}")]
        public IActionResult GetAllUsersCardsByTeam(Guid id, string teamId)
        {
            return Ok(_repo.GetUsersCardsByTeamId(id, teamId));
        }

        // Get A Card by Card Id //
        [HttpGet("{id}")]
        public IActionResult GetASingleCard(string id)
        {
            var card = _repo.GetACardByCardId(id);

            if (card == null)
            {
                return NotFound($"No Card with the Id of {id} was found.");
            }

            return Ok(card);
        }

        // Get All Cards of a Specific Pack by PackId //
        [HttpGet("pack/{id}")]
        public IActionResult GetAllCardsInPack(Guid id)
        {
            return Ok(_repo.GetCardsByPackId(id));
        }

        //[HttpPut("{id}")]
        //public IActionResult AssignCardToUser(Guid id, Card card)
        //{
        //    var cardToupdate = _repo.GetCardsByPackId(id);
        //    var userToAssign = _userRepo.GetSingleUserById(id);

        //    if (cardToupdate == null) NotFound($"Could Not find Cards with the pack id {id} to assign ");

        //    //var updatedCards = _repo.AssignToUser(id, card);
        //    return Ok(updatedCards);
        //}

    }
}
