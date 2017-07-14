import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const itemReducer = (state = [], action) => {
  Object.freeze(state);
  let dupState = {};
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return action.payload.items;
    default:
      return state;
  }
};


export default itemReducer;
