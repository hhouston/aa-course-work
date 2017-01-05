import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <ul>
          {
            this.props.todos.map((todo, i) =>  <TodoListItem
                                                  key={i}
                                                  removeTodo={this.props.removeTodo}
                                                  receiveTodo={this.props.receiveTodo}
                                                  todo={todo}
                                                />)
          }
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo} />
      </div>
    );
  }
}

export default TodoList;
