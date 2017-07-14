export const fetchAllPokemon = () =>
  $.ajax({
    method: 'GET',
    url: '/api/pokemons'
  });

export const fetchSinglePokemon = (id) =>
  $.ajax({
    method: 'GET',
    url: `/api/pokemons/${id}`
  });

  export const fetchAllItems = () =>
    $.ajax({
      method: 'GET',
      url: '/api/items'
    });

  export const fetchSingleItem = (id) =>
    $.ajax({
      method: 'GET',
      url: `/api/items/${id}`
    });
