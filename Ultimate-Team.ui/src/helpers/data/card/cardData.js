import axios from 'axios';
import { apiConfig } from '../../apiKeys';

const { apiUrl } = apiConfig;

const GetAllUsersCardsForTeam = (id, teamId) => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/card/user/team/${id}/${teamId}`).then((response) => resolve(response.data)).catch(reject);
});

const GetSingleCard = (id) => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/card/${id}`)
    .then((response) => resolve(response.data))
    .catch((error) => reject(error));
});
export { GetAllUsersCardsForTeam, GetSingleCard };
