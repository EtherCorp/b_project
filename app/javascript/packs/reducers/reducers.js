//import characters from './reducers/characters.js'
import { combineReducers } from 'redux';
import {gamesReducer,isFetchingGames} from './gamesReducer';

const rootReducer = combineReducers({
	platforms:gamesReducer,
	isFetching:isFetchingGames
	//characters: characters
});


export default rootReducer;
