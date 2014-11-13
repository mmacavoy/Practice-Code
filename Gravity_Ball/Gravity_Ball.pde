float x, y, velX, velY, gravity;
int sz=50;

void setup() {
  size(500,500);
  x=width/2;
  y=height*.25;
  velX=0;
  velY=0;
  gravity=1;
}

void draw(){
    background(0);
    fill(0, 100, 255);
    ellipse(x, y, sz, sz);
    velY+= gravity;
    x+=velX;
    y+=velY;
    if (y+sz/2 > height) {
      velY=-abs(velY);
      y=height-sz/2;
    }
  }

