//declare images
PImage music;
PImage misha;
PImage periphery;


ArrayList<Note> allMyNotes = new ArrayList<Note>();

void setup() {
  noStroke();
  size(800, 600);
  //load images
  music = loadImage("music.png");
  misha = loadImage("misha.png");
  periphery = loadImage("periphery.jpg");
}

void draw() {
  background(0);
  image(periphery, 55, 0, 650, 650);
  image(misha, 75, 50, 600, 600);

  if (mousePressed) {
    allMyNotes.add(new Note());
  }
  //display notes on screen
  for (int i = allMyNotes.size ()-1; i >= 0; i--) {
    Note currentNote = allMyNotes.get(i);
    currentNote.display();
    currentNote.move();
    if (currentNote.isGone()) {
      allMyNotes.remove(i);
    }
  }
}

class Note {
  //declare variables
  PVector loc, vel, acc;
  float sz;

  Note() {
    //give values to variables
    loc = new PVector(width/2, height*.3);
    vel = new PVector(random(-4, 4), random(-4, -2));
    acc = new PVector(0, .1);
    sz = 150;
  }

  void display() {
    //give location and size to images
    image(music, loc.x, loc.y, sz, sz);
  }

  void move() {
    //make it so that the notes can move
    vel.add(acc);
    loc.add(vel);
  }

  boolean isGone() {
    if (loc.y -sz/2 > height) {
      return true;
    } else {
      return false;
    }
  }
}

