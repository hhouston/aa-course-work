import React from 'react';
import ReactDOM from 'react-dom';

class Weather extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      weather: null
    };
  }

  componentDidMount() {
    this.pollWeather.bind(this);
    navigator.geolocation.getCurrentPosition(this.pollWeather.bind(this));
  }


  pollWeather(location) {
    let lat = location.coords.latitude;
    let long = location.coords.longitude;

    let url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}`;

    const API_KEY = 'ccae46a19f526905ff655cbd5dae9998';
    url += `&APPID=${API_KEY}`;

    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = () => {
      if (xmlhttp.status === 200 && xmlhttp.readyState === XMLHttpRequest.DONE) {
        const data = JSON.parse(xmlhttp.responseText);
        this.setState({weather: data});
      }
    };
    xmlhttp.open('GET', url, true);
    xmlhttp.send();
  }



  render () {

    let content = <div></div>;

    if (this.state.weather) {
      let weather = this.state.weather;
      let temp = (weather.main.temp - 273.15) * 1.8 + 32;
      content = <div>
                  <p>{weather.name}</p>
                  <p>{temp.toFixed(1)} degrees</p>
                </div>;
    } else {
      content = <div className='loading'>loading weather...</div>;
    }

    return (
      <div>
        <h1>Weather</h1>
        <div className='weather'>
          {content}
        </div>
      </div>
    );
  }
}

export default Weather;
