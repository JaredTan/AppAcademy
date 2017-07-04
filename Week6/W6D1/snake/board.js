const Snake = require('./snake');
const Negg = require('./negg');

class Board {
  constructor(dim) {
    this.dim = dim;

    this.snake = new Snake(this);
    this.negg = new Negg(this);
    this.negg2 = new Negg(this);
  }

  static blankGrid(dim) {
    const grid = [];

    for (let i = 0; i < dim; i++) {
      const row = [];
      for (let j = 0; j < dim; j++) {
        row.push(Board.BLANK_SYMBOL);
      }
      grid.push(row);
    }

    return grid;
  }

  render() {
    const grid = Board.blankGrid(this.dim);

    this.snake.segments.forEach( segment => {
      grid[segment.i][segment.j] = Snake.SYMBOL;
    });

    grid[this.negg.position.i][this.negg.position.j] = Negg.SYMBOL;
    grid[this.negg2.position.i][this.negg2.position.j] = Negg.SYMBOL;

    // join it up
    const rowStrs = [];
    grid.map( row => row.join("") ).join("\n");
  }

  validPosition(coord) {
    return (coord.i >= 0) && (coord.i < this.dim) &&
      (coord.j >= 0) && (coord.j < this.dim);
  }
}

Board.BLANK_SYMBOL = ".";

module.exports = Board;
