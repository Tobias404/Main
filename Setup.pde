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

    frameRate(60);

    baggrund = loadImage("baggrund.jpg");
    baggrund.resize(width, height);
    vaelgDinDrink = loadImage("vaelgDinDrink.png");
    frugt = loadImage("frugt.png");
    juice = loadImage("juice.png");
    velkommen = loadImage("velkommen.png");
    tryk = loadImage("tryk.png");
    videre = loadImage("videre.png");
    fortsaet = loadImage("fortsæt.png");
    tilbage = loadImage("tilbage.png");
    stortDrinkKort = loadImage("stortDrinkKort.png");
    skaenk = loadImage("skaenk.png");
    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i] = new bubble();
    }
    screens = new screens();
  }
}
