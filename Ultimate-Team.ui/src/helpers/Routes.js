import React from 'react';
import { Route, Switch } from 'react-router-dom';
import EasternTeamsView from '../views/EasternTeamView';
import LandingPage from '../views/LandingPage';
import WesternTeamsView from '../views/WesternTeamView';

export default function Routes() {
  return (
    <div>
      <Switch>
        <Route exact path='/'component={() => <LandingPage />} />
        <Route exact path='/western-conference-teams' component={() => <WesternTeamsView /> } />
        <Route exact path='/eastern-conference-teams' component={() => <EasternTeamsView /> } />
      </Switch>
    </div>
  );
}
