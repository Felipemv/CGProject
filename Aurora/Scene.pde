public class Scene {

  ArrayList<Shape> shapes;

  public Scene() {
    shapes = null;
  }

  public Scene(ArrayList<Shape> shapes) {
    this.shapes = shapes;
  }

  public Intersection intersects(Ray ray) {
    Intersection intersection = new Intersection();

    intersection.hit = false;
    intersection.distance = Float.MAX_VALUE;

    for (int i = 0; i < shapes.size(); i++) {
      Shape shape = shapes.get(i);
      Intersection temp = shape.intersects(ray);

      if (temp.hit && temp.distance < intersection.distance) {
        intersection = temp;
        intersection.index = i;
      }
    }

    return intersection;
  }
}
