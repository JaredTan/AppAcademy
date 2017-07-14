import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const defaultState = () => ({
  entities: {},
  currentPoke: null,
});

const pokemonReducer = (state = defaultState(), action) => {
  Object.freeze(state);
  let dupState = {};
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, {entities: action.pokemon});
    case RECEIVE_SINGLE_POKEMON:
      const singlePoke = action.payload.pokemon;
      return merge({}, state, {
      entities: {[singlePoke.id]: singlePoke},
      currentPoke : singlePoke.id
    });
    default:
      return state;
  }
};


export default pokemonReducer;
