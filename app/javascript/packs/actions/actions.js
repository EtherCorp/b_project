import * as types from './actionTypes';
import GameRetailAxios from '../utils/GameRetailAxios';

function fetchGamesSuccess(data){
	return{
		type: types.FETCH_GAMES_SUCCESS,
		data
	}
}
function fetchGameByIdSuccess(data){
	return{
		type: types.FETCH_GAME_BY_ID_SUCCESS,
		data
	}
}

function requestData() {
	return {type: types.REQ_DATA}
};

function receiveData(json) {
	return{
		type: types.RECV_DATA,
		data: json
	}
};

function receiveError(json) {
	return {
		type: types.RECV_ERROR,
		data: json
	}
};

export function gamesFetchData(url) {
	return function(dispatch) {
		dispatch(requestData());
		return GameRetailAxios.get('games/')
			.then(response => {
				dispatch(fetchGamesSuccess(response.data));
            },
            response => {
				dispatch(receiveError(response.data));
            })
	}
};
