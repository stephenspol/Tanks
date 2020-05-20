public class Wall extends Entity{
  private float w, h;
  
  public Wall(float x, float y, float _w, float _h) {
    super(x, y);
    
    w = _w;
    h = _h;
    
    for (float i = pos.x; i <= w + pos.x; i += w)
      for (float j = pos.y; j <= h + pos.y; j += h)
        points.add(new PVector(i, j));
  }
  
  public void display() {
    pushMatrix();
    
    strokeWeight(2);
    stroke(0);
    fill(210, 105, 30);
    rectMode(CORNER);
    rect(pos.x, pos.y, w, h);
    
    popMatrix();
    
    displayHitBoxes();
  }
  
  public void onCollision() {
  
  }
  
  public boolean checkCollision(Entity e) {
    ArrayList<PVector> entityPoints = e.getEdges();
      
    // Entity HitBoxes
    //ArrayList<PVector> entityHB = getHitBoxes(entityPoints);
    
    // Current Entities HitBoxes
    //ArrayList<PVector> HB = getHitBoxes(points);
    
    return true;
    //return false;
  }
  
}
