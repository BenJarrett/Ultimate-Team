using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ultimate_Team_API.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace Ultimate_Team_API.Data_Access
{
    public class UserRepository
    {
        readonly string _connectionString;

        public UserRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("UltimateTeam");
        }

        // Get All Users //
        internal IEnumerable<User> GetAll()
        {
            using var db = new SqlConnection(_connectionString);

            var users = db.Query<User>(@"Select *
                                        From Users
                                        Order By lastName");

            return users;
        }
    }
}
