import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import allTodos from './reducers/selectors.js';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions.js';
import Root from './components/root.jsx';

document.addEventListener("DOMContentLoaded", function(){
  const store = configureStore();
  const content = document.getElementById('content');
  ReactDOM.render(<Root store={store}/>, content);

  window.store = store;
  window.removeTodo = removeTodo;
  window.selector = allTodos(store.getState());
});
