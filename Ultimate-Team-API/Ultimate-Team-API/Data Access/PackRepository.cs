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
    public class PackRepository
    {
        readonly string _connectionString;

        public PackRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
        }

        // Get All Packs //
        internal IEnumerable<Pack> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var packs = db.Query<Pack>(@"Select *
                                        From Packs");

            return packs;
        }

        // Get A Single Pack by Pack Id
        internal Pack GetAPackByPackId(Guid id)
        {
            // Establishes the connection with the database
            using var db = new SqlConnection(_connectionString);

            // Selecting all the information from the pack that is equal to the pack id given in the params //
            // Sets the result from the database to the variable 'sql' //
            var sql = @"Select *
                        From Packs
                        where id = @id";

            // Grabs the first pack based upon the sql param and splits on the id //
            // Sets this to the variable of 'pack'
            var pack = db.QueryFirstOrDefault<Pack>(sql, new { id });

            // Returns our result //
            return pack;
        }

        // Get User's Packs //
        internal IEnumerable<Pack> GetUsersPacksByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select p.*
                From Packs p
                where p.userid = @id";
             
            var packs = db.Query<Pack>(sql, new { id = userId });

            return packs;
        }

        // Get User's Unopened Packs //
        internal IEnumerable<Pack> GetUsersUnopenedPacksByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select p.*
                From Packs p
                                    where userId = @id
                                        and p.status = 0";

            var packs = db.Query<Pack>(sql, new { id = userId });

            return packs;
        }

        internal Pack UpdateStatus(Guid id, Pack pack)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"update Packs set
                                        Status = 1 

                                     output inserted.Id
                                     Where Id = @id";

            pack.Id = id;

            var parameters = new
            {
                id
            };

            var openedPack = db.QueryFirstOrDefault<Pack>(sql, parameters);
            return openedPack;
        }

        //Get User's Opened Packs 
        internal IEnumerable<Pack> GetUsersOpenedPacksByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select p.*
                From Packs p
                    join Cards c
                        on p.id = c.packId
                            join Users u
                                on c.userId = u.id
                                    where u.id = @id
                                        and p.status = 1";

            var packs = db.Query<Pack>(sql, new { id = userId });

            return packs;
        }
    }
}
