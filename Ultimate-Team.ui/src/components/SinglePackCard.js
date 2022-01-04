import React from 'react';
import PropTypes from 'prop-types';
import {
  Card,
  CardText,
  CardBody,
  CardTitle,
  CardImg,
  Button
} from 'reactstrap';
import { useHistory } from 'react-router-dom';

function SinglePackCard({ ...packInfo }) {
  const history = useHistory();

  const handleClick = () => {
    history.push(`/packCards/${packInfo.id}`);
  };

  return (
    <div>
      <Card>
    <CardImg
      alt="Card image cap"
      src={packInfo.packImage}
      top
      width="100%"
    />
    <CardBody>
      <CardTitle tag="h5">
      {packInfo.packName} Pack
      </CardTitle>
      <CardText>
      </CardText>
    </CardBody>
  </Card>
  <Button onClick={() => handleClick() }>Open Pack</Button>
    </div>
  );
}

SinglePackCard.propTypes = {
  wCTeamIpackInfonfo: PropTypes.array
};
export default SinglePackCard;
