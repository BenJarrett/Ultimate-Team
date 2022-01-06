import axios from 'axios';
import { apiConfig } from '../../apiKeys';

const { apiUrl } = apiConfig;

const GetUsersUnopenedPacks = (id) => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/pack/unopened/user/${id}`).then((response) => resolve(response.data)).catch(reject);
});

const OpenPack = (id) => new Promise((resolve, reject) => {
  axios.put(`${apiUrl}/pack/${id}`).then((response) => resolve(response.data)).catch(reject);
});

export { GetUsersUnopenedPacks, OpenPack };
