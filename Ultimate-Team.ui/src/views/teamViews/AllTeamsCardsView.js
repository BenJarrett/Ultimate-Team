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
              <Col className='singleCardContainer' md={7}>
                <h5>
                  {playerInfo.firstName} {playerInfo.lastName}
                </h5>
                <div>
                  <Card>
                    <CardImg
                      alt="Select A Card"
                      src={singleCard.cardImage}
                      top
                      width="100%"
                    />
                  </Card>
                </div>
              </Col>
              <Col md={5} >
                <h5>Player Info</h5>
                 <div> Position | {playerInfo.position} </div>
                 <div> Height | {playerInfo.height} </div>
                 <div> Weight | {playerInfo.weight} </div>
                 <div> Years Pro | {playerInfo.yearsPro} </div>

              </Col>
            </Row>
            <Row>
              <Col md={12}>
                <h5>Current Stats</h5>
                <div>
                <div> PPG | {playerInfo.stats.ppg} </div>
                <div> APG | {playerInfo.stats.apg} </div>
                <div> RPG | {playerInfo.stats.rpg} </div>
                <div> SPG | {playerInfo.stats.spg} </div>
                <div> BPG | {playerInfo.stats.bpg} </div>
                <div> MPG | {playerInfo.stats.mpg} </div>
                <div> Games Played | {playerInfo.stats.gamesPlayed} </div>

                </div>
              </Col>
            </Row>
          </Col>
          <Col md={8}>
        <h1>Your Cards</h1>
          <div className='teamsCardsContainer'>
        {allTeamCards.map((allCardsTeamInfo) => (
          <div key={allCardsTeamInfo.id}>
                <Card className='playerCard'
                >
                <CardImg
                  alt="Select A Card"
                  src={allCardsTeamInfo.cardImage}
                  top
                  width="100%"
                />
                <CardBody>
                  <CardTitle tag="h5">
                  {allCardsTeamInfo.tier}
                  </CardTitle>
                </CardBody>
                  </Card>
                  <Button onClick={() => handleClick(allCardsTeamInfo.id, allCardsTeamInfo.playerId)} >Select Card</Button>
                  </div>
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
