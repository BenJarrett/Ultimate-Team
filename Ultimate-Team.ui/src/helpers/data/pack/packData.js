import axios from 'axios';
import { apiConfig } from '../../apiKeys';

const { apiUrl } = apiConfig;

const GetUsersUnopenedPacks = (id) => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/pack/unopened/user/${id}`).then((response) => resolve(response.data)).catch(reject);
});

export default GetUsersUnopenedPacks;
