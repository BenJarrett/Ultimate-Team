import React from 'react';
import {
  Card,
  CardBody,
  CardTitle,
  CardImg,
} from 'reactstrap';

function AllCardsCard({ ...allCardsTeamInfo }) {
  return (
    <div>
      <Card>
    <CardImg
      alt="Card image cap"
      src={allCardsTeamInfo.cardImage}
      top
      width="100%"
    />
    <CardBody>
      <CardTitle tag="h5">
      {allCardsTeamInfo.tier}
      </CardTitle>
    </CardBody>
  </Card>
    </div>
  );
}

export default AllCardsCard;
