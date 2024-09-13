/////////////// Screen
const screenSizeY = 350;
const screenSizeX = 540;

/////////////// ellipse
const pointSize = 1;
const ballSize = 2;

/////////////// physics
const gravity = 0.0452;

///////////////
// y  = a*sqrt(r2 - (x2/b2))
// y' = (a * b / 2) * (x * Math.sqrt(r**2 - (x**2 / b**2)) + (r**2 / b) * Math.asin(x / (r * b)));
const fr = 160;
const fa = 1;
const fb = 1;
const f = (x) => fa * Math.sqrt(fr ** 2 - x ** 2 / fb ** 2);
const dfdx = (x) => -fa * (x / Math.sqrt(fr ** 2 - x ** 2 / fb ** 2));

// const gr = 60;
// const ga = 1;
// const gb = 1;
// const g = (x) => ga * Math.sqrt(gr ** 2 - x ** 2 / gb ** 2);
// const dgdx = (x) => -ga * (x / Math.sqrt(gr ** 2 - x ** 2 / gb ** 2));
const obs = [
  [f, dfdx],
  // [g, dgdx],
]; // [f(x), df(x)/dx]

class Ball {
  constructor(x, y, size, vi = null, rd = 40, gr = 40, bl = 40) {
    this.loc = createVector(x, y);
    if (vi) {
      this.vel = vi;
    } else {
      this.vel = createVector(0, 0);
    }
    this.acc = createVector(0, 0);
    this.rd = rd;
    this.gr = gr;
    this.bl = bl;
    this.bounceFactor = 0.965;
    this.obstacleFunctions = [];
    this.size = size;

    this.trails = [];
  }

  applyForce(forces) {
    this.acc.mult(0);

    this.obstacleFunctions.forEach((obstacleFunction) => {
      if (this.loc.y >= obstacleFunction[0](this.loc.x)) {
        const angle = Math.atan2(obstacleFunction[1](this.loc.x), 1);
        const heading = this.vel.heading();
        const newHeading = 2 * angle - heading;
        const mg = this.vel.mag();

        this.vel = createVector(
          mg * Math.cos(newHeading),
          mg * Math.sin(newHeading)
        ).mult(this.bounceFactor);

        if (this.loc.y > obstacleFunction[0](this.loc.x) + 0.1) {
          this.loc.y = obstacleFunction[0](this.loc.x);
        }
      }
    });

    forces.forEach((force) => this.acc.add(force));

    this.vel.add(this.acc);

    this.loc.add(this.vel);

    // Add Trail

    if (this.trails.length > 5) {
      this.trails.pop();
      this.trails.unshift([this.loc.x, this.loc.y]);
    } else {
      this.trails.push([this.loc.x, this.loc.y]);
    }
  }

  show() {
    for (let i = 1; i < this.trails.length; i++) {
      fill(this.rd * 0.8, this.gr * 0.8, this.bl * 0.8);
      strokeWeight(1.5);
      stroke(this.rd * 0.8, this.gr * 0.8, this.bl * 0.8);
      line(
        this.trails[i][0],
        this.trails[i][1],
        this.trails[i - 1][0],
        this.trails[i - 1][1]
      );
    }

    // fill(200);
    // stroke(200);
    // ellipse(this.loc.x, this.loc.y, this.size, this.size);
  }
}

let balls = [];

function setup() {
  createCanvas(screenSizeX, screenSizeY, WEBGL);
  for (let i = 1; i < 20; i++) {
    balls.push(
      new Ball(
        10 + i * 0.01,
        -40,
        ballSize,
        createVector(-1.8, 0),
        random(20, 255), // Red
        random(100, 255), // Green
        random(20, 255) // Blue
      )
    );
  }
  frameRate(200);
  background(29);
  let prevStrk = null;
  translate(0, 0);
  obs.forEach((o) => {
    for (let x = -fr; x <= fr; x += 1) {
      if (prevStrk) {
        fill(50);
        stroke(50);
        line(prevStrk[0], prevStrk[1], x, o[0](x));
      }
      prevStrk = [x, o[0](x)];
    }
  });
}

function draw() {
  translate(0, 0);

  balls.forEach((ball) => {
    ball.obstacleFunctions = obs;
    ball.applyForce([createVector(0, gravity)]);
    ball.show();
  });
}
