using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ultimate_Team_API.Models
{
    public class User
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CustomerEmail { get; set; }
        public DateTime CustomerCreated { get; set; }
        public bool Status { get; set; } = true;
        public string GoogleId { get; set; }
    }
}
