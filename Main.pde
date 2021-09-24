float xStart, yStart, xBuffer, xDragged, x;
int valgtDrink = -1, drinkHover;
int skaerm = 1;
int aktiv;

int r, g, b;

bubble[] bubbles = new bubble[30];
screens screens;
setup setup;

String[] drinkBillederNavne = {"vand.png", "vand.png", "vand.png", "vand.png", "vand.png", "vand.png", "vand.png", "vand.png", "vand.png", "vand.png", "vand.png"};
PImage[] drinkBillederArray = new PImage[11];

String[] drinkInfo = {"drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png", "drinkInfo1.png"};
PImage[] drinkInfoBilleder = new PImage[11];

PImage baggrund;
PImage vaelgDinDrink;
PImage frugt;
PImage juice;
PImage velkommen;
PImage tryk;
PImage vand;

PFont mockhand;

void setup() {
  fullScreen(P3D);
  setup = new setup();
  setup.load();
}

void draw() {
  background(baggrund);
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].show();
    bubbles[i].update();
  }

  if (skaerm == 1) {
    screens.velkommen();
  }
  if (skaerm == 2) {
    screens.drink();
  }
  if (skaerm == 3) {
    screens.skaenk();
  }

  if (mousePressed) {
    aktiv = millis();
  }

  println(frameRate);
  println(g);
}

void mouseReleased() {
  if (dist(mouseX, mouseY, xStart, yStart) < 20 && mouseY > height/3.5-150 && mouseY < height/3.5+150) {
    valgtDrink = drinkHover;
  }

  if (xDragged != 0) {
    x = x+xDragged;
    x = constrain(x, -1700, 1700);
  }

  xStart = 0;
  yStart = 0;
}

void keyPressed() {
  if (key == 'w') {
    g += 5;
  }
  if (key == 's') {
    g -= 5;
  }
}
