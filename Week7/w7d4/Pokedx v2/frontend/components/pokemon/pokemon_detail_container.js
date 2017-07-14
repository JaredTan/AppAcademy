import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import {requestSinglePokemon, receiveSinglePokemon} from  '../../actions/pokemon_actions';
import {selectSinglePokemon} from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => ({
  pokemon: selectSinglePokemon(state, ownProps.match.params.pokemonId),
  items: state.items
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
