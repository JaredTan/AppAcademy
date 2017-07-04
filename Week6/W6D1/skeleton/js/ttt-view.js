class View {
  constructor(game, $el) {
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
    this.game = game;
  }

  bindEvents() {

    this.$el.on("click", '.square', (e) => {
      const $square = $(e.currentTarget);
      this.makeMove($square);
    });

  }

  makeMove($square) {
    const $data = $($square.data('data-pos'));
    let mark = this.game.currentPlayer;
    this.game.playMove($data);
    $square.addClass("click");
    $square.text(`${mark}`);
    if ( this.game.isOver() ) {
      const h2 = $("<h2>").text(`${mark} wins!`);
      $('.ttt').append(h2);
    }
  }

  setupBoard() {
  for(let i = 0; i < 3; i ++) {
    this.addRow();
    }
  }

  addRow() {
    const rowIdx = this.$el.find(".row").length;
    const $row = $("<ul>").addClass("row").addClass("group");
    for(let colIdx = 0; colIdx < 3; colIdx++) {
      const $square = $("<li>").addClass("square").data("data-pos", [rowIdx, colIdx]);
      $row.append($square);
    }
    this.$el.append($row);
  }

}

module.exports = View;
