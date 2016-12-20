const MovingObject = require('./lib/moving_object.js');

document.addEventListener("DOMContentLoaded", function(){

  const canvasEl = document.getElementsByTagName("canvas")[0];
  let ctx = canvasEl.getContext("2d");
  canvasEl.height = window.innerHeight;
  canvasEl.width = window.innerWidth;
  let circle = new MovingObject(
    { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
  );
  circle.draw(ctx);
});
