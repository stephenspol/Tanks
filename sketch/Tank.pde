public class Tank {
  private PVector pos, vel, acc;
  
  private int w, h;
  
  private float mass;
  
  private float deg;
  
  public Tank(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    w = 40;
    h = 60;
    
    deg = 0;
    
    mass = 5;
  }
  
  public void display() {
    pushMatrix();
    
    //Rotate Tank
    translate(pos.x, pos.y);
    rotate(radians(deg));
    
    //Draw wheels
    stroke(20);
    strokeWeight(10);
    
    line(-w/2, -h/2, -w/2, h/2);
    
    line(w/2, -h/2, w/2, h/2);
    
    //Draw body
    fill(0, 150, 0);
    noStroke();
    
    rectMode(CENTER);
    rect(0, 0, w, h);
    
    //Draw center
    fill(256, 0, 0);
    circle(0, 0, 5);
    
    //Draw front
    stroke(256, 0, 0);
    strokeWeight(3);
    
    line(-w/2, -h/2, w/2, -h/2);
    
    popMatrix();
  }
  
  public void update() {
    vel.mult(.90);
    
    vel.add(acc);
    pos.add(vel);
    
    vel.limit(2);
    
    acc.mult(0);
  }
  
  // F = M * A OR A = F / M
  public void applyForce(PVector force) {
    acc.add(PVector.div(force, mass));
  }
  
  // Directions 0 = Forward | 1 = Right | 2 = Down | 3 = Left
  public void move(int dir) {
    float mag = 1;
    
    // Move Forward
    if (dir == 0) {
      PVector forward = rotate2D(new PVector(0, -mag), radians(deg));
      
      applyForce(forward);
    }
    
    // Move Right
    if (dir == 1) {
      deg += 2;
    }
    
    // Move Down
    if (dir == 2) {
      PVector down = rotate2D(new PVector(0, mag), radians(deg));
      
      applyForce(down);
    }
    
    // Move Left
    if (dir == 3) {
      deg -= 2;
    }
  }
  
  // Rotate a vector in 2D
  private PVector rotate2D(PVector v, float theta) {
    // What's the magnitude?
    float m = v.mag();
    // What's the angle?
    float a = v.heading();
    
    // Change the angle
    a += theta;
    
    // Polar to cartesian for the new xy components
    v.x = m * cos(a);
    v.y = m * sin(a);
    
   return v;
}
}
