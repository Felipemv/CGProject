public PVector[] stratifiedSample(int cameraSamples) {
  int size =  (int) sqrt(cameraSamples);
  PVector points[] = new PVector[cameraSamples];

  for (int i = 0; i < size-1; i++) {
    for (int j = 0; j < size-1; j++) {
      PVector offset = new PVector(i, j);

      points[i * size + j] = PVector.div((PVector.add(offset, PVector.random2D())), size);
    }
  }    
  return points;
}

public float gaussian2D(PVector sample, float filterWidth) {
  float r = filterWidth / 2;

  return max((int) (Math.exp(- Math.pow(sample.x, 2)) - Math.exp(- r*r)), 0) * 
    max((int) (Math.exp(- Math.pow(sample.y, 2)) - Math.exp(- r*r)), 0);
}

public PVector gamma(PVector colorP, float value) {
  float inverseGama = 1 / value;

  return new PVector((float) Math.pow(colorP.x, inverseGama), 
    (float) Math.pow(colorP.y, inverseGama), 
    (float) Math.pow(colorP.z, inverseGama));
}

public PVector exposure(PVector colorP, float value) {
  float power = (float) Math.pow(2, value);

  return new PVector(colorP.x * power, 
    colorP.y * power, 
    colorP.z * power);
}

public PVector saturate(PVector colorP) {
  return new PVector(
    (colorP.x > 1) ? 1 : (colorP.x < 0) ? 0 : colorP.x, 
    (colorP.y > 1) ? 1 : (colorP.y < 0) ? 0 : colorP.y, 
    (colorP.z > 1) ? 1 : (colorP.z < 0) ? 0 : colorP.z
    );
}
