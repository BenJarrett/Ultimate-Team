import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';
import {
  Card, CardImg, Col, Container, Row, ToastHeader, Toast, ToastBody, Table
} from 'reactstrap';
import { GetAllUsersCardsForTeam, GetSingleCard } from '../../helpers/data/card/cardData';
import GetPlayersStats from '../../helpers/data/stat/statData';

function AllTeamsCardsView({ user }) {
  const [allTeamCards, setAllTeamCards] = useState([]);
  const [singleCard, setSingleCard] = useState({ });
  const [playerInfo, setPlayerInfo] = useState({ stats: { } });

  const { id } = useParams();

  useEffect(() => {
    GetAllUsersCardsForTeam(user.id, id).then((response) => setAllTeamCards(response));
  }, []);
  const handleClick = (cardId, playerId) => {
    GetSingleCard(cardId).then((response) => setSingleCard(response));
    GetPlayersStats(playerId).then((response) => setPlayerInfo(response));
  };

  const renderSidebar = () => (<Col md={4}>
    <Row className='teamCards'>
      <Col className='singleCardContainer' md={7}>
      <ToastHeader className='player-name'>
    {playerInfo.firstName} {playerInfo.lastName}
</ToastHeader>
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

      <Col md={12}>
        <div>
        <Table className='table caption-top'
        bordered
        hover
        responsive
        size="sm"
        striped>
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
          <Col md={8} className='cardColumn'>
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
              {allTeamCards.length === 0 && <h2>You have No Cards!</h2>}

      </div>

          </Col>
      </Row>
      </Container>
    </div>
  );
}
AllTeamsCardsView.propTypes = {
  user: PropTypes.any,
  allTeamCardsTeamInfo: PropTypes.any
};
export default AllTeamsCardsView;
