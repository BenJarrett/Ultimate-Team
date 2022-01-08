import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import {
  Card,
  CardImg,
  Container,
  Progress,
  Toast,
  ToastHeader,
  ToastBody
} from 'reactstrap';
import { useHistory } from 'react-router-dom';
import { GetAllUsersCardsForTeam } from '../helpers/data/card/cardData';

function TeamCard({ user, ...wCTeamInfo }) {
  const [allTeamCards, setAllTeamCards] = useState([]);
  const history = useHistory();

  const handleClick = () => {
    history.push(`/teamCards/${wCTeamInfo.id}`);
  };

  useEffect(() => {
    GetAllUsersCardsForTeam(user.id, wCTeamInfo.id).then((response) => setAllTeamCards(response));
  }, []);

  return (
    <div>
      <Container>
        <br />
  <br />
      <Card onClick={() => handleClick() } style={ { cursor: 'pointer' } }>
      <ToastHeader className="toast-header">
      {wCTeamInfo.teamName}
      </ToastHeader>
      <hr />
    <CardImg
      alt="Card image cap"
      src={wCTeamInfo.teamLogo}
      top
      width="100%"
    />
    < hr />
      <div className="p-3 my-2 rounded">
    <Toast className='toast'>
      <ToastHeader className='toast-header'>
      {wCTeamInfo.city}
      </ToastHeader>
      <ToastBody class>
      {allTeamCards.length}/15 Cards Collected
      </ToastBody>
    </Toast>
  </div>
  </Card>
  <div className='progress-bar-container1'>
    <Card className='progress-bar-card'>
      <h5>
      Card Progression
      </h5>
      <h6 className='progress-bar-heading'>
        <div className='progress-bar-container'>
        <Progress
        barClassName='progress-bar'
        max={15}
        animated
        color="warning"
        value={allTeamCards.length}
      />
      </div>
      </h6></Card>
      </div>
  </Container>
    </div>
  );
}

TeamCard.propTypes = {
  wCTeamInfo: PropTypes.array,
  user: PropTypes.any
};
export default TeamCard;
