$(document).ready(function() {

  var canvas = document.getElementById("coinupdater");
  if (canvas) {
    var ctx = canvas.getContext("2d");

    var W = 150;
    var H = 200;
    var g = 1;

    var particles = [];
    for (var i=0;i<100;i++) {
      particles.push(new create_particle())
    };

    function create_particle() {
      this.myX = Math.random()*(W - 50) + 15;
      this.myY = Math.random()*15 + (H/2) - 40;

      this.velX = Math.random()*4 - 2;
      this.velY = -Math.random()*10 - 10;

      this.color = "gold"
      this.myRad = Math.random()*4+1;
    }

    function draw() {
    	ctx.fillStyle = "rgba(255,255,255, 1)";
    	ctx.fillRect(0, 0, W, H);
        // ctx.fillStyle = "rgba(255,255,25, 1)";
        // ctx.fillRect(15, (H/2) - 40, (W - 50), 15);

      for (var t=0;t<particles.length;t++) {
        var par = particles[t];
        ctx.beginPath();

        var grad = ctx.createRadialGradient(par.myX,par.myY,0,par.myX,par.myY,par.myRad);
        grad.addColorStop(0,"gold");
        grad.addColorStop(0.4,"gold");
        grad.addColorStop(0.4,par.color);
        grad.addColorStop(1,"white");

        ctx.fillStyle = grad;
        ctx.arc(par.myX,par.myY,par.myRad,Math.PI*2,false);
        ctx.fill();

        par.myX += par.velX;
        g += 0.02;
        par.myY += par.velY + g;
      }
    }

  //   function setIntervalX(delay, repetitions) {
  //     var x = 0;
  //     var intervalID = window.setInterval(function () {
  //
  //        draw();
  //
  //        if (++x === repetitions) {
  //            window.clearInterval(intervalID);
  //        }
  //     }, delay);
  // }

    setTimeout(function () {
        var x = 0;
        var intervalID = window.setInterval(function () {

           draw();

           if (++x === 100) {
               window.clearInterval(intervalID);
           }
        }, 40);
    }, 1500);
  }
})
