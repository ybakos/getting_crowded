class Square {

  float x, y;
  float theta;
  float speed;
  float width;
  int shade;

  Square(float x, float y, float speed, float width) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.width = width;
    this.shade = color(random(90, 250), random(90, 250), random(150, 210), 100);
  }

  void spin() {
    theta += speed;
  }

  void draw() {
    rectMode(CENTER);
    stroke(shade);
    fill(shade);
    pushMatrix();
    translate(x, y);
    rotate(theta);
    rect(0, 0, width, width);
    popMatrix();
  }

}
