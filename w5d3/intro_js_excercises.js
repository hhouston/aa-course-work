function uniq(array) {
  let newArray = [];

  for (let i = 0; i < array.length; i++ ) {
    if (newArray.indexOf(array[i]) === -1) {
      newArray.push(array[i]);
    }
  }

  return newArray;
}

let myArray = [1, 3, 1, 5];
// console.log(uniq(myArray));

//method that finds all pairs of
//positions where the elements at those positions sum to zero.
function twoSum(array) {
  let returnArray = [];

  for (let i = 0; i < (array.length - 1); i++) {
    for (let j = i + 1; j < array.length; j++) {
      if (array[i] + array[j] === 0) {
        returnArray.push([i, j]);
      }
    }
  }

  return returnArray;
}

function transpose(matrix) {
  let result = [];

  for (let i = 0; i < matrix[0].length; i++) {
    let temp = [];
    for (let j = 0; j < matrix.length; j++) {
      temp.push(matrix[j][i]);
    }
    result.push(temp);
  }

  return result;
}

test = [
    [0, 1],
    [3, 4],
    [5, 0]
  ];

// console.log(transpose(test));
Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
  return this;
};

function print(el) {
  console.log(el);
}

// [1,2,3].myEach(print);

Array.prototype.myMap = function(callback) {
  let returnArray = [];
  for(let i = 0; i < this.length; i++) {
    returnArray.push(callback(this[i]));
  }
  return returnArray;
};

function timesTwo(num) {
  return num * 2;
}

// [1, 2, 3].myMap(timesTwo);


Array.prototype.myInject = function(callback, accum) {
  accum = accum || this[0];

  this.myEach (el => (accum = callback(accum, el)));
  return accum;
};

function add(accum, el) {
  return accum + el;
}

// console.log([1,2,3].myInject(add));

function bubbleSort(array) {
  let swap = true;
  while (swap === true) {
    swap = false;
    for(let i = 0; i < array.length - 1; i++ ) {
      for(let j = i + 1; j < array.length; j++ ) {
        if (array[i] > array[j]) {
          let temp = array[i];
          array[i] = array[j];
          array[j] = temp;
          swap = true;
        }
      }
    }
    return array;
  }
}

// console.log(bubbleSort([2,5,3,1]));

function substrings(string) {
  let subs = [];

  for(let i = 0; i < string.length; i++) {
    for( let j = i + 1; j <= string.length; j++) {
      subs.push(string.slice(i,j));
    }
  }
  return subs;
}

// console.log(substrings("cat"));


function range(start, end) {
  if (end < start) {
    return [];
  }

  return [start].concat(range(start + 1, end));
}

// console.log(range(2,5));


function exp(base, num) {
  if (num === 0)
    return 1;
  return base * exp(base, num - 1);
}

function exp2(base, num) {
  if (num === 0)
    return base;

  if (num % 2 === 0)
    return (exp2(base, (num / 2)) ^ 2);
  else
    return (base * exp2(base, (num - 1) / 2) ^ 2);
}

// console.log(exp2(5,2));

Array.prototype.kitcat = function(thing) {
  return this.concat(thing);
};
function fib(num) {
  if (num === 0 ) {
    return [];
  } else if (num === 1) {
    return [1];
  } else if (num === 2){
    return [0, 1];
  } else {

    let nums = fib(num - 1);
    return nums.kitcat(nums[nums.length-1] + nums[nums.length-2]);
  }
}

console.log(fib(599));

function bsearch(array, target) {
  if (array.length < 1) {
    return null;
  }
  // console.log(array);
  let mid = Math.floor((array.length/2));

  if (array[mid] === target) {
    return mid;
  } else if (array[mid] > target) {
    return bsearch(array.slice(0, mid), target);
  } else {
    const subproblem = bsearch(array.slice(mid + 1), target);
    return subproblem === null ? null : subproblem + (mid + 1);
  }
}

// console.log(bsearch([1, 2, 3], 1)); // => 0
// console.log(bsearch([2, 3, 4, 5], 3)); // => 1
// console.log(bsearch([2, 4, 6, 8, 10], 6)); // => 2
// console.log(bsearch([1, 3, 4, 5, 9], 5)); // => 3
// console.log(bsearch([1, 2, 3, 4, 5, 6], 6)); // => 5
// console.log(bsearch([1, 2, 3, 4, 5, 6], 0)); // => nil
// console.log(bsearch([1, 2, 3, 4, 5, 7], 6)); // => nil




// function makeChange(ammount, coins) {
//   if (ammount === 0) {
//     return 0;
//   } else if (Math.min(...coins) > ammount ) {
//     return ammount;
//   }
//
//   let change =
//
//   makeChange
// ?


function mergeSort (array) {
  if (array.length < 2) {
    return array;
  } else {

    let mid = Math.floor(array.length/2);

    let leftSide = mergeSort(array.slice(0, mid));
    let rightSide = mergeSort(array.slice(mid));

    return merge(leftSide, rightSide);
  }
}

function merge(leftSide, rightSide) {
  const mergedArray = [];
  while( leftSide.length > 0 && rightSide.length > 0) {
    if (leftSide[0] > rightSide[0]) {

      mergedArray.push(rightSide.shift());

    } else {
      mergedArray.push(leftSide.shift());
    }

  }

  return mergedArray.concat(leftSide, rightSide);
}

// console.log(`mergeSort([4, 5, 2, 3, 1]) = ${mergeSort([4, 5, 2, 3, 1])}`);


// subsets
function subsets(array) {
  if (array.length === 0) {
    return [[]];
  }

  const firstElement = array[0];
  const subSubsets = subsets(array.slice(1));

  const newSubsets = subSubsets.map(subSubset => [firstElement].concat(subSubset) );

  return subSubsets.concat(newSubsets);
}

// console.log(`subsets([1, 3, 5]) = ${JSON.stringify(subsets([1, 3, 5]))}`);
