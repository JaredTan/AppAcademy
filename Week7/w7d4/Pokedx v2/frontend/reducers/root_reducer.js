import {combineReducers} from 'redux';
import pokemonReducer from './pokemon_reducer';
import itemReducer from './item_reducer';

const rootReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemReducer
});

export default rootReducer;
