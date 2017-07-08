import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date(),
    };
    this.tick = this.tick.bind(this);
    this.id = '';
    //add super, move bind(this)
  }

  tick() {
    this.setState({time: new Date()});
    this.render();
  }

  componentDidMount() {
    this.id = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.id);
  }

  render() {
    const {time} = this.state;
    return (
      <div className='clock'>
        <h1>Current Time:</h1>
        <h2>{time.toLocaleTimeString()}</h2>
      </div>
    );
  }
}



export default Clock;
