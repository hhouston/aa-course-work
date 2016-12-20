const View = require("./ttt-view");
const Game = require("./game");


$( () => {
  let game = new Game();
  let board = $('.ttt');
  let view = new View(game, board);
});
