public abstract class Shape extends Light{

    boolean explicitLight;
    
    public Shape(){
        super();
        explicitLight = false;
    }
    
    public Shape(boolean explicitLight){
        this.explicitLight = explicitLight;
    }
    
    abstract Intersection intersects(Ray ray);
    
    abstract ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection);
    
    abstract float surfaceArea();
}
