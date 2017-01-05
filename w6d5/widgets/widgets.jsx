import React from 'react';
import ReactDOM from 'react-dom';

import Counter from './frontend/click_counter.jsx';
import Tabs from './widgets/tabs.jsx';
import Weather from './widgets/weather.jsx';
import Clock from './widgets/clock.jsx';

const Panes = [
  {title: 'one', content: 'I am the first'},
  {title: 'two', content: 'Second pane here'},
  {title: 'three', content: 'Third pane here'}
];

class Root extends React.Component {
  render() {
    return(
      <div>
        {/*<Counter />*/}
        <Weather />
        <Clock />
        <Tabs panes={Panes} />
      </div>
    );
  }
}


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root/>, document.getElementById('root'));
});
