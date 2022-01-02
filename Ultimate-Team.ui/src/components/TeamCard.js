import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import {
  Card,
  CardText,
  CardBody,
  CardTitle,
  CardImg,
  Button,
  Container
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
      <Card>
    <CardImg
      alt="Card image cap"
      src={wCTeamInfo.teamLogo}
      top
      width="100%"
    />
    <CardBody>
      <CardTitle tag="h5">
      {wCTeamInfo.teamName}
      </CardTitle>
      <CardText>
      {wCTeamInfo.city}
      </CardText>
      <CardText>
        <small className="text-muted">
        {wCTeamInfo.conference}
        </small>
      </CardText>

      <Button onClick={() => handleClick() }>View Cards</Button>
    </CardBody>
  </Card>
  <h6>
  {allTeamCards.length}/15 Cards Collected
  </h6>
  </Container>
    </div>
  );
}

TeamCard.propTypes = {
  wCTeamInfo: PropTypes.array,
  user: PropTypes.any
};
export default TeamCard;
