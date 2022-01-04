import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';
import { GetPacksCards } from '../../helpers/data/card/cardData';
import CardsInPackCard from '../../components/CardsInPackCard';

function PacksCardsView() {
  const [allPackCards, setAllPackCards] = useState([]);
  const { id } = useParams();

  useEffect(() => {
    GetPacksCards(id).then((response) => setAllPackCards(response));
  }, []);

  return (
    <div>
      <div className='packCardsContainer'>
      {allPackCards.map((allPackCardsInfo) => (
          <CardsInPackCard
          key={allPackCardsInfo.id}
          {...allPackCardsInfo}
          />
      ))}
      </div>
    </div>
  );
}

PacksCardsView.propTypes = {
  user: PropTypes.any,
  allPackCardsInfo: PropTypes.array

};
export default PacksCardsView;
