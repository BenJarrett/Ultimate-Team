using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ultimate_Team_API.Models
{
    public class Stat
    {
        public Guid Id { get; set; }
        public string PlayerId { get; set; }
        public string PPG { get; set; }
        public string APG { get; set; }
        public string RPG { get; set; }
        public string BPG { get; set; }
        public string SPG { get; set; }
        public string MPG { get; set; }
        public string GamesPlayed { get; set; }
        public string StatApiId { get; set; }

    }
}
