using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;


namespace Ultimate_Team_API.Models
{
    public class Card
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public Guid PackId { get; set; }
        public Guid PlayerId { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))] public Tier Tier { get; set; }
        public string CardImage { get; set; }
    }
    
    public enum Tier
    {
        [EnumMember(Value = "Gold")]
        Gold,
        [EnumMember(Value = "Emerald")]
        Emerald,
        [EnumMember(Value = "Sapphire")]
        Sapphire,
        [EnumMember(Value = "Amethyst")]
        Amethyst,
        [EnumMember(Value = "Diamond")]
        Diamond,
        [EnumMember(Value = "Pink Diamond")]
        Pink_Diamond,
    }
}
