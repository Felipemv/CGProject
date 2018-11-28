  public final float INVERSE_PI = 0.31830988618379067154;
    
  float uniformRandom1D() {
      return random(1.0);
  }
  PVector uniformRandom2D() {
      return new PVector(uniformRandom1D(), uniformRandom1D());
  }
  ArrayList<PVector> stratifiedSample(int samples) {
      ArrayList<PVector> points = new ArrayList(samples);
      
      int size = (int)sqrt(samples);
      
      for (int i = 0; i < samples; i++) {
          PVector offset = new PVector(i / size, i % size);
          PVector point = PVector.add(uniformRandom2D(), offset).div(size);
          
          points.add(point);
      }
      
      return points;
  }
  
  float gaussian1D(float sample, float width) {
      float radius = width * 0.5;
      return max(0, exp(-sample * sample) - exp(-radius * radius));
  }
  float gaussian2D(PVector sample, float width) {
      return gaussian1D(sample.x, width) * gaussian1D(sample.y, width);
  }
  
  PVector saturate(PVector colour) {
      return new PVector(constrain(colour.x, 0, 1.0), constrain(colour.y, 0, 1.0), constrain(colour.z, 0, 1.0));
  }
  PVector gamma(PVector colour, float value) {
      float t = 1.0 / value;
      return new PVector(pow(colour.x, t), pow(colour.y, t), pow(colour.z, t));
  }
  PVector exposure(PVector colour, float value) {
      float t = pow(2.0, value);
      return new PVector(colour.x * t, colour.y * t, colour.z * t);
  }
  
  PVector multiplyColor(PVector a, PVector b){
     return new PVector (a.x * b.x, a.y * b.y, a.z * b.z);
  }
