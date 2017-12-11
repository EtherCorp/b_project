import axios from 'axios'

const GameRetailAxios = axios.create({
  //baseURL: 'https://localhost:5000/api/v1/'
  baseURL: 'http://5a1397e6748faa001280a7e6.mockapi.io/api/v1/'
});

export default GameRetailAxios