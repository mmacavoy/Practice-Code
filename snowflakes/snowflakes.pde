//declare variables
int count = 800;
PImage snowflake;
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];

void setup() {
  size(800, 600);
  snowflake = loadImage("snowflake.png");
  //initialize variables
  for (int i = 0; i < count; i++) {
    sz[i] = random(5, 30);
    loc[i] = new PVector(random(width), random(-height*1.5, -sz[i]/2));
    vel[i] = new PVector(0, random(1));
    acc[i] = new PVector(0, .01);
  }
  noStroke();
  fill(255, 200);
}

void draw() {
  background(0, 20, 50);
  for (int i = 0; i < count; i++) {
    //move snowflake
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    vel[i].limit(3);
    //draw snowflake
    image(snowflake,loc[i].x, loc[i].y, sz[i], sz[i]);
    //change horizontal acceleration
    acc[i].x = random(-.1, .1);
    //restart snowflake
    if (loc[i].y - sz[i]/2 > height) {
      loc[i].set(random(width), random(-height, -sz[i]/2));
      vel[i].set(0, 1);
    }
  }
}
