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

            //foreach (var stat in stats)
            //{
            //    var matchingApiPlayer = apiPlayers.FirstOrDefault(p => p.personId == player.PlayerApiId);
            //    player.Height = $"{matchingApiPlayer.heightFeet}' {matchingApiPlayer.heightInches}\"";
            //    player.Weight = matchingApiPlayer.weightPounds;
            //    player.Position = matchingApiPlayer.pos;
            //    player.Age = matchingApiPlayer.dateOfBirthUTC;
            //    player.YearsPro = matchingApiPlayer.yearsPro;
            //}

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
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            try
            {
                var player = _playerRepo.GetPlayerById(playerId);

                var request = new RestRequest($"players/{player.PlayerApiId}_profile.json");


                var response = client.Get<AllStatsResponseData>(request);

                var apiStats = response.Data.league.standard.stats.latest;

                var newStat = new Stat();

                //foreach (var stat in playersStats)
                //{
                
                newStat.PPG = apiStats.ppg;
                newStat.APG = apiStats.apg;
                newStat.RPG = apiStats.rpg;
                newStat.SPG = apiStats.spg;
                newStat.BPG = apiStats.bpg;
                newStat.MPG = apiStats.mpg;
                newStat.GamesPlayed = apiStats.gamesPlayed;
                //stat.APG = matchingApiStat.apg;
                //stat.RPG = matchingApiStat.rpg;
                //stat.BPG = matchingApiStat.bpg;
                //stat.SPG = matchingApiStat.spg;
                //stat.MPG = matchingApiStat.mpg;
                //stat.GamesPlayed = matchingApiStat.gamesPlayed;
                //}

                player.Stats = newStat;

                return player;
            }

            catch (Exception)
            {

                throw;
            }


            
        }
    }
}
