using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Ultimate_Team_API.Models
{
    public class Team
    {
        public Guid Id { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))] public TeamName TeamName { get; set; }
        public Conference Conference { get; set; }
        public string TeamLogo { get; set; }
        public string TeamApiId { get; set; }
    }

    public enum TeamName
    {
        [EnumMember(Value = "Hawks")]
        AtlantaHawks,
        [EnumMember(Value = "Lakers")]
        LosAngelesLakers,
        [EnumMember(Value = "Grizzlies")]
        MemphisGrizzlies
    }

    public enum Conference
    {
        [EnumMember(Value = "Eastern")]
        EasternConference,
        [EnumMember(Value = "Western")]
        WesternConference
    }

}
