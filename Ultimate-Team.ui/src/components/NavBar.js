import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  Nav,
  NavbarBrand,
  Button,
  NavItem
} from 'reactstrap';
import { signInUser, signOutUser } from '../helpers/auth';

const NavBar = ({ user, setUser }) => {
  const [isOpen, setIsOpen] = useState(false);

  const toggle = () => setIsOpen(!isOpen);

  return (
    <div>
      <Navbar className="nav" light expand="md">
        <NavbarBrand href="/">
          <h1>Home</h1>
        </NavbarBrand>
        <NavbarToggler onClick={toggle} />
        <Collapse isOpen={isOpen} navbar>
          <Nav className="mr-auto" navbar>
            <NavItem>
              <Link className="nav-link" to="/western-conference-teams">Western Conference Teams</Link>
            </NavItem>
            <NavItem>
              <Link className="nav-link" to="/eastern-conference-teams">Eastern Conference Teams</Link>
            </NavItem>
            <NavItem>
              <Link className="nav-link" to={`/unopened-packs/${user?.id}`}>Packs</Link>
            </NavItem>

          </Nav><div className='auth-btn-container'>
                {
                  // eslint-disable-next-line no-nested-ternary
                  user
                    ? <NavItem className='nav-cart-signout'>
                        <Button className="signOut" onClick={signOutUser}>Sign Out</Button>
                      </NavItem>
                    : <Button className="signIn" onClick={() => signInUser(setUser)}>Sign In</Button>
                }
              </div>
        </Collapse>
      </Navbar>
    </div>
  );
};

NavBar.propTypes = {
  user: PropTypes.any,
  setUser: PropTypes.func
};

export default NavBar;
