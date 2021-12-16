import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LandingPage from '../views/LandingPage';

export default function Routes() {
  return (
    <div>
      <Switch>
        <Route path='/'component={() => <LandingPage />} />

      </Switch>
    </div>
  );
}
