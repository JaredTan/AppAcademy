import React from 'react';

class Autocomplete extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      inputVal: ''
    };
    this.renderNames = this.renderNames.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({inputVal: event.target.value});
  }

  renderNames() {
    const userNames = this.props.userNames;
    return userNames.filter( el => el.includes(this.state.inputVal));
  }

  render() {
    const matchingNames = this.renderNames();
    return (
      <div>
        <h1>Search Bar: </h1>
        <input type="text" value={this.state.inputVal} onChange={this.handleChange} />
        <ul>
          {
            matchingNames.map((name, idx) => <li key={idx}>{name}</li>)
          }
        </ul>
      </div>
    );
  }

}

export default Autocomplete;
