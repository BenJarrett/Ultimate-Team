import React, { useState, useEffect } from 'react';
import TeamCard from '../../components/TeamCard';
import { getAllWesternConferenceTeams } from '../../helpers/data/team/teamData';

function WesternTeamsView() {
  const [wCTeam, setWcTeam] = useState([]);

  useEffect(() => {
    getAllWesternConferenceTeams().then((response) => setWcTeam(response));
  }, []);

  return (
    <div>
      <div className='teamsContainer'>
        {wCTeam.map((wCTeamInfo) => (
          <TeamCard
          key={wCTeamInfo.id}
          {...wCTeamInfo}
          />
        ))}
      </div>
    </div>
  );
}

export default WesternTeamsView;
