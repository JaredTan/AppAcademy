
import { values } from 'lodash';

export const selectAllPokemon = ({ pokemon }) => {
  return values( pokemon.entities );
};

export const selectSinglePokemon = ({ pokemon }, id) => {
  return pokemon.entities[id] || {};
};

export const selectSingleItem = ({ items }, id) => {
  return items.filter(item => item.id == id)[0] || {};
};
