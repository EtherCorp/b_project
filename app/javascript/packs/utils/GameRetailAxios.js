import axios from 'axios'

const GameRetailAxios = axios.create({
  baseURL: 'https://localhost:5000/api/v1/'
});

export default GameRetailAxios