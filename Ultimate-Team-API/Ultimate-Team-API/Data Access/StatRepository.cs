using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Models;
using Ultimate_Team_API.Models.ExternalPlayerAPI;
using Ultimate_Team_API.Models.ExternalStatAPI;

namespace Ultimate_Team_API.Data_Access
{
    public class StatRepository
    {
        readonly string _connectionString;
        private readonly PlayerRepository _playerRepo;

        public StatRepository(IConfiguration config, PlayerRepository playerRepo)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
            _playerRepo = playerRepo;
        }

        // Get All Players' Stats //
        internal IEnumerable<Stat> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players/_profile.json");

            var response = client.Get<AllStatsResponseData>(request);


            var stats = db.Query<Stat>(@"Select *
                                        From Stats");


            var apiStats = response.Data.league.standard.stats.latest;

            var newStat = new Stat();

            newStat.PPG = apiStats.ppg;
            newStat.APG = apiStats.apg;
            newStat.RPG = apiStats.rpg;
            newStat.SPG = apiStats.spg;
            newStat.BPG = apiStats.bpg;
            newStat.MPG = apiStats.mpg;
            newStat.GamesPlayed = apiStats.gamesPlayed;
            return stats;
        }

        // Get Player's Stats //
        internal Player GetStatsByPlayerId(string playerId)
        {
            // Establishes connection my database // 
            // Sets it to the variable 'db' //
            using var db = new SqlConnection(_connectionString);

            // This is the link to the API page I am using for the players //
            // Sets this to the variable of 'client' //
            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            try
            {
                // Get's player by Id // 
                // Uses the playerId param //
                // Sets this to the variable of 'player' //
                var player = _playerRepo.GetPlayerById(playerId);

                // sends request to third party api // 
                // This request is the playerApiId of the player we got in the above variable // 
                // Sets it to the variable 'request' //
                var request = new RestRequest($"players/{player.PlayerApiId}_profile.json");

                // This is the response of that data // 
                // Matches it to the data shap of the response data //
                // We pass it the request from above // 
                // Sets this to the variable 'response' //
                var response = client.Get<AllStatsResponseData>(request);

                // This is the specific endpoint of where we want to grab the data from the third party api // 
                // Sets it to the variable of apiStats //
                var apiStats = response.Data.league.standard.stats.latest;

                // establishes a new stat // 
                // that is set to the variable of 'stat' //
                var newStat = new Stat();
                
                // Sets the Stat model values to the api the endpoint values of the third party api from above //
                newStat.PPG = apiStats.ppg;
                newStat.APG = apiStats.apg;
                newStat.RPG = apiStats.rpg;
                newStat.SPG = apiStats.spg;
                newStat.BPG = apiStats.bpg;
                newStat.MPG = apiStats.mpg;
                newStat.GamesPlayed = apiStats.gamesPlayed;

                // The player model attribute Stats is set to an instance of each new stat //
                player.Stats = newStat;

                // Return the players information with their up to date stats //
                return player;
            }

            catch (Exception)
            {

                throw;
            }


            
        }
    }
}
