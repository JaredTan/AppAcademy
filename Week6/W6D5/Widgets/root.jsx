import React from 'react';
import Clock from './frontend/clock.jsx';
import Weather from './frontend/weather.jsx';
import Autocomplete from './frontend/autocomplete.jsx';

class Root extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      userNames: ['Syrie', 'Jared', 'George',
    'Greg',
    'Kevin',
    'Alice',
    'Noah',
    'Isak',
    'Jeff',
    'Tansy'
  ]
    };
  }


  render() {
    return (
      <div><Clock/><Weather/><Autocomplete userNames={this.state.userNames}/></div>
    );
  }
}

export default Root;
