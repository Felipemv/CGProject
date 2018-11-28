  void setup() {
      size(500, 500);
      
      RenderOptions options = new RenderOptions(500, 500, 4, 1, 4, 4, 2.0, 2.2, 0);
      
      Camera camera = new Camera(radians(90.0), new Film(options.width, options.height), new PMatrix3D());
      camera.lookAt(new PVector(0, 0, 35), new PVector(0, 0, 0), new PVector(0, 1.0, 0));
      
      Diffuse whiteDiffuse = new Diffuse(new PVector(1.0, 1.0, 1.0));
      Diffuse redDiffuse = new Diffuse(new PVector(1.0, 0, 0));
      Diffuse greenDiffuse = new Diffuse(new PVector(0, 1.0, 0));
      Diffuse checkboardDiffuse = new Diffuse(new PVector(1.0, 1.0, 1.0)) {
          @Override
          public PVector evaluate(ShaderGlobals shaderGlobals) {
              return multiplyColor(PVector.mult(albedo, INVERSE_PI), checkerboard(shaderGlobals.uv, 10.0));
          }
          
          private PVector checkerboard(PVector uv, float size) {
            float m = floor(size * uv.x) + floor(size * uv.y);
            float c = m % 2 > 0.5 ? 1.0 : 0;
            
            return new PVector(c, c, c);
        }
      };
      
      Sphere left = new Sphere(new PVector(-1.0e5 - 5.0, 0, 0), 1.0e5, redDiffuse, false, null);
      Sphere right = new Sphere(new PVector(1.0e5 + 5.0, 0, 0), 1.0e5, greenDiffuse, false, null);
      Sphere bottom = new Sphere(new PVector(0, -1.0e5 - 5.0, 0), 1.0e5, whiteDiffuse, false, null);
      Sphere top = new Sphere(new PVector(0, 1.0e5 + 5.0, 0), 1.0e5, whiteDiffuse, false, null);
      Sphere back = new Sphere(new PVector(0, 0, -1.0e5 - 5.0), 1.0e5, whiteDiffuse, false, null);
      Sphere light = new Sphere(new PVector(0, 2.0, 0), 0.5, null, true, new PVector(1.0, 1.0, 1.0).mult(40.0));
      Sphere frontSphere = new Sphere(new PVector(2.0, -3.0, 2.0), 2.0, checkboardDiffuse, false, null);
      Sphere backSphere = new Sphere(new PVector(-2.0, -3.0, -2.0), 2.0, checkboardDiffuse, false, null);
      /*
      Sphere left = new Sphere(new PVector(-1e5 - 5, 0, 0), 1e5, diffuse, false, null);
      Sphere right = new Sphere(new PVector(+1e5 + 5, 0, 0), 1e5, diffuse, false, null);
      Sphere bottom = new Sphere(new PVector(0, -1e5 - 5, 0), 1e5, diffuse, false, null);
      Sphere top = new Sphere(new PVector(0, +1e5 + 5, 0), 1e5, diffuse, false, null);
      Sphere back = new Sphere(new PVector(0, 0, -1e5 - 5), 1e5, diffuse, false, null);
      Sphere lightBall = new Sphere(new PVector(0, 2, 0), 2, diffuse,true , new PVector(1.0,1.0,1.0));
      Sphere frontBall = new Sphere(new PVector(2, -3, 2), 2, diffuse, false, null);
      Sphere backBall = new Sphere(new PVector(-2, -3,-2), 2, diffuse, false, null);
     */
      ArrayList<Shape> shapes = new ArrayList();
      
      shapes.add(left);
      shapes.add(right);
      shapes.add(top);
      shapes.add(bottom);
      shapes.add(back);
      shapes.add(light);
      shapes.add(frontSphere);
      shapes.add(backSphere);
      
      Scene scene = new Scene(shapes);
      
      Renderer renderer = new Renderer(options, camera, scene);
      
      image(renderer.render(), 0, 0);
      
      noLoop();
  }
