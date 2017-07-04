const View = require('./ttt-view.js');
const Game = require('../lib/game.js');

$( () => {
  let game = new Game();
  let $el = $('.ttt');
  let view = new View(game, $el);
  // create view and game objects

});
