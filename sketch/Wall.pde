public class Wall {
  PVector pos;
  
  float w, h;
  
  public Wall(float x, float y, float _w, float _h) {
    pos = new PVector(x, y);
    
    w = _w;
    h = _h;
  }
  
  public void display() {
    pushMatrix();
    
    noStroke();
    fill(210, 105, 30);
    rect(pos.x, pos.y, w, h);
    
    popMatrix();
  }
  
  /*public boolean checkCollision() {
    
  }*/
  
}
