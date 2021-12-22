import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';
import {
  Card, CardBody, CardImg, CardTitle, Col, Container, Row, Button
} from 'reactstrap';
import { GetAllUsersCardsForTeam, GetSingleCard } from '../../helpers/data/card/cardData';
// import AllCardsCard from '../../components/AllCardsCard';
import GetPlayersStats from '../../helpers/data/stat/statData';

function AllTeamsCardsView({ user }) {
  const [allTeamCards, setAllTeamCards] = useState([]);
  // const [currentCardId, setCurrentCardId] = useState();
  const [singleCard, setSingleCard] = useState({ });
  // const [currentPlayerId, setCurrentPlayerId] = useState();
  const [playerInfo, setPlayerInfo] = useState({ stats: { } });

  const { id } = useParams();

  useEffect(() => {
    GetAllUsersCardsForTeam(user.id, id).then((response) => setAllTeamCards(response));
  }, []);

  // useEffect(() => {
  //   GetSingleCard(currentCardId).then((response) => setSingleCard(response));
  //   GetPlayersStats(currentPlayerId).then((response) => setPlayerInfo(response));
  // }, [currentCardId, currentPlayerId]);

  const handleClick = (cardId, playerId) => {
    GetSingleCard(cardId).then((response) => setSingleCard(response));
    GetPlayersStats(playerId).then((response) => setPlayerInfo(response));
  };

  console.warn(playerInfo);
  return (
    <div>
      <Container>
        <Row>
          <Col md={4} className='teamCards'>
            <Row>
              <Col className='singleCardContainer'>
                <h1>Card</h1>
                <div>
                  <Card>
                    <CardImg
                      alt="Card image cap"
                      src={singleCard.cardImage}
                      top
                      width="100%"
                    />
                  <CardBody>
                    <CardTitle tag="h5">
                    <h6> {playerInfo.firstName} {playerInfo.lastName} </h6>
                    </CardTitle>
                  </CardBody>
                  </Card>
                </div>
              </Col>
              <Col>
                <h1>Info</h1>
                 <h6> Position - {playerInfo.position}</h6>
                 <h6> Height - {playerInfo.height}</h6>
                 <h6> Weight - {playerInfo.weight}</h6>
                 <h6> Years Pro - {playerInfo.yearsPro}</h6>

              </Col>
            </Row>
            <Row>
              <Col>
                <h1>Stats</h1>
                <h4> {playerInfo.stats.apg}</h4>
              </Col>
            </Row>
          </Col>
          <Col md={8}>
        <h1>Your Cards</h1>
          <div className='teamsCardsContainer'>
        {allTeamCards.map((allCardsTeamInfo) => (
                <Card key={allCardsTeamInfo.id}
                >
                <CardImg
                  alt="Card image cap"
                  src={allCardsTeamInfo.cardImage}
                  top
                  width="100%"
                />
                <CardBody>
                  <CardTitle tag="h5">
                  {allCardsTeamInfo.tier}
                  </CardTitle>
                </CardBody>
                <Button onClick={() => handleClick(allCardsTeamInfo.id, allCardsTeamInfo.playerId)} >Select Card</Button>
                {/* <Button onClick={() => allCardsTeamInfo.setCurrentPlayerId(allCardsTeamInfo.playerId)} >Select Card</Button> */}
                  </Card>
        ))}
      </div>
          </Col>
      </Row>
      </Container>
    </div>
  );
}

AllTeamsCardsView.propTypes = {
  user: PropTypes.any
};
export default AllTeamsCardsView;
