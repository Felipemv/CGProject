public class Diffuse extends BSDF{

  public PVector albedo;
  
  public Diffuse(){}
  public Diffuse(PVector albedo){
    this.albedo = albedo;
  }
  
  @Override
  public PVector evaluate(ShaderGlobals shaderGlobals){
    return PVector.mult(albedo, INVERSE_PI);
  }
  
  @Override
  public float pdf(ShaderGlobals shaderGlobals){
    return 0;
  }
  
  @Override
  PVector sample(ShaderGlobals shaderGlobals, PVector sample){
    return null;
  }
}
