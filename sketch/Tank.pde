public class Tank extends Entity{
  private PVector vel, acc;
  
  private Turrent gun;
  
  private int w, h;
  
  private float mass;
  
  private float deg;
  
  public Tank(float x, float y) {
    super(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    w = 40;
    h = 60;
    
    deg = 0;
    
    mass = 5;
    
    gun = new Turrent(pos.x, pos.y);
    
    // rectMode(Center) makes it so the x and y are in the center instead of top left quandrant
    for (float i = pos.x - w/2; i <= w/2 + pos.x; i += w)
      for (float j = pos.y - h/2; j <= h/2 + pos.y; j += h)
        points.add(new PVector(i, j));
  }
  
  public void display() {
    pushMatrix();
    
    //Rotate Tank
    translate(pos.x, pos.y);
    rotate(radians(deg));
    
    //Draw wheels
    pushMatrix();
    
    stroke(20);
    strokeWeight(10);
    
    line(-w/2, -h/2, -w/2, h/2);
    
    line(w/2, -h/2, w/2, h/2);
    
    popMatrix();
    
    //Draw body
    pushMatrix();
    
    fill(0, 150, 0);
    noStroke();
    
    rectMode(CENTER);
    rect(0, 0, w, h);
    
    popMatrix();
    
    //Draw front
    pushMatrix();
    
    stroke(256, 0, 0);
    strokeWeight(3);
    
    line(-w/2, -h/2, w/2, -h/2);
    
    gun.display();
    
    popMatrix();
    
    popMatrix();
    
    displayHitBoxes();
    gun.displayHitBoxes();
  }
  
  public void update() {
    vel.mult(.90);
    
    vel.add(acc);
    pos.add(vel);
    for (PVector point : points) {
      point.add(vel);
    }
    
    gun.update(vel);
    
    vel.limit(2);
    
    acc.mult(0);
    
    gun.updateAngle(deg);
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
      
      for (PVector point : points) {
        point = rotate2D(point, pos.x, pos.y, 2);
      }
    }
    
    // Move Down
    if (dir == 2) {
      PVector down = rotate2D(new PVector(0, mag), radians(deg));
      
      applyForce(down);
    }
    
    // Move Left
    if (dir == 3) {
      deg -= 2;
      
      for (PVector point : points) {
        point = rotate2D(point, pos.x, pos.y, -2);
      }
    }
  }
  
  // Rotate a vector in 2D
  public PVector rotate2D(PVector v, float theta) {
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
  
  public boolean spawnBullet() {
    return gun.spawnBullet(deg);
  }
  
  public void onCollision() {
  
  }
  
  public boolean checkCollision(Entity e) {
    return false;
  }
}
