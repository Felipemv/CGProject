  public class Renderer {
  
  public RenderOptions options;
  public Camera camera;
  public Scene scene;
  
  public Renderer() {
  }
  
  public Renderer(RenderOptions options, Camera camera, Scene scene) {
    this.options = options;
    this.camera = camera;
    this.scene = scene;
  }
  
  public PVector computeDirectIlumination(BSDF bsdf, ShaderGlobals shaderGlobals) {
    PVector directIllumination = new PVector(0, 0, 0);
    
    for(int i = 0; i < scene.shapes.size(); i++){
       Shape light = scene.shapes.get(i);
       
       if(light.explicitLight){
          shaderGlobals.lightDirection = PVector.sub(((Sphere)light).position, shaderGlobals.point).normalize();
          
          Ray ray = new Ray(shaderGlobals.point, shaderGlobals.lightDirection);
          
          Intersection intersection = scene.intersects(ray);
          if(intersection.hit && intersection.index == i){
            float cosine = shaderGlobals.normal.dot(shaderGlobals.lightDirection);
            PVector bsdfValue = bsdf.evaluate(shaderGlobals);
              

            PVector lightIntensity = PVector.mult(light.evaluate(shaderGlobals), i);
            
            
            directIllumination.add(multiplyColor(bsdfValue.mult(cosine), lightIntensity));
          }
       }
    }
    
    return directIllumination;
  }
  
  public PVector computeIndirectIlumination(BSDF bsdf, ShaderGlobals shaderGlobals, int depth) {
    return null;
  }
  
  public PVector trace(Ray ray, int depth) {
    Intersection intersection = scene.intersects(ray);
  
    if (intersection.hit) {
      Shape shape = scene.shapes.get(intersection.index);
      ShaderGlobals shaderGlobals = shape.calculateShaderGlobals(ray, intersection);
      
      if(shape.explicitLight){
        shape.evaluate(shaderGlobals);
      }
        return  computeDirectIlumination(shape.bsdf, shaderGlobals);
    }
    return new PVector(0, 0, 0);  
  }
  
  public PImage render() {
    PImage image = createImage(options.width, options.height, RGB);
        
        for (int i = 0; i < options.width; i++) {
            for (int j = 0; j < options.height; j++) {
                ArrayList<PVector> cameraSamples = stratifiedSample(options.cameraSamples);
                
                PVector colour = new PVector(0, 0, 0);
                float weightSum = 0;
                
                for (int k = 0; k < options.cameraSamples; k++) {
                    PVector sample = PVector.sub(cameraSamples.get(k), new PVector(0.5, 0.5)).mult(options.filterWidth);
                    
                    Ray ray = camera.generateRay(i, j, sample);
                    float weight = gaussian2D(sample, options.filterWidth);
                    
                    colour.add(PVector.mult(trace(ray, 0), weight));
                    weightSum += weight;
                }
                
                colour.div(weightSum);
                colour = saturate(exposure(gamma(colour, options.gamma), options.exposure)).mult(255.0);
                
                image.set(i, j, color(colour.x, colour.y, colour.z));
            }
        }
        
        return image;
  }
  
  }
