using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using RestSharp;
using System;
using System.Collections.Generic;
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

        internal object UpdateCardsPlayerId(string id, Card card)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"update Cards set
                                     PlayerId = @playerId
                                        output inserted.Id
                                     Where Id = @id";

            card.Id = id;

            var parameters = new
            {
                PlayerId = card.PlayerId,
                Id = card.Id
            };

            var updatedCard = db.QueryFirstOrDefault<Card>(sql, parameters);
            return updatedCard;
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
            // Establishes a connection with the database //
            using var db = new SqlConnection(_connectionString);

            // Selects the cards that have a matching userId from the database to the params given. The id of the user in this situation //
            // Sets the results of this to the variable 'sql' //
            var sql = @"Select *
                From Cards
                WHERE userId = @id";

            // Executes the query and returns a Card data type. Takes in the sql variable as a param and splits on the userId //
            // Sets the results to the variable of 'cards'
            var cards = db.Query<Card>(sql, new { id = userId });

            // Returns our variable of cards //
            return cards;
        }

        internal void AddCard(Card newCard)
        {
            // Establishes Connection with my database //
            using var db = new SqlConnection(_connectionString);

            // Inserts the given information into the Cards table of my database //
            // Outputs the created Id of the created cards //
            // Sets this to the variable of 'sql' //
            var sql = @"INSERT INTO [dbo].[Cards]
                                       (
                                        [playerId]
                                       ,[tier]
                                       ,[cardImage]
                                       ,[userId]
                                       ,[packId])
	                            output inserted.Id
                                 VALUES
		                            (@playerId, @tier, @cardImage, @userId, @packId)";

            // sets the value of the new card to the value of the scalar variables from the insterted information for the new card //
            // Sets this to the variable of 'parameters' //
            var parameters = new
            {
                PlayerId = newCard.PlayerId,
                Tier = newCard.Tier,
                CardImage = newCard.CardImage,
                UserId = newCard.UserId,
                PackId = newCard.PackId
            };

            // Executes the sql with the given parameters and selects a single string //
            // Set to the variable of id //
            var id = db.ExecuteScalar<string>(sql, parameters);

            // Set the id variable equal to the newCard.Id //
            newCard.Id = id;
        }


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

            var apiPlayers = response.league.standard;

            return cards;
        }
    }

}
