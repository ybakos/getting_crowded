// Rotating squares. Gets increasingly crowded in here.
// Yong Bakos

final int MAX_NUMBER_OF_SQUARES = 2000;
final float TIME_INTERVAL = 1000; // in millis
final float MIN_SCALE = 1.0; // max "zoom out"
final float SCALE_COEFFICIENT = 1.5; // increase to zoom in more
final float SCALE_SPEED = 0.001; // increase to zoom in/out faster

float theta = 0.0; // to oscillate scaling (zoom in/out)
Square[] squares = new Square[1];

void setup() {
  size(displayWidth, displayHeight);
  initializeSquares();
}

void draw() {
  background(0);
  zoomInAndOut();
  drawAndSpinAllSquares();
  if (aLittleTimeHasPassed()) addASquare();
  if (itGetsTooCrowded()) reset();
}

void zoomInAndOut() {
  theta += SCALE_SPEED;
  translate(width / 2, height / 2);
  scale(abs(sin(theta)) * SCALE_COEFFICIENT + MIN_SCALE);
}

void initializeSquares() { 
  squares[0] = new Square(random(width / 2), random(height / 2), random(-0.1, 0.1), random(48));
}

void drawAndSpinAllSquares() {
  for (int i = 0; i < squares.length; ++i) {
    squares[i].spin();
    squares[i].draw();
  }
}

void addASquare() {
  squares = (Square[])append(squares, new Square(random(-width / 2, width / 2), random(-height / 2, height / 2), random(-0.1, 0.1), random(48)));
}

boolean aLittleTimeHasPassed() {
  return millis() % TIME_INTERVAL == 0;
}

boolean itGetsTooCrowded() {
  return squares.length > MAX_NUMBER_OF_SQUARES;
}

void reset() {
  squares = new Square[1];
  initializeSquares();
}
