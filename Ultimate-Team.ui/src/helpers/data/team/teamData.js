import axios from 'axios';
import { apiConfig } from '../../apiKeys';

const { apiUrl } = apiConfig;

const getAllWesternConferenceTeams = () => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/team/conference/western`).then((response) => resolve(response.data)).catch(reject);
});

const GetAllEasternConferenceTeams = () => new Promise((resolve, reject) => {
  axios.get(`${apiUrl}/team/conference/eastern`).then((response) => resolve(response.data)).catch(reject);
});

export { getAllWesternConferenceTeams, GetAllEasternConferenceTeams };
