using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ultimate_Team_API.Models.ExternalTeamAPI
{
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 

    public class ApiTeam
    {
        public string city { get; set; }
        public string fullName { get; set; }
        public bool isNBAFranchise { get; set; }
        public string confName { get; set; }
        public string tricode { get; set; }
        public string teamShortName { get; set; }
        public string divName { get; set; }
        public bool isAllStar { get; set; }
        public string nickname { get; set; }
        public string urlName { get; set; }
        public string teamId { get; set; }
        public string altCityName { get; set; }
    }

    public class League
    {
        public List<ApiTeam> standard { get; set; }
    }

    public class Internal
    {
        public string xsltInCache { get; set; }
        public string xsltTransformTimeMillis { get; set; }
        public string xsltForceRecompile { get; set; }
        public string endToEndTimeMillis { get; set; }
        public string consolidatedDomKey { get; set; }
        public string xsltCompileTimeMillis { get; set; }
        public string xslt { get; set; }
        public string igorPath { get; set; }
        public string pubDateTime { get; set; }
    }

    public class AllTeamsResponseData
    {
        public League league { get; set; }
        public Internal _internal { get; set; }
    }





}
