import React, { useState, useEffect } from 'react';
import TeamCard from '../components/TeamCard';
import { GetAllEasternConferenceTeams } from '../helpers/data/team/teamData';

function EasternTeamsView() {
  const [eCTeam, setEcTeam] = useState([]);

  useEffect(() => {
    GetAllEasternConferenceTeams().then((response) => setEcTeam(response));
  }, []);

  return (
    <div>
      <div className='teamsContainer'>
        {eCTeam.map((eCTeamInfo) => (
          <TeamCard
          key={eCTeam.id}
          {...eCTeamInfo}
          />
        ))}
      </div>
    </div>
  );
}

export default EasternTeamsView;
