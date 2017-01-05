import React from 'react';
import TodoListContainer from './todo_list/todo_list_container.jsx';

class App extends React.Component {

  render() {
    return(
      <div>
        <h1>Kat/Hunter</h1>
        <TodoListContainer />
      </div>
    );
  }
}

export default App;
