class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $("li").on("click", event => {
      const $posLi = $(event.currentTarget);
      const posId = $posLi.data("pos");
      this.game.playMove(posId);
      $posLi.removeClass("unchecked");
      $posLi.addClass("checked");
      this.makeMove($posLi);
    });
  }

  makeMove($square) {
    $square.text(this.game.currentPlayer);
    if (this.game.winner()){
      let $figcaption = $("<figcaption>");
      $figcaption.text(`You win, ${this.game.currentPlayer}!`);
      this.$el.append($figcaption);
    }
  }

  setupBoard() {
    const $ul = $("<ul>");
    $ul.addClass("board");

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        const $li = $("<li>");
        $li.addClass("unchecked");
        $li.data("pos", [rowIdx, colIdx]);

        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
