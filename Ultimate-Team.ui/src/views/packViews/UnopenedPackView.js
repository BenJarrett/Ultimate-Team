import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';
import SinglePackCard from '../../components/SinglePackCard';
import GetUsersUnopenedPacks from '../../helpers/data/pack/packData';

function UnopenedPackView() {
  const [pack, setPack] = useState([]);
  const { id } = useParams();

  useEffect(() => {
    GetUsersUnopenedPacks(id).then((response) => setPack(response));
  }, []);

  return (
    <div>
      <div className='packsContainer'>
        {pack.map((packInfo) => (
          <SinglePackCard
          key={packInfo.id}
          {...packInfo}
          />
        ))}
      </div>
    </div>
  );
}

UnopenedPackView.propTypes = {
  user: PropTypes.any
};
export default UnopenedPackView;
