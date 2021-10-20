float xStart, yStart, xBuffer, xDragged, x;
int valgtDrink = -1, drinkHover;
int skaerm = 1;
int aktiv;
float drinkCheck = 100;

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
PImage fortsaet;
PImage tilbage;
PImage stortDrinkKort;

PFont mockhand;

boolean fortsaetTilSkaenk = false;
boolean tilbageTilDrinks = false;

void setup() {
  //fullScreen(P3D);
  size(1920, 1080, P3D);
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
    drinkCheck = 100;
  }

  println(frameRate);
}

void mousePressed() {
  if (skaerm == 2) {
    if (mouseX > width-fortsaet.width-20 && mouseX < width-20 && mouseY > height-fortsaet.height-20 && mouseY < height-20 && valgtDrink != -1) {
      fortsaetTilSkaenk = true;
      tilbageTilDrinks = false;
    }
  }

  if (skaerm == 3) {
    if (mouseX > 20 && mouseX < tilbage.width+20 && mouseY > height-tilbage.height-20 && mouseY < height-20) {
      tilbageTilDrinks = true;
      fortsaetTilSkaenk = false;
    }
  }
}

void mouseReleased() {
  if (dist(mouseX, mouseY, xStart, yStart) < 20 && mouseY > height/3.5-150 && mouseY < height/3.5+150) {
    valgtDrink = drinkHover;
    drinkCheck = 0;
  }

  if (xDragged != 0) {
    x = x+xDragged;
    x = constrain(x, -1700, 1700);
  }

  xStart = 0;
  yStart = 0;
}
