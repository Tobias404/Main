class bubble {
  float size = random(100, 150);
  float x = random(size/2, width-size/2);
  float y = random(-size/2, height+size/2);
  float speed = 300/size;
  float sin;

  void show() {
    strokeWeight(5);
    fill(255, 150, 0, 100);
    stroke(255, 150, 0, 255);
    circle(x, y, size);
  }

  void update() {
    y -= speed;
    sin += 0.05;
    x += sin(sin);

    if (y < -size/2) {
      y = height+size/2;
      x = random(size/2, width-size/2);
    }
    if (x > width+size/2) {
      x = -size/2;
    }
  }
}
