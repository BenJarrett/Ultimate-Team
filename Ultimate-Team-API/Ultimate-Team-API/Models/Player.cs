using System;
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
        public decimal Age { get; set; }
        public string Height { get; set; }
        public string Weight { get; set; }
        public string Wingspan { get; set; }
        public decimal YearsPro { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))] public Position Position { get; set; }
        public Guid CardId { get; set; }
        public Guid PlayerApiId { get; set; }
    }

    public enum Position
    {
        [EnumMember(Value = "PG")]
        Point_Guard,
        [EnumMember(Value = "SG")]
        Shooting_Guard,
        [EnumMember(Value = "SF")]
        Small_Forward,
        [EnumMember(Value = "PF")]
        Power_Forward,
        [EnumMember(Value = "C")]
        Center,
    }
}
