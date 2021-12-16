import React, { useState } from 'react';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  Nav,
  NavbarBrand,
  Button,
} from 'reactstrap';
// import { createOrder } from '../helpers/data/OrderData';
import { signInUser, signOutUser } from '../helpers/auth';

const NavBar = () => {
  const [isOpen, setIsOpen] = useState(false);

  // const [orders, setOrders] = useState({
  //   totalCost: '',
  //   paymentId: null,
  //   completed: false,
  // });

  // useEffect(() => {
  //   createOrder(orders).then((response) => setOrders(response));
  // }, []);
  // console.warn(orders);
  const toggle = () => setIsOpen(!isOpen);

  return (
    <div>
      <Navbar className='navigation' light expand='md'>
        <NavbarBrand href='/'>
        </NavbarBrand>
        <NavbarToggler onClick={toggle} />
        <Collapse isOpen={isOpen} navbar>
          <Nav className='mr-auto' navbar>
          </Nav>
        </Collapse>
          <>
              <>
                <Button color='warning' outline onClick={signOutUser}>
                  Sign Out
                </Button>
              </>
              <Button color='primary' onClick={signInUser}>
                Sign In
              </Button>
          </>

      </Navbar>
    </div>
  );
};

export default NavBar;
