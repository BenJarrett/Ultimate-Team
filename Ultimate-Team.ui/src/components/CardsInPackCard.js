import React from 'react';
import PropTypes from 'prop-types';
import {
  Card,
  CardImg,
} from 'reactstrap';

function CardsInPackCard({ ...packInfo }) {
  console.warn(packInfo);
  return (
    <div>
      <div>
      <Card>
    <CardImg
      alt="Card image cap"
      src={packInfo.cardImage}
      top
      width="100%"
    />
  </Card>
  </div>
    </div>
  );
}

CardsInPackCard.propTypes = {
  packInfo: PropTypes.array
};
export default CardsInPackCard;
