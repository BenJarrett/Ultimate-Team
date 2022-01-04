import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import TeamCard from '../../components/TeamCard';
import { getAllWesternConferenceTeams } from '../../helpers/data/team/teamData';

function WesternTeamsView({ user }) {
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
          user={user}
          />
        ))}
      </div>
    </div>
  );
}

WesternTeamsView.propTypes = {
  wCTeamInfo: PropTypes.array,
  user: PropTypes.any
};
export default WesternTeamsView;
