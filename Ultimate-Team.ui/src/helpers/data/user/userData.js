import axios from 'axios';
import { apiConfig } from '../../apiKeys';

const { apiUrl } = apiConfig;

const getUsers = () => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/user/`).then((response) => resolve(response.data)).catch(reject);
});

const getSingleUser = (id) => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/user/${id}`)
    .then((response) => resolve(response.data))
    .catch((error) => reject(error));
});

const createUser = (userObj) => new Promise((resolve, reject) => {
  axios.post(`${apiUrl}/user`, userObj).then((response) => resolve(response.data)).catch(reject);
});

const updateUser = (id, userObj) => new Promise((resolve, reject) => {
  axios.put(`${apiUrl}/user/${id}`, userObj).then(resolve).catch(reject);
});

const getSingleUserByGoogleId = (id) => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/user/uid/${id}`).then((response) => resolve(response.data)).catch(reject);
});

export {
  getUsers, getSingleUser, createUser, updateUser, getSingleUserByGoogleId
};
