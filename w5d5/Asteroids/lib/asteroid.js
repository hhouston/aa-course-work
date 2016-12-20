const Util = require ('./util.js');
const MovingObject = require ('./moving_object.js');

const DEFAULTS = {
	COLOR: "#00FF00",
	RADIUS: 30,
  SPEED: 100
};

let Asteroid = function(options = {}) {
  options.color = DEFAULTS.COLOR;
  options.radius = DEFAULTS.RADIUS;
  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);
  // options.pos = options.pos || options.game.randomPosition();

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

let a = new Asteroid({ pos: [30, 30] });
console.log(a);
