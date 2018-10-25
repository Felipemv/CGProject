public class Sphere implements Shape {

  public PVector position;
  public float radius;

  public Sphere() {
  }

  public Sphere(PVector position, float radius, boolean explicitLight, PVector emissor) {
    this.position = position;
    this.radius = radius;
  }

  @Override
    public PVector evaluate(ShaderGlobals shaderGlobals) {
    return null;
  }

  @Override
    public float pdf(ShaderGlobals shaderGlobals) {
    return -1;
  }

  @Override
    public PVector sample(ShaderGlobals shaderGlobals, PVector sample) {
    return null;
  }

  @Override
    public Intersection intersects(Ray ray) {
    Intersection intersection = null);
    
    PVector L = position.cross(position, ray.origin);
    float tm = PVector.dot(L, ray.direction);
    
    if(tm >= 0){
        intersection = new Intersection();
        intersection.hit = true;
        
        double d = Math.sqrt(PVector.dot(L,L) - Math.pow(tm,2));
        double deltaT = Math.sqrt(Math.pow(radius,2) - Math.pow(d,2));
        double t0 = tm - deltaT;
        //double t1 = tm + deltaT;
        
        intersection.distance = t0;
    }

    return intersection;
  }

  @Override
    public ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection) {
    return null;
  }

  @Override
    public float surfaceArea() {
    return -1;
  }
}
