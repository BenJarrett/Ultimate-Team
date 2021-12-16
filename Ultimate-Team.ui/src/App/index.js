import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import './App.scss';
import NavBar from '../components/NavBar';
import Routes from '../helpers/Routes';

function App() {
  return (
    <>
      <Router>
        <div className='App'>
          <NavBar/>
          <Routes
          />
        </div>
      </Router>
    </>
  );
}

export default App;
