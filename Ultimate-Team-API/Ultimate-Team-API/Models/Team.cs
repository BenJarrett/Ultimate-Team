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
        public string Id { get; set; }
        public string City { get; set; }
        public string TeamName { get; set; }
        public ConferenceType ConferenceType { get; set; }
        public string Conference { get; set; }
        public string TeamLogo { get; set; }
        public string TeamApiId { get; set; }
        public Card Cards { get; set; }
    }

    //public enum TeamName
    //{
    //    [EnumMember(Value = "Hawks")]
    //    AtlantaHawks,
    //    [EnumMember(Value = "Lakers")]
    //    LosAngelesLakers,
    //    [EnumMember(Value = "Grizzlies")]
    //    MemphisGrizzlies
    //}

    public enum ConferenceType
    {
        [EnumMember(Value = "Eastern")]
        EasternConference,
        [EnumMember(Value = "Western")]
        WesternConference
    }

}
