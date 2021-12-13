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
    public class TeamRepository
    {
        readonly string _connectionString;

        public TeamRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
        }

        // Get All Teams //
        internal IEnumerable<Models.Team> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021/");

            var request = new RestRequest("teams.json");

            var response = client.Get<AllTeamsResponseData>(request);


            var teams = db.Query<Models.Team>(@"Select *
                                        From Teams");
            var apiTeams = response.Data.league.standard;

            foreach (var team in teams)
            {
                var matchingApiteam = apiTeams.FirstOrDefault(t => t.teamId == team.TeamApiId);
                team.TeamName = matchingApiteam.nickname;
                team.Conference = matchingApiteam.confName;
                team.City = matchingApiteam.city;
            }
            return teams;
        }

    }
}
