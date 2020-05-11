Tank tank;

void setup() {
  size(700,700);
  
  tank = new Tank(100, 100);
}

void draw() {
  background(180);
  
  tank.display();
  tank.update();
}

void keyPressed() {
  if (keyCode == UP) {
    tank.move(0);
  }
  
  else if (keyCode == DOWN) {
    tank.move(2);
  }
}
