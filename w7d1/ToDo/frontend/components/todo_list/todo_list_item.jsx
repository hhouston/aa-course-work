import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.toggleTodo = this.toggleTodo.bind(this);
  }

  toggleTodo(e) {
    e.preventDefault();
    const toggledTodo = merge(
      {},
      this.props.todo,
      { done: !this.props.todo.done }
    );

     this.props.receiveTodo(toggledTodo);
  }

  render() {
    return (
      <li>{this.props.todo.title}
        <button onClick={this.props.removeTodo.bind(null, this.props.todo.id)}>
          Remove
        </button>
        <button onClick={this.toggleTodo}>
          {this.props.todo.done === true ? "Undo" : "Done"}
        </button>
      </li>
    );
  }
}

export default TodoListItem;
