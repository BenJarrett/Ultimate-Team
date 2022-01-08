import React, { useState, useEffect } from 'react';
import { useParams, useHistory } from 'react-router-dom';
import { Button } from 'reactstrap';
import PropTypes from 'prop-types';
import { GetPacksCards } from '../../helpers/data/card/cardData';
import CardsInPackCard from '../../components/CardsInPackCard';

function PacksCardsView() {
  const [allPackCards, setAllPackCards] = useState([]);
  const { id } = useParams();
  const history = useHistory();

  useEffect(() => {
    GetPacksCards(id).then((response) => setAllPackCards(response));
  }, []);

  return (
    <div className='pack-btn'>
      <div className='packCardsContainer'>
      {allPackCards.map((allPackCardsInfo) => (
          <CardsInPackCard
          key={allPackCardsInfo.id}
          {...allPackCardsInfo}
          />
      ))}
      </div>
      <Button className="signIn"onClick={() => history.goBack()}>Continue</Button>
      </div>
  );
}

PacksCardsView.propTypes = {
  user: PropTypes.any,
  allPackCardsInfo: PropTypes.array

};
export default PacksCardsView;
