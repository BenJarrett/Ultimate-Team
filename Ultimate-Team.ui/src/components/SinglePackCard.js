import React from 'react';
import PropTypes from 'prop-types';
import {
  Card,
  CardImg,
  ToastHeader
} from 'reactstrap';
import { useHistory } from 'react-router-dom';
import { OpenPack } from '../helpers/data/pack/packData';

function SinglePackCard({ ...packInfo }) {
  const history = useHistory();

  const handleClick = () => {
    OpenPack(packInfo.id).then(() => history.push(`/packCards/${packInfo.id}`));
  };

  return (
    <div>
        <Card onClick={() => handleClick() } style={ { cursor: 'pointer' } } className='playerCard'>
      <CardImg
        alt="Card image cap"
        src={packInfo.packImage}
        top
        width="100%"
      />
      <div className="rounded" >
          <ToastHeader className='toast-header'>
          { packInfo.packName} Pack
          </ToastHeader>
      </div>
        </Card>
    </div>
  );
}

SinglePackCard.propTypes = {
  wCTeamIpackInfonfo: PropTypes.array
};
export default SinglePackCard;
