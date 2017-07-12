import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      searchTerm: 'pikachu'
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.fetchSearchGiphys('pikachu');
  }

  handleChange(event) {
    event.preventDefault();
    this.setState({searchTerm: event.currentTarget.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    this.setState({searchTerm: ''});
  }



  render() {
    const { giphys } = this.props;
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input value={this.state.searchTerm} onChange={this.handleChange}></input>
          <button type='submit'>Search</button>
        </form>
        <GiphysIndex giphys={giphys}/>
      </div>
    )
  }
}

export default GiphysSearch;
