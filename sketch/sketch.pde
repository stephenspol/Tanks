import java.util.ArrayList;

Tank tank;
ArrayList<Wall> walls;
boolean moveUp, moveDown, moveRight, moveLeft = false;

// Show HitBoxes
public boolean showHB;

void setup() {
  size(1000, 1000);
  
  tank = new Tank(400, 400);
  
  walls = new ArrayList<Wall>();
  
  walls.add(new Wall(300, 20, 70, 20));
  
  showHB = false;
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
    
  for (Wall wall : walls) {
    wall.display();
    wall.checkCollision(tank);
  }
}

void keyPressed() {
  setMove(keyCode, key, true);
  
  if (key == 'h') {
    showHB = !showHB;
  }
}
 
void keyReleased() {
  setMove(keyCode, key, false);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    tank.spawnBullet();
  }
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
