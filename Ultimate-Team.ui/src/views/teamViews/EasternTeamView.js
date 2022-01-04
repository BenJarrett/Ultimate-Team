import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import TeamCard from '../../components/TeamCard';
import { GetAllEasternConferenceTeams } from '../../helpers/data/team/teamData';

function EasternTeamsView({ user }) {
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
          user={user}
          />
        ))}
      </div>
    </div>
  );
}

EasternTeamsView.propTypes = {
  user: PropTypes.any
};

export default EasternTeamsView;
