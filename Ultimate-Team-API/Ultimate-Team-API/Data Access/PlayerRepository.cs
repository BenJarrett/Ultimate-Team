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

            var apiPlayers = response.Data.league.standard;

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
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);

            var sql = @"Select *
                        From Players
                        where id = @id";


            var player = db.QueryFirstOrDefault<Player>(sql, new { id });

            var apiPlayers = response.Data.league.standard;

                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;

            return player;
        }

        internal IEnumerable<Player> GetFiveRandomPlayers(IEnumerable<string> playersToExclude)
        {
            using var db = new SqlConnection(_connectionString);


            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);

            var players = db.Query<Player>(@"Select *
                                        From Players");

            var apiPlayers = response.Data.league.standard;

            
            foreach (var player in players)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            }

            players = players.Where(p => !playersToExclude.Contains(p.Id));


            var randomPlayers = players.OrderBy(x => Guid.NewGuid()).Take(5);

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

            var apiPlayers = response.Data.league.standard;


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

            var apiPlayers = response.Data.league.standard;
            
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

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);


            var sql = @"Select *
                From Players p
					join Teams t
						on p.teamId = t.id
							where t.conferenceType = 0";

            var players = db.Query<Player>(sql);

            var apiPlayers = response.Data.league.standard;

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

            var apiPlayers = response.Data.league.standard;

            foreach (var player in players)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            };

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

            var apiPlayers = response.Data.league.standard;

            foreach (var player in cards)
            {
                var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
                player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
                player.Weight = matchingApiPlayer.weightPounds;
                player.Position = matchingApiPlayer.pos;
                player.Age = matchingApiPlayer.dateOfBirthUTC;
                player.YearsPro = matchingApiPlayer.yearsPro;
            };

            return cards;
        }
    }
}
