import React from 'react';


class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }


  componentDidMount () {
    this.props.requestSingleItem(this.props.match.params.itemId);
  }

  componentWillReceiveProps (newProps) {
      if (this.props.item.id === newProps.match.params.itemId) {
      this.props.requestSingleItem(newProps.match.params.itemId);
    }
  }


render () {
  const {item} = this.props;
  return (
    <section className="itemdetail">
      <h2>{item.name}</h2>
          <img src={item.image_url} alt={item.name} height="50" width="50" />
      <ul>
        <li>Dolla Bill Amount: {item.price}</li>
        <li>Happpppyyyy Level: {item.happiness}</li>
      </ul>
  </section>
  );
 }
}

export default ItemDetail;
