public class Intersection{
    
    public boolean hit;
    public float distance;
    public int index;
    public Shape object;
    
    public Intersection(){
    }
    
    public Intersection(boolean hit, float distance, int index){
        this.hit = hit;
        this.distance = distance;
        this.index = index;
    }
}
