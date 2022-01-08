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
        public string GoogleId => User.FindFirst(claim => claim.Type == "user_id").Value;

        PackRepository _packRepository;
        CardRepository _cardRepository;
        UserRepository _userRepository;
        PlayerRepository _playerRepo;

        public PackController(PackRepository packRepo, CardRepository cardRepo, UserRepository userRepo, PlayerRepository playerRepo)
        {
            _packRepository = packRepo;
            _cardRepository = cardRepo;
            _userRepository = userRepo;
            _playerRepo = playerRepo;
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
        public IActionResult OpenPack(Guid id)
        {
            var packToUpdate = _packRepository.GetAPackByPackId(id);
            if (packToUpdate == null) NotFound($"Could Not find Pack with the id {id} to update");

            var user = _userRepository.GetUserByGoogleId(GoogleId);
            var usersCards = _cardRepository.GetCardsByUserId(user.Id).Select(cards => cards.PlayerId);
            var players = _playerRepo.GetFiveRandomPlayers(usersCards);

            var cards = players.Select(p =>
                new Card
                {
                    PackId = id,
                    PlayerId = p.Id,
                    CardImage = p.PlayerImage,
                    UserId = user.Id,
                    Tier = GetRandomTier()
                });

            foreach (var card in cards)
            {
                _cardRepository.AddCard(card);
            }


            var updatedPack = _packRepository.UpdateStatus(id, packToUpdate);

            return Ok(cards);
        }



        private static Tier GetRandomTier()
        {
            var tiers = new[] { Tier.Sapphire, Tier.Gold, Tier.Diamond, Tier.Amethyst, Tier.Emerald };
            var randomTier = tiers.OrderBy(x => Guid.NewGuid()).First();
            return randomTier;
        }
    }
}
