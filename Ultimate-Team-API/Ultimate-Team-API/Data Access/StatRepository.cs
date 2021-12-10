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
    public class StatRepository
    {
        readonly string _connectionString;

        public StatRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
        }

        // Get All Players //
        internal IEnumerable<Stat> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var stats = db.Query<Stat>(@"Select *
                                        From Stats");

            return stats;
        }

        // Get Player's Stats //
        internal IEnumerable<Stat> GetStatsByPlayerId(Guid playerId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Stats
                WHERE playerId = @playerId";

            var stats = db.Query<Stat>(sql, new { playerId = playerId });;

            return stats;
        }
    }
}
