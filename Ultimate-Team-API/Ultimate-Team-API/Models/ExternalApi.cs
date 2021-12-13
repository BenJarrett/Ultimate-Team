using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ultimate_Team_API.Models.ExternalApi
{
    public class Internal
    {
        public string pubDateTime { get; set; }
        public string igorPath { get; set; }
        public string xslt { get; set; }
        public string xsltForceRecompile { get; set; }
        public string xsltInCache { get; set; }
        public string xsltCompileTimeMillis { get; set; }
        public string xsltTransformTimeMillis { get; set; }
        public string consolidatedDomKey { get; set; }
        public string endToEndTimeMillis { get; set; }
    }

    public class TeamSitesOnly
    {
        public string playerCode { get; set; }
        public string posFull { get; set; }
        public string displayAffiliation { get; set; }
        public string freeAgentCode { get; set; }
    }

    public class Team
    {
        public string teamId { get; set; }
        public string seasonStart { get; set; }
        public string seasonEnd { get; set; }
    }

    public class Draft
    {
        public string teamId { get; set; }
        public string pickNum { get; set; }
        public string roundNum { get; set; }
        public string seasonYear { get; set; }
    }

    public class ApiPlayer
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string temporaryDisplayName { get; set; }
        public string personId { get; set; }
        public string teamId { get; set; }
        public string jersey { get; set; }
        public bool isActive { get; set; }
        public string pos { get; set; }
        public string heightFeet { get; set; }
        public string heightInches { get; set; }
        public string heightMeters { get; set; }
        public string weightPounds { get; set; }
        public string weightKilograms { get; set; }
        public string dateOfBirthUTC { get; set; }
        public TeamSitesOnly teamSitesOnly { get; set; }
        public List<Team> teams { get; set; }
        public Draft draft { get; set; }
        public string nbaDebutYear { get; set; }
        public string yearsPro { get; set; }
        public string collegeName { get; set; }
        public string lastAffiliation { get; set; }
        public string country { get; set; }
    }

    public class League
    {
        public List<ApiPlayer> standard { get; set; }
    }

    public class AllPlayersResponseData
    {
        public Internal _internal { get; set; }
        public League league { get; set; }
    }


}
