import React from 'react';
import ItemDetailContainer from '../item/item_detail_container';
import Item from '../item/item';
import {Route} from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }


  componentDidMount () {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps (newProps) {
      if (this.props.pokemon.id != newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }
render () {

  const {pokemon, items} = this.props;

  console.log(pokemon, 'pokemon');
  console.log(items, 'items');
  return (
    <section className="pokedetail">
      <h2>{pokemon.name}</h2>
          <img src={pokemon.image_url} alt={pokemon.name} height="300" width="300"/>
      <ul>
        <li>Type: {pokemon.poke_type}</li>
        <li>Attack: {pokemon.attack}</li>
        <li>Defense: {pokemon.defense}</li>
        <li>Moves: {pokemon.moves}</li>
      </ul>
      <ul>
        {items.map(item => <Item key={item.id} item={item} />)}
      </ul>
      <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
  </section>
  );
 }
}

export default PokemonDetail;
