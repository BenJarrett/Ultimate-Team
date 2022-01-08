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
  NavItem,
  UncontrolledDropdown,
  DropdownItem,
  DropdownMenu,
  DropdownToggle
} from 'reactstrap';
import { signInUser, signOutUser } from '../helpers/auth';

const NavBar = ({ user, setUser }) => {
  const [isOpen, setIsOpen] = useState(false);

  const toggle = () => setIsOpen(!isOpen);

  return (
    <div>
      <Navbar className="nav" light expand="md">
      <NavbarBrand href="/">
          <img
          src="https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/ultimateteam2.png?alt=media&token=2a62f84d-92c4-4380-bdc3-c49347470d38"
          width="170"
          className="d-inline-block align-top"
          alt="ultimate-team-logo"
        />
        </NavbarBrand>
        <NavbarToggler onClick={toggle} className='item'/>
        <Collapse isOpen={isOpen} navbar>
          <Nav className="ml-auto" navbar>
            {
              user
                ? <>
                    <UncontrolledDropdown inNavbar nav>
                <DropdownToggle caret nav>
                  Card Collection
                </DropdownToggle>
                <DropdownMenu right className='item'>
                  <DropdownItem className='dropdown-text'>
                    <Link className='dropdown-text' to="/eastern-conference-teams">
                      Eastern Conference
                    </Link>
                  </DropdownItem>
                  <DropdownItem>
                  <Link className='dropdown-text' to="/western-conference-teams">
                      Western Conference
                    </Link>
                  </DropdownItem>
                </DropdownMenu>
              </UncontrolledDropdown>
              <NavItem>
                <Link className='nav-link' to={`/unopened-packs/${user.id}`}>Unopened Packs </Link>
              </NavItem>
              </>
                : ''
            }

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
