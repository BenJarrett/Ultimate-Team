import React from 'react';
import {
  Card,
  CardText,
  CardBody,
  CardTitle,
  CardImg,
  Button
} from 'reactstrap';
import { useHistory } from 'react-router-dom';

function TeamCard({ ...wCTeamInfo }) {
  const history = useHistory();

  const handleClick = () => {
    history.push(`/teamCards/${wCTeamInfo.id}`);
  };
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
      <Button onClick={() => handleClick() }>View Cards</Button>
    </CardBody>
  </Card>
    </div>
  );
}

export default TeamCard;
