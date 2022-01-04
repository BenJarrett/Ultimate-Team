/* eslint-disable arrow-body-style */
import axios from 'axios';
import firebase from 'firebase/app';
import { createUser } from './data/user/userData';

axios.interceptors.request.use((request) => {
  // eslint-disable-next-line no-undef
  const token = localStorage.getItem('token');

  if (token != null) {
    request.headers.Authorization = `Bearer ${token}`;
  }
  return request;
}, (err) => {
  return Promise.reject(err);
});

const signInUser = (setUser) => {
  const provider = new firebase.auth.GoogleAuthProvider();
  firebase.auth().signInWithPopup(provider).then((user) => {
    const u = user.user;
    if (user.additionalUserInfo?.isNewUser) {
      const userInfo = {
        imageUrl: u?.photoURL,
        firstName: u?.displayName.split(' ')[0],
        lastName: u?.displayName.split(' ')[1],
        customerEmail: u?.email,
        status: true,
        customerCreation: u.metadata.creationTime,
        googleId: u?.uid,
      };
      createUser(userInfo).then(setUser);
      window.location.href = '/';
    }
  });
};
const signOutUser = () => new Promise((resolve, reject) => {
  firebase.auth().signOut().then(resolve).catch(reject);
});
export { signInUser, signOutUser };
