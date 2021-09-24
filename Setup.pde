class setup {
  void load() {
    hint(DISABLE_DEPTH_TEST);
    hint(DISABLE_OPENGL_ERRORS);
    hint(DISABLE_OPTIMIZED_STROKE);

    for (int i = 0; i < drinkBillederNavne.length; i++) {
      String drink = drinkBillederNavne[i];
      drinkBillederArray[i] = loadImage(drink);
    }

    for (int i = 0; i < drinkInfo.length; i++) {
      String drink = drinkInfo[i];
      drinkInfoBilleder[i] = loadImage(drink);
    }

    //drinks[0][0] = "Vand - 0,0%";
    //drinks[1][0] = "Harvey Wallbanger 43 - 5,0%";
    //drinks[2][0] = "Screwdriver - 5,0%";
    //drinks[3][0] = "Koldskål Drink - 5,0%";
    //drinks[4][0] = "Vodka Sprite - 5,0%";
    //drinks[5][0] = "Piña Colada - 5,0%";
    //drinks[6][0] = "Bounty Rom og Cola - 5,0%";
    //drinks[7][0] = "Filur - 5,0%";
    //drinks[8][0] = "Vodka Cola - 5,0%";
    //drinks[9][0] = "Likør 43 og Juice - 5,0%";
    //drinks[10][0] = "Astronaut - 5,0%";
    //drinks[0][1] = "Vand - 200 mL";
    //drinks[1][1] = "Vodka - 17 mL";
    //drinks[2][1] = " Vodka- 26.5 mL";
    //drinks[3][1] = "Licor 43 - 32.5 mL";
    //drinks[4][1] = "Vodka - 26.5 mL";
    //drinks[5][1] = "Malibu - 48 mL";
    //drinks[6][1] = "Malibu - 48 mL";
    //drinks[7][1] = "Råstoff - 61 mL";
    //drinks[8][1] = "Vodka -26.5 mL";
    //drinks[9][1] = "Licor 43 - 32.5 mL";
    //drinks[10][1] = "Råstoff - 61 mL";

    frameRate(60);

    baggrund = loadImage("baggrund.jpg");
    vaelgDinDrink = loadImage("vaelgDinDrink.png");
    frugt = loadImage("frugt.png");
    juice = loadImage("juice.png");
    velkommen = loadImage("velkommen.png");
    tryk = loadImage("tryk.png");

    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i] = new bubble();
    }
    screens = new screens();
  }
}
