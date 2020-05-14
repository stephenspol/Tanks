class Bullet {
  private PVector pos, vel, acc;
  
  float deg;
  
  float w, h;
  
  int lifespan;
  
  public Bullet(float posX, float posY, float mag, float angle) {
    pos = new PVector(posX, posY);
    vel = new Tank(0, 0).rotate2D(new PVector(0, -mag), radians(angle));
    acc = new PVector();
    
    deg = angle;
    
    w = 5;
    h = 20;
    
    lifespan = 120;
  }
  
  public void display() {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(radians(deg));
    
    noStroke();
    fill(0);
    
    rect(0, 0, w, h);
    
    popMatrix();
  }
  
  public void update() {
    pos.add(vel);
    lifespan--;
  }
  
  public int getLifespan() {
    return lifespan;
  }
  
}
