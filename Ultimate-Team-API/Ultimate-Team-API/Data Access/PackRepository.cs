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
    }
}
