import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';
import {
  Card, CardBody, CardImg, CardTitle, Col, Container, Row
} from 'reactstrap';
import { GetAllUsersCardsForTeam, GetSingleCard } from '../../helpers/data/card/cardData';
import AllCardsCard from '../../components/AllCardsCard';

function AllTeamsCardsView({ user }) {
  const [allTeamCards, setAllTeamCards] = useState([]);
  const [currentCardId, setCurrentCardId] = useState();
  const [singleCard, setSingleCard] = useState({});

  const { id } = useParams();

  useEffect(() => {
    GetAllUsersCardsForTeam(user.id, id).then((response) => setAllTeamCards(response));
  }, []);

  useEffect(() => {
    GetSingleCard(currentCardId).then((response) => setSingleCard(response));
  }, [currentCardId]);

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
                    {singleCard.tier}
                    </CardTitle>
                  </CardBody>
                  </Card>
                </div>
              </Col>
              <Col>
                <h1>Info</h1>
                  {singleCard.info}
              </Col>
            </Row>
            <Row>
              <Col>
                <h1>Stats</h1>
              </Col>
            </Row>
          </Col>
          <Col md={8}>
        <h1>Your Cards</h1>
          <div className='teamsCardsContainer'>
        {allTeamCards.map((allCardsTeamInfo) => (
          <AllCardsCard
          key={allCardsTeamInfo.id}
          setCurrentCardId={setCurrentCardId}
          {...allCardsTeamInfo}
          />
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