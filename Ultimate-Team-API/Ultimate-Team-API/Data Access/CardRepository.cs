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
        internal IEnumerable<Card> GetCardByPlayerId(string playerId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Cards
                WHERE playerId = @id";

            var cards = db.Query<Card>(sql, new { id = playerId });

            return cards;
        }

        // Get A Single Card by Card Id
        internal Card GetACardByCardId(string id)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                        From Cards
                        where id = @id";


            var card = db.QueryFirstOrDefault<Card>(sql, new { id });

            return card;
        }

        internal object GetUsersCardsByTeamIdLength(string teamId)
        {
            throw new NotImplementedException();
        }

        // Get All Cards In A Pack by Pack Id //
        internal IEnumerable<Card> GetCardsByPackId(Guid packId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Cards
                WHERE packId = @id";

            var cards = db.Query<Card>(sql, new { id = packId });


            return cards;
        }

        // Get all Users' Cards //
        internal IEnumerable<Card> GetCardsByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                From Cards
                WHERE userId = @id";

            var cards = db.Query<Card>(sql, new { id = userId });

            return cards;
        }

        //internal Card AssignToUser(Guid id, Card card)
        //{
        //    using var db = new SqlConnection(_connectionString);

        //    var sql = @"update Cards set 
        //                User.Id = @userId

        //            output inserted.Id
        //            Where Id = @id";

        //    card.Id = id;
        //}

        

        // Get Teams Cards of a Specific User //
        internal IEnumerable<Card> GetUsersCardsByTeamId(Guid userId, string teamId)
        {
            using var db = new SqlConnection(_connectionString);

            var client = new RestClient("http://data.nba.net/data/10s/prod/v1/2021");

            var request = new RestRequest("players.json");

            var response = client.Get<AllPlayersResponseData>(request);

            var sql = @"Select c.*
                From Cards c
                    join Players p
                        on c.playerId = p.id
                            join Teams t
                                on p.teamId = t.id
                                   join Users u
                                       on c.userId = u.id
                                          where u.id = @id
                                             and t.id = @tId";
            var cards = db.Query<Card>(sql, new { id = userId, tId = teamId });

            var apiPlayers = response.Data.league.standard;

            return cards;
        }
    }

}
