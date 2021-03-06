class screens {
  float lerpCheck = 0;
  float xFrugt = -frugt.width;
  float yJuice = juice.height+100;
  float yVelkommen = -velkommen.height-100;
  float fade = 0;
  float sliderTransition = 0;
  float largeDrinkCardX = 0;
  float skaenkButtonSize = 0;
  boolean trykket1 = false;
  boolean skaenkKnapTryk = false;

  void velkommen() {
    if (mousePressed) {
      trykket1 = true;
    }
    tint(255, 255);
    image(juice, width-juice.width, height-juice.height+yJuice);
    image(frugt, xFrugt, height-frugt.height);
    image(velkommen, width/2-velkommen.width/2, yVelkommen);

    tint(255, fade);
    image(tryk, width/2-tryk.width/2, height/2-60);

    if (trykket1 == false) {
      xFrugt = lerp(xFrugt, 0, 0.2);
      yJuice = lerp(yJuice, 0, 0.1);
      yVelkommen = lerp(yVelkommen, 75, 0.1);
      fade = lerp(fade, 255, 0.1);
    } else {
      xFrugt = lerp(xFrugt, -frugt.width, 0.2);
      yJuice = lerp(yJuice, juice.height+100, 0.1);
      yVelkommen = lerp(yVelkommen, -velkommen.height-100, 0.1);
      fade = lerp(fade, 0, 0.1);
      lerpCheck = lerp(lerpCheck, 100, 0.1);
      fortsaetTilSkaenk = false;
      if (lerpCheck > 99.8) {
        skaerm = 2;
        sliderTransition = 2200;
        lerpCheck = 0;
      }
    }
  }

  void drink() {
    tint(255, fade);
    image(vaelgDinDrink, width/2-vaelgDinDrink.width/2, 12);

    if (millis() > aktiv+20000) {
      fade = lerp(fade, 0, 0.1);
      sliderTransition = lerp(sliderTransition, 3000, 0.1);
      x = lerp(x, 0, 0.1);
      lerpCheck = lerp(lerpCheck, 100, 0.1);
      if (lerpCheck > 99.8) {
        skaerm = 1;
        trykket1 = false;
        lerpCheck = 0;
        xFrugt = -frugt.width;
        yJuice = juice.height+100;
        yVelkommen = -velkommen.height-100;
        fade = 0;
        valgtDrink = -1;
        drinkCheck = 100;
      }
    } else {
      if (!fortsaetTilSkaenk) {
        fade = lerp(fade, 255, 0.1);
        sliderTransition = lerp(sliderTransition, 0, 0.1);
      }

      if (fortsaetTilSkaenk) {
        fade = lerp(fade, 0, 0.1);
        sliderTransition = lerp(sliderTransition, 3000, 0.1);
        x = lerp(x, 0, 0.1);
        lerpCheck = lerp(lerpCheck, 100, 0.1);
        if (lerpCheck > 99.8) {
          skaerm = 3;
          largeDrinkCardX = -600;
          lerpCheck = 0;
          fade = 0;
          drinkCheck = 100;
        }
      }
    }

    if (mousePressed && mouseY > height/3.5-150 && mouseY < height/3.5+150 || mousePressed && mouseY > height/3.5+150 || mousePressed && mouseY < height/3.5-150) {
      if (xStart == 0) {
        xStart = mouseX;
        yStart = mouseY;
      }

      if (yStart > height/3.5-150 && yStart < height/3.5+150) {
        xDragged = xStart-mouseX;
      }

      x = constrain(x, -1700, 1700);
    } else {
      if (x >= 1700 || x <= -1700) {
        xDragged = lerp(xDragged, 0, 0.5);
      } else {
        xDragged = 0;
      }
    }

    fill(0, 80*fade/255);
    noStroke();
    rect(0, height/3.5-180, width, 360);

    stroke(0, 80*fade/255);
    strokeWeight(380);
    float scrollL = constrain(x+xDragged-300, -1700, 1700);
    float scrollR = constrain(x+xDragged+300, -1700, 1700);
    scrollL = map(scrollL, -1700, 1700, 50, width-100);
    scrollR = map(scrollR, -1700, 1700, 100, width-50);
    line(scrollL, height/3.5, scrollR, height/3.5);
    noStroke();

    println(x);
    println(xDragged);

    if (drinkCheck < 99.8) {
      drinkCheck = lerp(drinkCheck, 100, 0.1);
      x = lerp(x, -1600+valgtDrink*320+(valgtDrink-5)*20, 0.1);
    }

    strokeWeight(20);
    for (int i = 0; i < 11; i++) {
      if (mouseX > width/2-11*170+i*340-x-xDragged+20 && mouseX < width/2-11*170+i*340-x-xDragged+300+20 && mouseY > height/3.5-150 && mouseY < height/3.5+150) {
        drinkHover = i;
      }

      if (valgtDrink == i) {
        fill(200);
        stroke(165);
      } else {
        fill(255);
        stroke(220);
      }
      rect(width/2-11*170+i*340-x-xDragged+sliderTransition+20, height/3.5-150, 300, 300, 50);
      image(drinkBillederArray[i], width/2-11*170+i*340-x-xDragged+sliderTransition+150-drinkBillederArray[i].width/2+20, height/3.5-150+150-drinkBillederArray[i].height/2);
    }

    if (valgtDrink >= 0 && valgtDrink <= 10) {
      image(drinkInfoBilleder[valgtDrink], 0, height-drinkInfoBilleder[valgtDrink].height);
      image(fortsaet, width-drinkInfoBilleder[0].width/2-fortsaet.width/2, height-drinkInfoBilleder[0].height/2-fortsaet.height/2);
    }
  }

  void skaenk() {
    tint(255, fade);
    image(tilbage, 20, height-tilbage.height-20);
    fill(0, 80*fade/255);
    noStroke();
    rect(30+largeDrinkCardX, 30, 480, 800, 50);
    circle(width-690, height/2, skaenkButtonSize);
    if (skaenkKnapTryk) {
      circle(width-690, height/2, skaenkButtonSize*(1-(float(skaenkTid-millis())/30000.0)));
    }
    image(skaenk, width-690-skaenk.width/2*(skaenkButtonSize/(height-height/3)), height/2-skaenk.height/2*(skaenkButtonSize/(height-height/3)), skaenk.width*(skaenkButtonSize/(height-height/3)), skaenk.height*(skaenkButtonSize/(height-height/3)));
    image(drinkBillederArray[valgtDrink], 20+250-drinkBillederArray[valgtDrink].width/2*1.5+largeDrinkCardX, 20+stortDrinkKort.height/2-drinkBillederArray[valgtDrink].height/2*1.5, drinkBillederArray[valgtDrink].width*1.5, drinkBillederArray[valgtDrink].height*1.5);

    if (millis() > aktiv+20000 && !skaenkKnapTryk) {
      fade = lerp(fade, 0, 0.1);
      largeDrinkCardX = lerp(largeDrinkCardX, -600, 0.1);
      skaenkButtonSize = lerp(skaenkButtonSize, 0, 0.1);
      lerpCheck = lerp(lerpCheck, 100, 0.1);
      if (lerpCheck > 99.8) {
        skaerm = 1;
        trykket1 = false;
        lerpCheck = 0;
        xFrugt = -frugt.width;
        yJuice = juice.height+100;
        yVelkommen = -velkommen.height-100;
        fade = 0;
        valgtDrink = -1;
      }
    } else {
      if (!tilbageTilDrinks) {
        fade = lerp(fade, 255, 0.1);
        sliderTransition = lerp(sliderTransition, 0, 0.1);
        if (!skaenkKnapTryk) {
          skaenkButtonSize = lerp(skaenkButtonSize, height-height/3, 0.1);
        } else {
          skaenkButtonSize = lerp(skaenkButtonSize, height-height/2, 0.1);
        }
        largeDrinkCardX = lerp(largeDrinkCardX, 0, 0.1);
      }
    }

    if (tilbageTilDrinks) {
      fade = lerp(fade, 0, 0.1);
      largeDrinkCardX = lerp(largeDrinkCardX, -600, 0.1);
      skaenkButtonSize = lerp(skaenkButtonSize, 0, 0.1);
      lerpCheck = lerp(lerpCheck, 100, 0.1);
      if (lerpCheck > 99.8) {
        skaerm = 2;
        sliderTransition = 2200;
        lerpCheck = 0;
        drinkCheck = 0;
      }
    }

    if (skaenkKnapTryk) {
      if (millis() > skaenkTid) {
        screens.skaenkKnapTryk = false;
      }
    }
  }
}
