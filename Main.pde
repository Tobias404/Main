float xStart, yStart, xBuffer, xDragged, x;
int valgtDrink = -1, drinkHover;
int skaerm = 1;
int aktiv;
float drinkCheck = 100;
//String[] drinks = {"http://10.113.9.124/STRING?M1=3.4&M6=2.4&M4=34.2", "http://10.113.9.124/STRING?M1=5.35&M4=34.7", "http://10.113.9.124/STRING?M6=6.5&M3=33.5", "http://10.113.9.124/STRING?M1=5.3&M2=34.7", "http://10.113.9.124/STRING?M4=9.6&M3=30.4", "http://10.113.9.124/STRING?M5=9.6&M7=30.4", "http://10.113.9.124/STRING?M8=12.2&M2=27.8", "http://10.113.9.124/STRING?M1=5.3&M7=34.7", "http://10.113.9.124/STRING?M6=6.5&M4=33.5", "http://10.113.9.124/STRING?M8=12.2&M2=27.8", "http://10.113.9.124/STRING?M0=40&M1=40&M2=40&M3=40"};
String[] drinks = {"http://10.113.9.124/STRING?M0=4.8&M1=27.2", "http://10.113.9.124/STRING?M2=4.8&M1=27.3", "", "", "", "", "", "", "", "", "http://10.113.9.124/STRING?M0=3&M1=3&M2=3"};

bubble[] bubbles = new bubble[30];
screens screens;
setup setup;

String[] drinkBillederNavne = {"harvey.png", "screwdriver.png", "koldskaal.png", "sprite.png", "pina.png", "bounty.png", "filur.png", "vodkacola.png", "likoer.png", "astronaut.png", "vand.png"};
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
PImage videre;
PImage fortsaet;
PImage tilbage;
PImage stortDrinkKort;
PImage skaenk;

PFont mockhand;

boolean fortsaetTilSkaenk = false;
boolean tilbageTilDrinks = false;
int skaenkTid = 0;

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
    drinkCheck = 100;
  }
}

void mousePressed() {
  if (skaerm == 2) {
    if (mouseX > width-drinkInfoBilleder[0].width/2-fortsaet.width/2 && mouseX < width-drinkInfoBilleder[0].width/2+fortsaet.width/2 && mouseY > height-drinkInfoBilleder[0].height/2-fortsaet.height/2 && mouseY < height-drinkInfoBilleder[0].height/2+fortsaet.height/2 && valgtDrink != -1) {
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

  if (fortsaetTilSkaenk) {
    xStart = mouseX;
    yStart = mouseY;
  }
}

void mouseReleased() {
  if (dist(mouseX, mouseY, xStart, yStart) < 20 && mouseY > height/3.5-150 && mouseY < height/3.5+150) {
    valgtDrink = drinkHover;
    drinkCheck = 0;
  }

  if (dist(mouseX, mouseY, xStart, yStart) < 20 && dist(mouseX, mouseY, width-690, height/2) < screens.skaenkButtonSize/2 && millis() > skaenkTid) {
    //String[] sendRequest = loadStrings(drinks[drinkHover]);
    println(drinks[drinkHover]);
    skaenkTid = millis()+40000;
  }

  if (xDragged != 0) {
    x = x+xDragged;
    x = constrain(x, -1700, 1700);
  }

  xStart = 0;
  yStart = 0;
}
