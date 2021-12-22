import axios from 'axios';
import { apiConfig } from '../../apiKeys';

const { apiUrl } = apiConfig;

const GetPlayersStats = (playerId) => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/stat/${playerId}`)
    .then((response) => resolve(response.data))
    .catch((error) => reject(error));
});

export default GetPlayersStats;
