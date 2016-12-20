Array.prototype.transpose = function () {
  const columns = [];
  for (let i = 0; i < this[0].length; i++) {
    columns.push([]);
  }

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      columns[j].push(this[i][j]);
    }
  }

  return columns;
};
///////


const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class TicTacToe {
  constructor() {
    this.board = [
      [null,null,null],
      [null,null,null],
      [null,null,null]
    ];
    this.player = [1, 2];
  }

  runGame() {
    this.takeTurn();
  }

  takeTurn() {
    if (this.gameOver()) {
      reader.close();
      this.dipslay();
      console.log(`Player ${this.player[1]} wins!`);
    } else {
      console.log(`Player ${this.player[1]} turn: `);
      this.display();
      this.getInput(this.validMove.bind(this));
    }
  }

  display() {
    this.board.forEach((el) => {
      console.log(el);
    });
    console.log("-----------------");
  }

  getInput(callback) {
    reader.question("Please enter row index: ", function(res1) {
      reader.question("Please enter column index: ", function(res2) {
        const answer1 = parseInt(res1);
        const answer2 = parseInt(res2);
        callback([answer1, answer2]);
      });
    });
  }

  gameOver() {
    if (this.board.some((row) => row.every((el) => el === "X" ))) return true;
    if (this.board.some((row) => row.every((el) => el === "O" ))) return true;
    let transposedBoard = this.board.transpose();
    if (transposedBoard.some((row) => row.every((el) => el === "X" ))) return true;
    if (transposedBoard.some((row) => row.every((el) => el === "O" ))) return true;

    
    return false;
  }

  makeMove(row, column) {
    let mark = (this.player[0] === 1 ? "X" : "O");
    this.board[row][column] = mark;
    let tmp = this.player.shift();
    this.player.push(tmp);
  }

  validMove(arr) {
    const row = arr[0];
    const column = arr[1];

    if (this.board[row][column] !== null) {
      this.takeTurn();
    } else {
      this.makeMove(row, column);
      this.takeTurn();
    }
  }
}

var game = new TicTacToe;
game.runGame();
