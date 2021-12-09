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

            var players = db.Query<Player>(@"Select *
                                        From Players");

            return players;
        }
    }
}
