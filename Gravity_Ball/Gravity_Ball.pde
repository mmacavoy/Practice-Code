float x, y, velX, velY, gravity;
int sz=50;

void setup() {
  size(500,500);
  x=width/2;
  y=height*.25;
  velX=3;
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
      y=height-sz/2;
      velY*=-.9;
    }
      if(x+sz/2>width){
        x=width-sz/2;
        velX*=-.9;
      }
      if(x-sz/2<0){
        x=sz/2;
        velX*=-.9;
      }
}

