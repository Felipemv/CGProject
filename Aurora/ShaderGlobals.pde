public class ShaderGlobals{

    public PVector point;
    public PVector normal;
    public PVector uv;
    public PVector tangentU;
    public PVector tangentV;
    public PVector viewDirection;    
    public PVector lightDirection;    
    public PVector lightPoint;    
    public PVector lightNormal;
    
    public ShaderGlobals(){
        point = null;
        normal = null;
        uv = null;
        tangentU = null;
        tangentV = null;
        viewDirection = null;  
        lightDirection = null;
        lightPoint = null;
        lightNormal = null;
    }
}
