import React from 'react';
import {
  Card,
  CardText,
  CardBody,
  CardTitle,
  CardImg,
} from 'reactstrap';

function TeamCard({ ...wCTeamInfo }) {
  return (
    <div>
      <Card>
    <CardImg
      alt="Card image cap"
      src={wCTeamInfo.teamLogo}
      top
      width="100%"
    />
    <CardBody>
      <CardTitle tag="h5">
      {wCTeamInfo.teamName}
      </CardTitle>
      <CardText>
      {wCTeamInfo.city}
      </CardText>
      <CardText>
        <small className="text-muted">
        {wCTeamInfo.conference}
        </small>
      </CardText>
    </CardBody>
  </Card>
    </div>
  );
}

export default TeamCard;
