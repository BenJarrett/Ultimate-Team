import React from 'react';
import {
  Card,
  CardText,
  CardBody,
  CardTitle,
  CardImg,
  Button
} from 'reactstrap';

function SinglePackCard({ ...packInfo }) {
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
  <Button>Open Pack</Button>
    </div>
  );
}

export default SinglePackCard;
