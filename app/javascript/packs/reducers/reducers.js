//import characters from './reducers/characters.js'
import { combineReducers } from 'redux';
import gamesReducer from './gamesReducer';

const rootReducer = combineReducers({
	platforms:gamesReducer,
	//characters: characters
});


export default rootReducer;
