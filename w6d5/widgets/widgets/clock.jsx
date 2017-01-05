import React from 'react';
import ReactDOM from 'react-dom';

class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: new Date()
    };

    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    setInterval(this.tick, 1000);
  }

  tick() {
    this.setState({
      time: new Date()
    });
  }
  render() {
    let minutes = this.state.time.getMinutes();
    let hours = this.state.time.getHours();
    let seconds = this.state.time.getSeconds();

    minutes = minutes < 10 ? `0${minutes}` : minutes;
    hours = hours < 10 ? `0${hours}` : hours;
    seconds = seconds < 10 ? `0${seconds}` : seconds;

    return(
      <div>
        <h1>Clock</h1>
        <div className='clock'>
          <p><span>Time: {hours}:{minutes}:{seconds} PDT</span></p>
          <p><span>Date: {this.state.time.toDateString()}</span></p>
        </div>
      </div>
    );
  }


}

export default Clock;
