using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Models;

namespace Ultimate_Team_API.Data_Access
{
    public class TeamRepository
    {
        readonly string _connectionString;

        public TeamRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
        }

        // Get All Players //
        internal IEnumerable<Team> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var teams = db.Query<Team>(@"Select *
                                        From Teams");

            return teams;
        }
    }
}
