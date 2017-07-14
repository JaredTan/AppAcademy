import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonIndexContainer from './pokemon_index_container';
import { Route, Component } from 'react-router-dom';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);


  }
  componentDidMount () {
    this.props.requestAllPokemon();
  }


render () {
  const {pokemon} = this.props;

  return (
    <section className="pokedex">
      <Route path="/pokemon/:pokemonId" component={ PokemonDetailContainer}/>
      <ul>
          {pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />)}
      </ul>
    <Route exact path="/pokemon" component={PokemonIndexContainer} />
  </section>

  );
 }
}

export default PokemonIndex;
