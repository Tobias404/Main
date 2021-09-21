class screens {
  float lerpCheck = 0;
  float xFrugt = -frugt.width;
  float yJuice = juice.height+100;
  float yVelkommen = -velkommen.height-100;
  float fade = 0;
  float sliderTransition = 0;
  boolean trykket1 = false;

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

    if (millis() > aktiv+7000) {
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
      }
    } else {
      fade = lerp(fade, 255, 0.1);
      sliderTransition = lerp(sliderTransition, 0, 0.1);
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
    rect(20, height/3.5+180+20, width/2-40, height-(height/3.50+180)-40, 50);

    strokeWeight(20);
    for (int i = 0; i < 11; i++) {
      if (mouseX > width/2-11*170+i*340-x-xDragged && mouseX < width/2-11*170+i*340-x-xDragged+300 && mouseY > height/3.5-150 && mouseY < height/3.5+150) {
        drinkHover = i;
      }

      if (valgtDrink == i) {
        fill(200);
        stroke(165);
      } else {
        fill(255);
        stroke(220);
      }
      rect(width/2-11*170+i*340-x-xDragged+sliderTransition, height/3.5-150, 300, 300, 50);
      image(vand, width/2-11*170+i*340-x-xDragged+sliderTransition+150-vand.width/2, height/3.5-150+150-vand.height/2);
    }

    fill(255, fade);
    textAlign(LEFT, CENTER);
    textSize(60);
    if (valgtDrink >= 0 && valgtDrink <= 10) {
      text((drinks[valgtDrink][0]), 50, height/3.5+180+50);
    }
  }

  void skaenk() {
  }
}
