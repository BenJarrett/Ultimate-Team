﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Ultimate_Team_API.Models
{
    public class Player
    {
        public Guid Id { get; set; }
        public Guid TeamId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PlayerImage { get; set; }
        public string Age { get; set; }
        public string Height { get; set; }
        public string Weight { get; set; }
        public string YearsPro { get; set; }
        public string Position { get; set; }
        public Guid CardId { get; set; }
        public string PlayerApiId { get; set; }
    }

}
