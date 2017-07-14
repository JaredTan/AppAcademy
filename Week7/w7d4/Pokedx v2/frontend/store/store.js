import {createStore, applyMiddleware} from 'redux';
import rootReducer from '../reducers/root_reducer';
import logger from 'redux-logger';
import thunkMiddleware from '../middleware/thunk.js';

const configureStore = () => createStore(rootReducer, applyMiddleware(logger, thunkMiddleware));

export default configureStore;
