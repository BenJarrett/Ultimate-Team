import React from 'react';
import {
  Card,
  CardText,
  CardBody,
  CardTitle,
  CardImg,
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
      {packInfo.packName}
      </CardTitle>
      <CardText>
      {packInfo.packType}
      </CardText>
    </CardBody>
  </Card>
    </div>
  );
}

export default SinglePackCard;
