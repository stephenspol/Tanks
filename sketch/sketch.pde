Tank tank;
boolean moveUp, moveDown, moveRight, moveLeft = false;

void setup() {
  size(700,700);
  
  tank = new Tank(400, 400);
}

void draw() {
  background(180);
  
  tank.display();
  tank.update();
  
  if (moveUp)
    tank.move(0);
  
  else if (moveDown)
    tank.move(2);
  
  if (moveRight)
    tank.move(1);
  
  else if (moveLeft)
    tank.move(3);
}

void keyPressed() {
  setMove(keyCode, key, true);
}
 
void keyReleased() {
  setMove(keyCode, key, false);
}
 
boolean setMove(int k1, int k2, boolean b) {
  if (k1 == UP || k2 == 'w')
    return moveUp = b;
  
  if (k1 == DOWN || k2 == 's')
    return moveDown = b;
 
  if (k1 == LEFT || k2 == 'a')
    return moveLeft = b;
 
  if (k1 == RIGHT || k2 == 'd')
    return moveRight = b;
 
  return b;
}
