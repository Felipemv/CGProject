public class Sphere {
    
    public PVector position;
    public float radius;
    
    public Sphere(){
    }
    
    public Sphere(PVector position, float radius, boolean explicitLight, PVector emissor){
          this.position = position;
          this.radius = radius;
    }
}
