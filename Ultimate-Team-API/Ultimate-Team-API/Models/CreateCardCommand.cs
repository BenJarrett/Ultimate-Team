using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Ultimate_Team_API.Models
{
    public class CreateCardCommand
    {
        public string Id { get; set; }
        public Guid UserId { get; set; }
        public string PlayerId { get; set; }
        public Guid PackId { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))] public Tier Tier { get; set; }
        public string PlayerImage { get; set; }
    }
}
