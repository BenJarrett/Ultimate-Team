import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';
import {
  Card, CardImg, Col, Container, Row, ToastHeader, Toast, ToastBody, Table
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
  const handleClick = (cardId, playerId) => {
    GetSingleCard(cardId).then((response) => setSingleCard(response));
    GetPlayersStats(playerId).then((response) => setPlayerInfo(response));
  };

  const renderSidebar = () => (<Col md={4} className='teamCards'>
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
        {/* <h5>Player Info</h5>
         <div> Position - {playerInfo.position} </div>
         <div> Height - {playerInfo.height} </div>
         <div> Weight - {playerInfo.weight} </div>
         <div> Years Pro - {playerInfo.yearsPro} </div> */}
         <div className="mt-xl-4 p-lg-1 rounded bg-docs-transparent-grid">
<Toast>
<ToastHeader>
Player Info
</ToastHeader>
<ToastBody>
Position - {playerInfo.position}
<hr />
Height - {playerInfo.height}
< hr />
Weight - {playerInfo.weight} lb
< hr />
Years Pro - {playerInfo.yearsPro}
< hr />
</ToastBody>
</Toast>
</div>

      </Col>
    </Row>
    <Row>
      <Col md={12}>
        <div>
        {/* <div> PPG - {playerInfo.stats.ppg} </div>
        <div> APG - {playerInfo.stats.apg} </div>
        <div> RPG - {playerInfo.stats.rpg} </div>
        <div> SPG - {playerInfo.stats.spg} </div>
        <div> BPG - {playerInfo.stats.bpg} </div>
        <div> MPG - {playerInfo.stats.mpg} </div>
        <div> Games Played - {playerInfo.stats.gamesPlayed} </div> */}
        <Table className='table caption-top'
bordered
hover
responsive
size="sm"
striped
>
<caption>2021-2022 Statistics</caption>
<thead>
<tr>
<th className='table-dark'>
PPG
</th>
<th className='table-dark'>
APG
</th>
<th className='table-dark'>
RPG
</th>
<th className='table-dark'>
SPG
</th>
<th className='table-dark'>
BPG
</th>
<th className='table-dark'>
MPG
</th>
<th className='table-dark'>
Games Played
</th>
</tr>
</thead>
<tbody>
<tr>
<td>
{playerInfo.stats.ppg}
</td>
<td>
{playerInfo.stats.apg}
</td>
<td>
{playerInfo.stats.rpg}
</td>
<td>
{playerInfo.stats.spg}
</td>
<td>
{playerInfo.stats.bpg}
</td>
<td>
{playerInfo.stats.mpg}
</td>
<td>
{playerInfo.stats.gamesPlayed}
</td>
</tr>
</tbody>
</Table>
        </div>
      </Col>
    </Row>
  </Col>);

  return (
    <div>
      <Container>
        <Row>
          {playerInfo?.firstName ? renderSidebar() : <></>}
          <Col md={8}>
        <h1>Your Cards</h1>
          <div className='teamsCardsContainer'>
        {allTeamCards.map((allCardsTeamInfo) => (
          <div key={allCardsTeamInfo.id}>
                <Card onClick={() => handleClick(allCardsTeamInfo.id, allCardsTeamInfo.playerId) } style={ { cursor: 'pointer' } } className='playerCard'
                >

                <CardImg
                  alt="Select A Card"
                  src={allCardsTeamInfo.cardImage}
                  top
                  width="100%"
                />
                      <div className="rounded" >
                          <ToastHeader className='toast-header'>
                          { allCardsTeamInfo.tier}
                          </ToastHeader>
                      </div>
                      <div className="rounded" >
                          <ToastHeader className='toast-header'>
                          { allCardsTeamInfo.teamName}
                          </ToastHeader>
                      </div>
                  </Card>
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
