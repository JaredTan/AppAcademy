import React from 'react';
import PokemonIndexItem from './pokemon_index_item';


class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);


  }
  componentDidMount () {
    this.props.requestAllPokemon();
  }


render () {
  const {pokemon} = this.props;
  console.log(pokemon);
  return (
  <ul>
      {pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />)}
  </ul>
  );
 }
}

export default PokemonIndex;
