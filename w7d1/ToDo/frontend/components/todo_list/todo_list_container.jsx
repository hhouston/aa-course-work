import { connect } from 'react-redux';
import TodoList from './todo_list.jsx';
import allTodos from '../../reducers/selectors.js';
import { receiveTodo, removeTodo } from '../../actions/todo_actions.js';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (id) => dispatch(removeTodo(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
