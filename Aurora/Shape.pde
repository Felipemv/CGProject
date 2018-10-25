public interface Shape extends Light{

    boolean explicitLight = false;
    
    Intersection intersects(Ray ray);
    
    ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection);
    
    float surfaceArea();
}
