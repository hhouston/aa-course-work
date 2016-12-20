const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {

  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  } else {

    reader.question("Enter num: ", function(num) {

        const parsedNum = parseInt(num);
        sum += parsedNum;
        numsLeft -= 1;
        addNumbers(sum, numsLeft, completionCallback);
    });

  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
