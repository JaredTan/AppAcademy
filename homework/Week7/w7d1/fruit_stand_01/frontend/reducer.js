const reducer = (state = [], action) => {
  switch(action.type) {
    console.log('hi');
    case 'ADD_FRUIT':
      return [
        ...state,
        action.fruit
      ];
    default:
      return state;
  }
};

export default reducer;
