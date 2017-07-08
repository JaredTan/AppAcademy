import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      weather: "",
      temp: "",
      city: ""
    };

    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.getWeather);
  }


  getWeather(pos) {
    let clock = this;
    const {latitude, longitude} = pos.coords;
    var request = new XMLHttpRequest();
    request.open('GET',
    `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&APPID=ecfc538cfbbde87b1483645b3ff917fc`,
     true);

    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        // Success!
        var resp = JSON.parse(request.responseText);

        clock.setState({weather: resp.weather[0].description, temp: resp.main.temp, city: resp.name});
      } else {
        // We reached our target server, but it returned an error

      }
    };
    request.onerror = function() {
      // There was a connection error of some sort
    };
    request.send();
  }



  render() {
    const {weather, temp, city} = this.state;
    return(
      <div className="weather">
        <h1>Today's Weather: </h1>
        <h2> {city}, {weather}, {Math.floor(100*(temp - 273.15))/100}°C </h2>
      </div>
    );
  }
}


export default Weather;
