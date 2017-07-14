import {connect} from 'react-redux';
import ItemDetail from './item_detail';
import {requestSingleItem, receiveSingleItem} from  '../../actions/item_actions';
import {selectSingleItem} from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => ({
  item: selectSingleItem(state, ownProps.match.params.itemId)
});

const mapDispatchToProps = dispatch => ({
  requestSingleItem: (id) => dispatch(requestSingleItem(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(ItemDetail);
