import java.util.ArrayList;

public abstract class Entity {
  protected PVector pos;
  
  protected ArrayList<PVector> points;
  
  public Entity(float x, float y) {
    pos = new PVector(x, y);
    
    points = new ArrayList<PVector>();
  }
  
  public abstract void display();
  
  public abstract void onCollision();
  
  public abstract boolean checkCollision(Entity e);
  
  public PVector getPos() {
    return pos;
  }
  
  public ArrayList<PVector> getEdges() {
    return points;
  }
  
  public PVector rotate2D(PVector vector, float centerX, float centerY, float deg) {
    PVector v = vector;
    
    v.x -= centerX;
    v.y -= centerY;
    
    v.rotate(radians(deg));
    
    v.x += centerX;
    v.y += centerY;
    
    return v;
  }
  
  public void displayHitBoxes() {
    if (showHB) {
      pushMatrix();
      for (PVector point : points) {
        strokeWeight(10);
        stroke(255);
        point(point.x, point.y);
      }
      popMatrix();
    }
  }
  
  public ArrayList<PVector> getHitBoxes(ArrayList<PVector> p) {
    ArrayList<PVector> HBPoints = new ArrayList<PVector>();
    
    for (int i = 0; i < p.size(); i++) {
      PVector point1 = p.get(i);
      PVector point2;
      
      if (i == p.size() - 1)
        point2 = p.get(0);
      else
        point2 = p.get(i + 1);
      
      HBPoints.add(point2.sub(point1));
    }
    
    return HBPoints;
  }
}
