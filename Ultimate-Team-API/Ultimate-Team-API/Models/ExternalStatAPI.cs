using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ultimate_Team_API.Models.ExternalStatAPI
{
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
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

    public class Latest
    {
        public int seasonYear { get; set; }
        public int seasonStageId { get; set; }
        public string ppg { get; set; }
        public string rpg { get; set; }
        public string apg { get; set; }
        public string mpg { get; set; }
        public string topg { get; set; }
        public string spg { get; set; }
        public string bpg { get; set; }
        public string tpp { get; set; }
        public string ftp { get; set; }
        public string fgp { get; set; }
        public string assists { get; set; }
        public string blocks { get; set; }
        public string steals { get; set; }
        public string turnovers { get; set; }
        public string offReb { get; set; }
        public string defReb { get; set; }
        public string totReb { get; set; }
        public string fgm { get; set; }
        public string fga { get; set; }
        public string tpm { get; set; }
        public string tpa { get; set; }
        public string ftm { get; set; }
        public string fta { get; set; }
        public string pFouls { get; set; }
        public string points { get; set; }
        public string gamesPlayed { get; set; }
        public string gamesStarted { get; set; }
        public string plusMinus { get; set; }
        public string min { get; set; }
        public string dd2 { get; set; }
        public string td3 { get; set; }
    }

    public class CareerSummary
    {
        public string tpp { get; set; }
        public string ftp { get; set; }
        public string fgp { get; set; }
        public string ppg { get; set; }
        public string rpg { get; set; }
        public string apg { get; set; }
        public string bpg { get; set; }
        public string mpg { get; set; }
        public string spg { get; set; }
        public string assists { get; set; }
        public string blocks { get; set; }
        public string steals { get; set; }
        public string turnovers { get; set; }
        public string offReb { get; set; }
        public string defReb { get; set; }
        public string totReb { get; set; }
        public string fgm { get; set; }
        public string fga { get; set; }
        public string tpm { get; set; }
        public string tpa { get; set; }
        public string ftm { get; set; }
        public string fta { get; set; }
        public string pFouls { get; set; }
        public string points { get; set; }
        public string gamesPlayed { get; set; }
        public string gamesStarted { get; set; }
        public string plusMinus { get; set; }
        public string min { get; set; }
        public string dd2 { get; set; }
        public string td3 { get; set; }
    }

    public class PlayersApiTeam
    {
        public string teamId { get; set; }
        public string ppg { get; set; }
        public string rpg { get; set; }
        public string apg { get; set; }
        public string mpg { get; set; }
        public string topg { get; set; }
        public string spg { get; set; }
        public string bpg { get; set; }
        public string tpp { get; set; }
        public string ftp { get; set; }
        public string fgp { get; set; }
        public string assists { get; set; }
        public string blocks { get; set; }
        public string steals { get; set; }
        public string turnovers { get; set; }
        public string offReb { get; set; }
        public string defReb { get; set; }
        public string totReb { get; set; }
        public string fgm { get; set; }
        public string fga { get; set; }
        public string tpm { get; set; }
        public string tpa { get; set; }
        public string ftm { get; set; }
        public string fta { get; set; }
        public string pFouls { get; set; }
        public string points { get; set; }
        public string gamesPlayed { get; set; }
        public string gamesStarted { get; set; }
        public string plusMinus { get; set; }
        public string min { get; set; }
        public string dd2 { get; set; }
        public string td3 { get; set; }
    }

    public class Total
    {
        public string ppg { get; set; }
        public string rpg { get; set; }
        public string apg { get; set; }
        public string mpg { get; set; }
        public string topg { get; set; }
        public string spg { get; set; }
        public string bpg { get; set; }
        public string tpp { get; set; }
        public string ftp { get; set; }
        public string fgp { get; set; }
        public string assists { get; set; }
        public string blocks { get; set; }
        public string steals { get; set; }
        public string turnovers { get; set; }
        public string offReb { get; set; }
        public string defReb { get; set; }
        public string totReb { get; set; }
        public string fgm { get; set; }
        public string fga { get; set; }
        public string tpm { get; set; }
        public string tpa { get; set; }
        public string ftm { get; set; }
        public string fta { get; set; }
        public string pFouls { get; set; }
        public string points { get; set; }
        public string gamesPlayed { get; set; }
        public string gamesStarted { get; set; }
        public string plusMinus { get; set; }
        public string min { get; set; }
        public string dd2 { get; set; }
        public string td3 { get; set; }
    }

    public class Season
    {
        public int seasonYear { get; set; }
        public List<PlayersApiTeam> teams { get; set; }
        public Total total { get; set; }
    }

    public class RegularSeason
    {
        public List<Season> season { get; set; }
    }

    public class Stats
    {
        public Latest latest { get; set; }
        public CareerSummary careerSummary { get; set; }
        public RegularSeason regularSeason { get; set; }
    }

    public class Standard
    {
        public string teamId { get; set; }
        public Stats stats { get; set; }
    }

    public class League
    {
        public Standard standard { get; set; }
    }

    public class AllStatsResponseData
    {
        public Internal _internal { get; set; }
        public League league { get; set; }
    }
}
