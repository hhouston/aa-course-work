
Function.prototype.inherits = function (BaseClass) {
  function Surrogate () {}
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

// ANIMAL
function Animal (name) {
  this.name = name;
}

Animal.prototype.sayHello = function () {
  console.log("Hello, my name is " + this.name);
};


// DOG
function Dog (name) {
  // call super-constructor function on **the current `Dog` instance**.
  Animal.call(this, name);
}
Dog.inherits(Animal);

// CAT
function Cat (name) {
  Animal.call(this, name);
}
Cat.inherits(Animal);



Dog.prototype.bark = function() {
  console.log(this.name + " Bark!");
};

Cat.prototype.meow = function() {
  console.log("Meow!");
};




let c = new Cat("catty");
let d = new Dog("doggy");
// d.bark();
d.bark();
c.meow();
d.sayHello();


////////// ANSWER /////////////

// Function.prototype.inherits = function (BaseClass) {
//   function Surrogate () {}
//   Surrogate.prototype = BaseClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };
//
// function Dog (name) {
//   this.name = name;
// }
//
// Dog.prototype.bark = function () {
//   console.log(this.name + " barks!");
// };
//
// function Corgi (name) {
//   Dog.call(this, name);
// }
//
// Corgi.inherits(Dog);
//
// Corgi.prototype.waddle = function () {
//   console.log(this.name + " waddles!");
// };
//
// const blixa = new Corgi("Blixa");
// blixa.bark();
// blixa.waddle();
