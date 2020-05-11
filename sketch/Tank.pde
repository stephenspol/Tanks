public class Tank {
  private PVector pos, vel, acc;
  
  private int w, h;
  
  private float deg;
  
  public Tank(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    w = 60;
    h = 40;
    
    deg = 0;
  }
  
  public void display() {
    fill(0);
    rect(pos.x, pos.y, w, h);
    
    rotate(deg);
  }
  
  public void update() {
    pos.add(vel);
  }
  
  public void apply(PVector force) {
    acc.add(force);
    vel.add(acc);
    
    acc.mult(0);
  }
  
  // Directions 0 = Forward | 1 = Right | 2 = Down | 3 = Left
  public void move(int dir) {
    // Move Forward
    if (dir == 0) {
      apply(new PVector(2, 0));
    }
    
    if (dir == 2) {
      apply(new PVector(-2, 0));
    }
  }
}
