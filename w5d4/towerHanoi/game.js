const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class HanoiGame {
  constructor() {
    this.stack = [[1,2,3],[],[]];
  }

  runGame() {

      this.display();
      this.takeTurn();
  }

  takeTurn() {
    if (this.gameOver()) {
      console.log('you win');
      reader.close();
    } else {
      this.display();
      this.getInput(this.validMove.bind(this));
    }
  }

  display() {
    this.stack.forEach((el) => {
      console.log(el);
    });
    console.log("-----------------");
  }

  getInput(callback) {
    reader.question("Please enter starting index: ", function(res1) {
      reader.question("Please enter target index: ", function(res2) {
        const answer1 = parseInt(res1);
        const answer2 = parseInt(res2);
        callback([answer1, answer2]);
      });
    });
  }

  gameOver() {
    if (this.stack[1].length === 3 || this.stack[2].length === 3) {
      return true;
    } else {
      return false;
    }
  }

  makeMove(start, finish) {
    this.stack[finish].push(this.stack[start].shift());
  }

  validMove(arr) {
    const start = arr[0];
    const finish = arr[1];


    if (typeof this.stack[start][0] === 'undefined' ||
      this.stack[finish][0] < this.stack[start][0]) {
        this.getInput(this.validMove.bind(this));
        return false;
      } else {
        this.makeMove(start, finish);
        this.takeTurn();
    }
  }
}

var game = new HanoiGame;
game.runGame();
