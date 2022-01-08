import React from 'react';
import { Route, Switch } from 'react-router-dom';
import PropTypes from 'prop-types';
import EasternTeamsView from '../views/teamViews/EasternTeamView';
import LandingPage from '../views/LandingPage';
import WesternTeamsView from '../views/teamViews/WesternTeamView';
import UnopenedPackView from '../views/packViews/UnopenedPackView';
import AllTeamsCardsView from '../views/teamViews/AllTeamsCardsView';
import PrivateRoute from './PrivateRoute';
import PacksCardsView from '../views/packViews/PacksCardsView';

export default function Routes({ user }) {
  return (
    <div>
      <Switch>
        <Route exact path='/'component={() => <LandingPage />} />
        <PrivateRoute exact path='/western-conference-teams' component={() => <WesternTeamsView user={user}/> } user={user}/>
        <PrivateRoute exact path='/eastern-conference-teams' component={() => <EasternTeamsView user={user} /> } user={user}/>
        <PrivateRoute exact path='/unopened-packs/:id' component={() => <UnopenedPackView user={user} />} user={user} />
        <PrivateRoute path='/teamCards/:id'component={() => <AllTeamsCardsView user={user} />} user={user} />
        <PrivateRoute path='/packCards/:id'component={() => <PacksCardsView user={user} />} user={user} />

      </Switch>
    </div>
  );
}

Routes.propTypes = {
  user: PropTypes.any
};
