import React from 'react';
import { Route, Switch } from 'react-router-dom';
import PropTypes from 'prop-types';
import EasternTeamsView from '../views/teamViews/EasternTeamView';
import LandingPage from '../views/LandingPage';
import WesternTeamsView from '../views/teamViews/WesternTeamView';
import UnopenedPackView from '../views/packViews/UnopenedPackView';
import AllTeamsCardsView from '../views/teamViews/AllTeamsCardsView';
import PacksCardsView from '../views/packViews/PacksCardsView';

export default function Routes({ user }) {
  return (
    <div>
      <Switch>
        <Route exact path='/'component={() => <LandingPage />} />
        <Route exact path='/western-conference-teams' component={() => <WesternTeamsView user={user}/> } />
        <Route exact path='/eastern-conference-teams' component={() => <EasternTeamsView user={user} /> } />
        <Route exact path='/unopened-packs/:id' component={() => <UnopenedPackView user={user} />} user={user} />
        <Route path='/teamCards/:id'component={() => <AllTeamsCardsView user={user} />} user={user} />
        <Route path='/packCards/:id'component={() => <PacksCardsView user={user} />} user={user} />

      </Switch>
    </div>
  );
}

Routes.propTypes = {
  user: PropTypes.any
};
