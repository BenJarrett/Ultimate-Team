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

        // Get Single Player by Id
        internal object GetPlayerByTeamId(Guid id)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                        From Players
                        where id = @id";


            var player = db.QueryFirstOrDefault<Player>(sql, new { id });

            return player;
        }

        internal IEnumerable<Player> GetPlayersByTeamId(Guid teamId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Players
                WHERE teamId = @id";

            var players = db.Query<Player>(sql, new { id = teamId });

            return players;
        }
    }
}
