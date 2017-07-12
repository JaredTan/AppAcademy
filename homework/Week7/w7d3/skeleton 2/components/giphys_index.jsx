import React from 'react';

import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { giphys } = this.props;
    return (
      <ul>
        {giphys.map( (giphy, idx) => {
          return <GiphysIndexItem key={idx} giphy={giphy}/>
        })}
      </ul>


    )
  }
}



export default GiphysIndex;
