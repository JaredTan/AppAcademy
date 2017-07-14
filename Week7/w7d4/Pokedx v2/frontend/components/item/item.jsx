import React from 'react';
import { Link } from 'react-router-dom';

const Item = ({item}) => (
  <Link to={`/pokemon/${item.pokemon_id}/item/${item.id}`}>
    <img src={item.image_url} alt={item.name} height="100" width="100"/>

  </Link>
);

export default Item;
