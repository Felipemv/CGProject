public abstract class BSDF{

    abstract PVector evaluate(ShaderGlobals shaderGlobals);
    
    abstract float pdf(ShaderGlobals shaderGlobals);
    
    abstract PVector sample(ShaderGlobals shaderGlobals, PVector sample);
}
