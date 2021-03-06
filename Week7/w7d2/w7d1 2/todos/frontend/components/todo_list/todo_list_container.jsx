import { connect } from 'react-redux';
import Todolist from './todo_list';
import allTodos from '../../reducers/selectors';
import { receiveTodo, removeTodo } from '../../actions/todo_actions';

const mapStateToProps  = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo))
  });

const TodoListContainer = connect(
  mapStateToProps, mapDispatchToProps)(Todolist);
export default TodoListContainer;
