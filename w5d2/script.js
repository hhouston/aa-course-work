// for (let i = 0; i < 10; i++) {
// 	console.log("the greatest of ease!");
// }

// function mysteryScoping1() {
//   var x = 'out of block';
// 	  if (true) {
// 	    var x = 'in block';
// 	    console.log(x);
// 	  }
//   console.log(x);
// }
// mysteryScoping1();
//
// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// mysteryScoping2();

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// mysteryScoping3();

// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// mysteryScoping4();

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }
//
// mysteryScoping5();

// function madLib(verb, adj, noun) {
// 	var VERB = verb.toUpperCase();
// 	var ADJ = adj.toUpperCase();
// 	var NOUN = noun.toUpperCase();
//
// 	console.log("We shall", VERB, "the", ADJ, NOUN);
// }
//
// madLib('make', 'best', 'guac');

// function isSubstring(sentence, word) {
// 	var words = sentence.split(" ");
//
// 	for (let i = 0; i < words.length; i++) {
// 		if (words[i] === word) {
// 			return true;
// 		}
// 	}
// 	return false;
//
// }
//
// console.log(isSubstring("hey hey hey", "hey"));
// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
    let new_array = [];
    for (let i = 0; i < array.length; i++) {
        if (array[i] % 3 === 0 && array[i] % 5 === 0) {

        } else if (array[i] % 3 === 0 || array[i] % 5 === 0) {
            new_array.push(array[i]);
        }
    }
    return new_array;
}
//
// const array = [1,2,3,4,5,10,20,60];
// console.log(fizzBuzz(array));


function isPrime(num) {

    for (let i = 2; i <= num.length; i++) {
        if (num % i === 0) {
            console.log(i);
            console.log(num);
            return false;
        }
    }
    return true;
}


//
// console.log(isPrime(2));

//true

// isPrime(10)
// //false
//
// isPrime(15485863)
// //true
//
// isPrime(3548563)
// //false

function someOfPrimes(num) {
    var sum = 0;
    for (let i = 1; i <= num; i++) {
        if (isPrime(i) === true) {
            sum += i;
        }
    }
    console.log(sum);
}

// someOfPrimes(4);


function allOrNothing(num, ...args) {
    for (let i = 0; i < args.length; i++) {
        if (args[i] % num !== 0) {
            return false;
        }
    }
    return true;
}

// console.log(allOrNothing(3, 9, 12, 6));
// console.log(allOrNothing(5, 1, 2, 10));


function printCallback(array) {
    array.forEach(function(el){
			console.log(el);
		});
}

function titleize(names, callback) {
    let new_array = names.map(name => `Mr. ${name} Jingleheimer Schmidt`);
    callback(new_array);
}

titleize(["Mary", "Brian", "Leo"], printCallback);
//Mx. Mary Jingleheimer Schmidt


function Elephant(name, height, tricks) {
	this.name = name;
	this.height = height;
	this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
	console.log(this.name, 'phrRRRRRRRRRRR!!!!!!!');
};

let ellie = new Elephant(
									"Ellie",
									185,
									["giving human friends a ride",
									"playing hide and seek"]
								);

ellie.trumpet();
