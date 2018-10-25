public interface Light{

    public PVector emissor = null;
    
    PVector evaluate(ShaderGlobals shaderGlobals);
    
    float pdf(ShaderGlobals shaderGlobals);
    
    PVector sample(ShaderGlobals shaderGlobals, PVector sample);
}
