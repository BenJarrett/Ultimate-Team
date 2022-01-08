import React from 'react';
import PropTypes from 'prop-types';
import {
  Card,
  CardImg,
  ToastHeader
} from 'reactstrap';

function CardsInPackCard({ allTeamCardsTeamInfo, ...packInfo }) {
  return (
    <div>
      <div>
      <Card className='playerCard'
                >

                <CardImg className='playerCardImage'
                  alt="Select A Card"
                  src={packInfo.cardImage}
                  top
                  width="100%"
                />
                      <div className="rounded" >
                          <ToastHeader className='toast-header'>
                          { packInfo.tier}
                          </ToastHeader>
                      </div>
                      <div className="rounded" >
                          <ToastHeader className='toast-header'>
                          { packInfo.teamName}
                          </ToastHeader>
                      </div>
                  </Card>
  </div>
    </div>
  );
}

CardsInPackCard.propTypes = {
  packInfo: PropTypes.array,
  allTeamCardsTeamInfo: PropTypes.array
};
export default CardsInPackCard;
