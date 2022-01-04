using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Ultimate_Team_API.Models
{
    public class Pack
    {
        public Guid Id { get; set; }
        public string PackName { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))] public PackType PackType { get; set; }
        public string PackImage { get; set; }
        public Card Cards { get; set; } 
        public bool Status { get; set; }

    }

    public enum PackType
    {
        [EnumMember(Value = "Starter")]
        Starter_Pack,
        [EnumMember(Value = "Christmas")]
        Christmas_Pack
    }
}
