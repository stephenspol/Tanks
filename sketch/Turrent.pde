class Turrent extends Entity{
  private int rad, w, h;
  
  private float deg;
  
  private ArrayList<Bullet> bullets;
  
  public Turrent(float x, float y) {
    super(x, y);
    
    rad = 20;
    w = 7;
    h = 45;
    
    deg = 0;
    
    bullets = new ArrayList<Bullet>();
    
    for (float i = pos.x; i <= w + pos.x; i += w)
      for (float j = pos.y; j <= h + pos.y; j += h)
        points.add(new PVector(i, j));
  }
  
  public void display() {
    pushMatrix();
    
    //Rotate Turrent
    rotate(radians(deg));
    
    fill(256, 0, 0);
    circle(0, 0, rad);
    
    rect(0, -h/2, w, h);
    
    popMatrix();
  }
  
  public void updateAngle(float otherAngle) {
    float easing = .05;
    float angle = atan2(mouseY - pos.y, mouseX - pos.x) - radians(otherAngle);
    
    float dir = (angle - radians(deg)) / TWO_PI;
    dir -= round( dir );
    dir *= TWO_PI;
    // Add 90 degree angle
    dir += .5 * PI;
    
    deg += degrees(dir * easing);
    
    for (PVector point : points) {
      point = rotate2D(point, pos.x, pos.y, degrees(dir * easing));
    }
  }
  
  public void update(PVector vel) {
    pos.add(vel);
    
    for (PVector point : points) {
      point.add(vel);
    }
    
    for (int i = bullets.size() - 1; i >= 0; i--) {
      bullets.get(i).display();
      bullets.get(i).update();
      
      if (bullets.get(i).getLifespan() <= 0) {
        bullets.remove(i);
      }
    }
  }
  
  public boolean spawnBullet(float otherAngle) {
    if (bullets.size() <= 3) {
      //new Tank().rotate2D(pos.x, pos.y, deg);
      bullets.add(new Bullet(pos.x, pos.y, 2, deg + otherAngle));
      return true;
    }
    else
      return false;
  }
  
  public void onCollision() {
  
  }
  
  public boolean checkCollision(Entity e) {
    return false;
  }
  
}
