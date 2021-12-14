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

        // Get A Single user by Id //
        internal User GetSingleUserById(Guid id)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"Select *
                        From Users
                        where id = @id";


            var user = db.QueryFirstOrDefault<User>(sql, new { id });

            return user;
        }

        // Add new User //
        internal void Add(User newUser)
        {

            using var db = new SqlConnection(_connectionString);

            var sql = @"insert into users(FirstName, LastName, CustomerEmail, Status)
                        output inserted.Id
                        values (@FirstName, @LastName, @CustomerEmail, @Status)";

            var id = db.ExecuteScalar<Guid>(sql, newUser);


            newUser.Id = id;

        }

        // Update User by Id //
        internal User UpdateUser(Guid id, User user)
        {
            using var db = new SqlConnection(_connectionString);

            var sql = @"update Users
                        Set FirstName = @firstName,
	                    LastName = @lastName,
	                    CustomerEmail = @customerEmail,
                        Status = @status
                        output inserted.*
                     Where id = @id";


            user.Id = id;

            var updatedUser = db.QuerySingleOrDefault<User>(sql, user);

            return updatedUser;
        }
    }
}
