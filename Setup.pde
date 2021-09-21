class setup {
  void load() {
    hint(DISABLE_DEPTH_TEST);
    hint(DISABLE_OPENGL_ERRORS);
    hint(DISABLE_OPTIMIZED_STROKE);

    drinks[0][0] = "Vand - 0,0%";
    drinks[1][0] = "Harvey Wallbanger 43 - 4,4%";
    drinks[2][0] = "Screwdriver - 0,0%";
    drinks[3][0] = "Koldskål Drink - 0,0%";
    drinks[4][0] = "Vodka Sprite - 0,0%";
    drinks[5][0] = "Piña Colada - 0,0%";
    drinks[6][0] = "Bounty Rom og Cola - 0,0%";
    drinks[7][0] = "Filur - 0,0%";
    drinks[8][0] = "Vodka Cola - 0,0%";
    drinks[9][0] = "Likør 43 og Juice - 0,0%";
    drinks[10][0] = "Astronaut - 0,0%";

    mockhand = createFont("Mockhand.ttf", 20);
    textFont(mockhand);
    textAlign(CENTER, CENTER);
    textMode(SHAPE);
    frameRate(60);

    baggrund = loadImage("baggrund.jpg");
    vaelgDinDrink = loadImage("vaelgDinDrink.png");
    frugt = loadImage("frugt.png");
    juice = loadImage("juice.png");
    velkommen = loadImage("velkommen.png");
    tryk = loadImage("tryk.png");
    vand = loadImage("vand.png");

    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i] = new bubble();
    }
    screens = new screens();
  }
}
