//import characters from './reducers/characters.js'
import { combineReducers } from 'redux';
import {gamesReducer,gameReducer,isFetchingGames} from './gamesReducer';

const rootReducer = combineReducers({
	platforms:gamesReducer,
	isFetching:isFetchingGames,
	game:gameReducer
	//characters: characters
});


export default rootReducer;
