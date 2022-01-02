import React, { useState, useEffect } from 'react';
import firebase from 'firebase/app';
import { BrowserRouter as Router } from 'react-router-dom';
import 'firebase/auth';
import './App.scss';
import NavBar from '../components/NavBar';
import Routes from '../helpers/Routes';
import { getSingleUserByGoogleId } from '../helpers/data/user/userData';
// import { GetAllUsersCardsForTeam } from '../helpers/data/card/cardData';

function App() {
  // When you set up firebase add setUser method and change useState to null.
  const [user, setUser] = useState({});
  const [allTeamCards, setAllTeamCards] = useState([]);
  // Checking for authenticated users. You must set up firebase authentication for this to work!
  useEffect(() => {
    firebase.auth().onAuthStateChanged((authed) => {
      if (authed) {
        // eslint-disable-next-line no-undef
        authed.getIdToken().then((token) => localStorage.setItem('token', token));
        getSingleUserByGoogleId(authed.uid).then((response) => setUser(response));
      } else {
        setUser(false);
      }
    });
  }, []);

  // useEffect(() => {
  //   GetAllUsersCardsForTeam(user.id, id).then((response) => setAllTeamCards(response));
  // }, []);

  return (
    <>
      <Router>
        <div className='App'>
          <NavBar user={user} setUser={setUser}/>
          <Routes
          user={user} setUser={setUser} allTeamCards={allTeamCards} setAllTeamCards={setAllTeamCards}
          />
        </div>
      </Router>
    </>
  );
}

export default App;
