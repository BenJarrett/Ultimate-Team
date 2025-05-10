using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Models;
using RestSharp;
using Ultimate_Team_API.Models.ExternalPlayerAPI;
using Ultimate_Team_API.Models.ExternalTeamAPI;


namespace Ultimate_Team_API.Data_Access
{
    public class PlayerRepository
    {
        readonly string _connectionString;

        public PlayerRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
        }

        // Get All Players //
        internal IEnumerable<Player> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);


            var players = db.Query<Player>(@"Select *
                                        From Players");

            var apiPlayers = response.league.standard;

            foreach (var player in players)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            }

            return players;
        }

        // Get Single Player by Id //
        internal Player GetPlayerById(string id)
        {
            // Establishes connection with the database //
            // Sets this to the variable 'db' // 
            using var db = new SqlConnection(_connectionString);

            // This is the link to the API page I am using for the players //
            // Sets this to the variable of 'client'
            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            // Dictates this request to the players end point of the api //
            // Sets this to the variable of 'request'
            var request = new RestRequest("players.json");

            // This is the response of that data // 
            // Matches it to the data shap of the response data //
            // Uses the prior variables //
            // Sets the response to the shape of All Players Response Data //
            var response = client.Get<AllPlayersResponseData>(request);

            // Selects all the Player table info from my database with the matching parameter // 
            // Sets this to the variable 'sql' //
            var sql = @"Select *
                        From Players
                        where id = @id";

            // Grabs the player matching the sql variable and splits on id //
            // Sets this to the variable 'player' //
            var player = db.QueryFirstOrDefault<Player>(sql, new { id });

            // This is the specific endpoint of where we want to grab the data from the third party api // 
            // Sets it to the variable of apiPlayers //
            var apiPlayers = response.league.standard;

            // This grabs the first player of the api with a personId that matches the playerApiId of my database //
            // This is set to the variable of 'matchingApiPlayer' //
            var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
            player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
            player.Weight = matchingApiPlayer.weightPounds;
            player.Position = matchingApiPlayer.pos;
            player.Age = matchingApiPlayer.dateOfBirthUTC;
            player.YearsPro = matchingApiPlayer.yearsPro;

            // returns the player with the new info from the third party API //
            return player;
        }

        internal IEnumerable<Player> GetFiveRandomPlayers(IEnumerable<string> playersToExclude)
        {
            // Establishes connection to the database //
            // Sets it to the variable of 'db'
            using var db = new SqlConnection(_connectionString);

            // This is the link to the API page I am using for the players //
            // Sets this to the variable of 'client'
            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            // Dictates this request to the players end point of the api //
            // Sets this to the variable of 'request'
            var request = new RestRequest("players.json");

            // Uses the prior variables //
            // Sets the response to the shape of All Players Response Data //
            var response = client.Get<AllPlayersResponseData>(request);

            // Selects all the players and all their info from my database //
            // Sets this to the variable of 'players'
            var players = db.Query<Player>(@"Select *
                                        From Players");

            // Sets request spot of the API to the variable 'apiPlayers' //
            // This list has a personId // 
            // The value of personId is set to the value of the playerApiId in the Players table of my databsae //
            // The playerApiId is the value I use to connect my database with the third party API //
            var apiPlayers = response.league.standard;

            // Loops through each player of my database that matches the player in the Thirdparty API and sets the Player Model attributes based on the real time data from the TPApi //
            foreach (var player in players)
            {
                // This grabs the first player of the api with a personId that matches the playerApiId of my database //
                // This is set to the variable of 'matchingApiPlayer' //
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);

                // Sets the Player Model attributes to the data from the matching player's attributes from the third Party Api //
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            }

            // This is the logic that basically says to grab players from the player list that do not contain any matching ids // 
            // Sets this to the variable of 'players' //
            // This is how I am preventing any duplicate players from being made whent the cards are made in the controller //
            players = players.Where(p => !playersToExclude.Contains(p.Id));

            // Takes that list players from the players virable above and grabs 5 random players from that list //
            // Sets it to the vairable of 'randomPlayers' //
            var randomPlayers = players.OrderBy(x => Guid.NewGuid()).Take(5);

            // Returns those five random players //
            return randomPlayers;

        }


        // Get All Players on a Specific Team //
        internal IEnumerable<Player> GetPlayersByTeamId(string teamId)
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);

            var sql = @"Select *
                From Players
                WHERE teamId = @id";

            var players = db.Query<Player>(sql, new { id = teamId });

            var apiPlayers = response.league.standard;


            foreach (var player in players)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            }


            return players;
        }

        // Get All Players in Western Confernece //
        internal IEnumerable<Player> GetPlayersInWesternConference()
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);


            var sql = @"Select *
                From Players p
					join Teams t
						on p.teamId = t.id
							where t.conferenceType = 1";



            var players = db.Query<Player>(sql);

            var apiPlayers = response.league.standard;

            foreach (var player in players)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
                player.TeamId = matchingApiPlayer.teamId;
            }


            return players;
        }

        // Get All Players in Eastern Conference //
        internal IEnumerable<Player> GetPlayersInEasternConference()
        {

            using var db = new SqlConnection(_connectionString);

            // 
            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);


            var sql = @"Select *
                From Players p
					join Teams t
						on p.teamId = t.id
							where t.conferenceType = 0";

            var players = db.Query<Player>(sql);

            var apiPlayers = response.league.standard;

            foreach (var player in players)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
                player.TeamId = matchingApiPlayer.teamId;
            }


            return players;
        }

        // Get Player by Card Id //
        internal IEnumerable<Player> GetPlayersCardsByCardId(string cardId)
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);

            var sql = @"Select *
                From Players
                WHERE cardId = @id";

            var players = db.Query<Player>(sql, new { id = cardId });

            var apiPlayers = response.league.standard;

            foreach (var player in players)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            }
            ;

            return players;
        }

        // Get All Players of a Specific User//
        internal IEnumerable<Player> GetUsersPlayersByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);

            var sql = @"Select p.*
                From Players p
                    join Cards c
                        on p.cardId = c.id
                            join Users u
                                on c.userId = u.id
                                    where u.id = @id";

            var cards = db.Query<Player>(sql, new { id = userId });

            var apiPlayers = response.league.standard;

            foreach (var player in cards)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            }
            ;

            return cards;
        }
    }
}
