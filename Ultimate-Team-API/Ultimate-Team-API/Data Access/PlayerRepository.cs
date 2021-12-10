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
        // Get All Players on a Specific Team //
        internal IEnumerable<Player> GetPlayersByTeamId(Guid teamId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Players
                WHERE teamId = @id";

            var players = db.Query<Player>(sql, new { id = teamId });

            return players;
        }

        // Get All Players in Western Confernece //
        internal IEnumerable<Player> GetPlayersInWesternConference()
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Players p
					join Teams t
						on p.teamId = t.id
							where t.conference = 1";

            var players = db.Query<Player>(sql);

            return players;
        }

        // Get All Players in Eastern Conference //
        internal IEnumerable<Player> GetPlayersInEasternConference()
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Players p
					join Teams t
						on p.teamId = t.id
							where t.conference = 0";

            var players = db.Query<Player>(sql);

            return players;
        }

        // Get Player by Card Id //
        internal IEnumerable<Player> GetPlayersByCardId(Guid cardId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Players
                WHERE cardId = @id";

            var players = db.Query<Player>(sql, new { id = cardId });

            return players;
        }

    }
}
