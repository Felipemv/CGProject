public class Camera{
  public float fieldOfView;
  public PMatrix3D worldMatrix;
  
  public Camera(){
    fieldOfView = -1;
    worldMatrix = null;
  }
  
  public Camera(float fieldOfView, PMatrix3D worldMatrix){
    this.fieldOfView = fieldOfView;
    this.worldMatrix = worldMatrix;
  }
  
  public void lookAt(PVector position, PVector target, PVector up){
  }
  
  public void transform(PMatrix3D transformation){
  }
  
  public Ray generateRay(float x, float y, PVector sample){
    return null;
  }
}
