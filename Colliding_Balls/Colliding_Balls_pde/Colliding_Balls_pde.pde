Ball [] b = new Ball[100];

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  for (int i = 0; i<b.length; i++) {
    b[i] = new Ball();
  }
}

void draw() {
  background(0);
  for (int i = 0; i<b.length; i++) {
    b[i].move();
    b[i].bounce();
    b[i].display();
  }
}

class Ball {

  float sz;
  PVector loc, vel;
  float hue;

  Ball() {
    sz = random(5, 75);
    loc = new PVector(width/2, height/2);
    vel = PVector.random2D();
    hue = random(200,300);
  }

  void display() {
    fill(hue, 100, 100, 100);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
  }

  void bounce() {
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      vel.y *= -1;
    }
  }
}

