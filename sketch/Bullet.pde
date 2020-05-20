class Bullet extends Entity{
  private PVector vel, acc;
  
  private float deg;
  
  private float w, h;
  
  private int lifespan;
  
  public Bullet(float posX, float posY, float mag, float angle) {
    super(posX, posY);
    vel = new Tank(0, 0).rotate2D(new PVector(0, -mag), radians(angle));
    acc = new PVector();
    
    deg = angle;
    
    w = 5;
    h = 20;
    
    lifespan = 120;
    
    for (float i = pos.x - w/2; i <= w/2 + pos.x; i += w)
      for (float j = pos.y - h/2; j <= h/2 + pos.y; j += h)
        points.add(rotate2D(new PVector(i, j), pos.x, pos.y, deg));
  }
  
  public void display() {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(radians(deg));
    
    noStroke();
    fill(0);
    
    rect(0, 0, w, h);
    
    popMatrix();
    
    displayHitBoxes();
  }
  
  public void update() {
    pos.add(vel);
    
    for (PVector point : points) {
      point.add(vel);
    }
    
    lifespan--;
  }
  
  public int getLifespan() {
    return lifespan;
  }
  
  public void onCollision() {
  
  }
  
  public boolean checkCollision(Entity e) {
    return false;
  }
  
}
