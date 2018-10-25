public class Scene{
  
    ArrayList<Shape> shapes;
    
    public Scene(){
    }
    
    public Scene(ArrayList<Shape> shapes){
        this.shapes = shapes;
    }
    
    public Intersection intersects(Ray ray){
        Intersection intersection = new Intersection();
        
        intersection.hit = false;
        intersection.distance = Float.MAX_VALUE;
        
        for(Shape object : shapes){
            Intersection temp = object.intersects(ray);
            
            if(temp.hit && temp.distance < intersection.distance){
                intersection = temp;
                intersection.object = object;
            }
        }
      
        return intersection;
    }
}
