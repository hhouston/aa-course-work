// function sum() {
//   let total = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     total += arguments[i];
//   }
//   return total;
// }


// function sum(...args) {
//   let total = 0;
//   for (let i = 0; i < args.length; i++) {
//     total += args[i];
//   }
//   return total;
// }

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

// Function.prototype.myBind = function(context) {
//   let myArgs = Array.from(arguments);
//   // console.log(myArgs.slice(1));
//   return () => {
//     this.apply(context, myArgs.slice(1));
//   };
// };

Function.prototype.myBind = function(context, ...bindArgs) {
  return (...callArgs) => {
    this.apply(context, bindArgs.concat(callArgs));
  };
};

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

//
// console.log(markov.says.myBind(breakfast, "meow", "Kush")());


function sumThree(num1, num2, num3) {
  console.log(num1, num2, num3);
  return num1 + num2 + num3;
}

// sumThree(4, 20, 6);

// function curriedSum(numArgs) {
//   let numbers = [];
//
//   let _curriedSum = function(num) {
//     numbers.push(num);
//     if (numbers.length === numArgs) {
//       let sum = 0;
//       for (let i = 0; i< numbers.length; i++) {
//         sum += numbers[i];
//       }
//       return sum;
//     } else {
//       console.log("here");
//       return _curriedSum;
//     }
//   };
//
//   return _curriedSum;
// }

// let sum = curriedSum(4);
// console.log(sum);
//
// console.log(sum(5)(30)(20)(1)); // => 56

//
// console.log(curriedSum(3));

// let f1 = curriedSum(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// console.log(typeof f1);
//
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30
// (1)(2)(3));

// Function.prototype.curry = function(numArgs) {
//   let numbers = [];
//   let _curriedSum = function(num) {
//     numbers.push(num);
//     if (numArgs === numbers.length) {
//
//       return this(...numbers);
//     } else {
//       return _curriedSum;
//     }
//   }.bind(this);
//
//   return _curriedSum;
// };

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let fn = this;
  let _curriedSum = function(num) {
    numbers.push(num);
    if (numArgs === numbers.length) {
      return fn.apply(fn, [...numbers]);
    } else {
      return _curriedSum;
    }
  };

  return _curriedSum;
};

console.log(sumThree.curry(3)(4)(20)(6)); // == 30

//////////////////////////////
// ANSWER

// function sum1() {
//   let total = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     total += arguments[i];
//   }
//
//   return total;
// }
//
// function sum2(...nums) {
//   let total = 0;
//   for (let i = 0; i < nums.length; i++) {
//     total += nums[i];
//   }
//
//   return total;
// }
//
// Function.prototype.myBind1 = function (ctx) {
//   const fn = this;
//   const bindArgs = Array.from(arguments).slice(1);
//   return function () {
//     const callArgs = Array.from(arguments);
//     return fn.apply(ctx, bindArgs.concat(callArgs));
//   };
// };
//
// Function.prototype.myBind2 = function (ctx, ...bindArgs) {
//   return (...callArgs) => {
//     return this.apply(ctx, bindArgs.concat(callArgs));
//   };
// };
//
// function curriedSum(numArgs) {
//   const numbers = [];
//
//   function _curriedSum(num) {
//     numbers.push(num);
//
//     if (numbers.length === numArgs) {
//       let total = 0;
//
//       numbers.forEach((n) => { total += n; });
//
//       return total;
//     } else {
//       return _curriedSum;
//     }
//   }
//
//   return _curriedSum;
// }
//
// // using spread
// Function.prototype.curry = function (numArgs) {
//   const args = [];
//   const fn = this;
//
//   function _curriedFn(arg) {
//     args.push(arg);
//
//     if (args.length === numArgs) {
//       return fn(...args);
//     } else {
//       return _curriedFn;
//     }
//   }
//
//   return _curriedFn;
// };
//
// // using apply
// Function.prototype.curry1 = function(numArgs){
//   const args = [];
//   let fn = this;
//   function _curried(arg){
//     args.push(arg);
//     if (args.length === numArgs) {
//       return fn.apply(null, args);
//     } else {
//       return _curried;
//     }
//   }
//   return _curried;
// };
