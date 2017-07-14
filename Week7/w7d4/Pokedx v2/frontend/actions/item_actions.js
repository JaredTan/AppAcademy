export const RECEIVE_ALL_ITEMS = 'RECEIVE_ALL_ITEMS';
export const RECEIVE_SINGLE_ITEM = 'RECEIVE_SINGLE_ITEM';
import * as APIUtil from '../util/api_util';


export const requestAllItems = () => (dispatch) => {
  return APIUtil.fetchAllItems()
    .then(item => dispatch(receiveAllItems(item)));
};

export const requestSingleItem = (id) => (dispatch) => {
  return APIUtil.fetchSingleItem(id)
    .then(item => dispatch(receiveSingleItem(item)));
};


export const receiveAllItems= items =>  ({
  type: RECEIVE_ALL_ITEMS,
  items
});

export const receiveSingleItem = payload => ({
  type: RECEIVE_SINGLE_ITEM,
  payload
});
