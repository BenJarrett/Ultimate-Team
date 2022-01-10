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


        // Getting the user that is logged in, figuring out which cards a user has //
        // Getting 5 random players that the user does not have cards for, creating cards for those players // 
        // Adding them to the repository of cards and updating the pack //
        [HttpPut("{id}")]
        public IActionResult OpenPack(Guid id)
        {
            // Grabs the pack that we want to update with a prior method //
            var packToUpdate = _packRepository.GetAPackByPackId(id);

            // If this pack doesn't exist, it will return this string //
            if (packToUpdate == null) NotFound($"Could Not find Pack with the id of {id} to update");

            // Get's the user that is logged in by the user's Google id // 
            // This is done by getting the token id that is generated for each user that logs into firebase //
            var user = _userRepository.GetUserByGoogleId(GoogleId);

            // Grabs the cards that the user already has. In this case, we set the params of this method to the id of the variable 'user' we created above //
            // After that, using Linq, it selects grabs the playerId of each of these cards //
            var usersCards = _cardRepository.GetCardsByUserId(user.Id).Select(cards => cards.PlayerId);

            // Grabs 5 random players based on the playerIds of the variable 'usersCard' above //
            var players = _playerRepo.GetFiveRandomPlayers(usersCards);

            // Loops through the players and creates a card // 
            // Set's the cards attributes to the information of the player in my Database //
            // Sets this the variable 'cards'
            var cards = players.Select(p =>
                new Card
                {
                    PackId = id,
                    PlayerId = p.Id,
                    CardImage = p.PlayerImage,
                    UserId = user.Id,
                    // Sets the tier to the method below //
                    Tier = GetRandomTier()
                });

            // Loops through the cards we created above and adds them to the database // 
            foreach (var card in cards)
            {
                _cardRepository.AddCard(card);
            }

            // updates the pack we grabbed in the packToUpdate variable and changes its Status value to 1 //
            // This changes the status to an opened pack, which means the user can no longer access this pack after opening it and getting the cards from it //
            var updatedPack = _packRepository.UpdateStatus(id, packToUpdate);

            // Returns the cards we created above //
            return Ok(cards);
        }


        // Generates a random tier based on the Enum of tiers in the Player model //
        private static Tier GetRandomTier()
        {
            // sets a new array of the tiers //
            var tiers = new[] { Tier.Gold, Tier.Sapphire, Tier.Diamond, Tier.Amethyst, Tier.Emerald };

            // Gets one random tier from the variable above // 
            var randomTier = tiers.OrderBy(x => Guid.NewGuid()).First();

            // Returns that random tier //
            return randomTier;
        }
    }
}
