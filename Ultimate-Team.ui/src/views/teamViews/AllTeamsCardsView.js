import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';
import GetAllUsersCardsForTeam from '../../helpers/data/card/cardData';
import AllCardsCard from '../../components/AllCardsCard';

function AllTeamsCardsView({ user }) {
  const [allTeamCards, setAllTeamCards] = useState([]);
  const { id } = useParams();

  console.warn(id);
  console.warn(user.id);
  useEffect(() => {
    GetAllUsersCardsForTeam(user.id, id).then((response) => setAllTeamCards(response));
  }, []);

  return (
    <div>
      <div className='teamsCardsContainer'>
        <h1>wErk bitch</h1>
        {allTeamCards.map((allCardsTeamInfo) => (
          <AllCardsCard
          key={allCardsTeamInfo.id}
          {...allCardsTeamInfo}
          />
        ))}
      </div>
    </div>
  );
}

AllTeamsCardsView.propTypes = {
  user: PropTypes.any
};
export default AllTeamsCardsView;
