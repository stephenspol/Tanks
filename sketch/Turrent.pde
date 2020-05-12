class Turrent {
  private PVector pos;
  
  private int rad, w, h;
  
  private float deg;
  
  public Turrent(float x, float y) {
    pos = new PVector(x, y);
    
    rad = 20;
    w = 7;
    h = 45;
    
    deg = 0;
  }
  
  public void display() {
    pushMatrix();
    
    //Rotate Turrent
    //translate(pos.x, pos.y);
    rotate(radians(deg));
    
    fill(256, 0, 0);
    circle(0, 0, rad);
    
    rect(0, -h/2, w, h);
    
    popMatrix();
  }
  
  public void update(float otherAngle) {
    float easing = .05;
    float angle = atan2(mouseY - pos.y, mouseX - pos.x) - radians(otherAngle);
    
    float dir = (angle - radians(deg)) / TWO_PI;
    dir -= round( dir );
    dir *= TWO_PI;
    // Add 90 degree angle
    dir += .5 * PI;
    
    deg += degrees(dir * easing);
  }
  
  public void updatePos(PVector vel) {
    pos.add(vel);
  }
  
}
