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
    public class CardRepository
    {
        readonly string _connectionString;

        public CardRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
        }

        // Get All Cards //
        internal IEnumerable<Card> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var players = db.Query<Card>(@"Select *
                                        From Cards");

            return players;
        }

        // Get All Cards of a Specific Player//
        internal IEnumerable<Card> GetCardByPlayerId(Guid playerId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Cards
                WHERE playerId = @id";

            var cards = db.Query<Card>(sql, new { id = playerId });

            return cards;
        }

        internal IEnumerable<Card> GetCardsByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Cards
                WHERE userId = @id";

            var cards = db.Query<Card>(sql, new { id = userId });

            return cards;
        }
    }
}
