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

        // Get A Single Pack by PAck Id
        internal Pack GetAPackByCardId(Guid id)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                        From Packs
                        where id = @id";


            var pack = db.QueryFirstOrDefault<Pack>(sql, new { id });

            return pack;
        }

        // Get User's Packs //
        internal IEnumerable<Pack> GetUsersPacksByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select p.*
                From Packs p
                    join Cards c
                        on p.id = c.packId
                            join Users u
                                on c.userId = u.id
                                    where u.id = @id";

            var packs = db.Query<Pack>(sql, new { id = userId });

            return packs;
        }

        // Get User's Unopened Packs //
        internal IEnumerable<Pack> GetUsersUnopenedPacksByUserId(Guid userId)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select p.*
                From Packs p
                    join Cards c
                        on p.id = c.packId
                            join Users u
                                on c.userId = u.id
                                    where u.id = @id
                                        and p.status = 0";

            var packs = db.Query<Pack>(sql, new { id = userId });

            return packs;
        }

        // Get User's Opened Packs //
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
