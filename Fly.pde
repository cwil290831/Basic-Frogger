class Flies {

  color d;
  float xfly;
  float yfly;
  float flyspeedX;
  float flyspeedY;
  int flyW;
  int flyH;
  boolean hasFly = false;
  PImage fly;

  Flies(float _x, float _y, float _speedfx, float _speedfy) {

    //d = _d;
    xfly = _x;
    yfly = _y;
    flyspeedX = _speedfx;
    flyspeedY = _speedfy;
    flyW = 15;
    flyH = 15;
  }

  //display fly
  void displayFly() {
    image (fly, xfly, yfly, flyW, flyH);
  }

  //move fly
  void moveFly() {
    xfly = xfly + flyspeedX;
    yfly = yfly + flyspeedY;

    if ((xfly > width) || (xfly < 0)) {
      flyspeedX = flyspeedX * - 1;
    }
    if ((yfly > height) || (yfly < 0)) {
      flyspeedY = flyspeedY * - 1;
    }
  }


  //a function to show you've eaten the fly
  void flyCaught() {
    if ((xfly < frog1.xfrog + frog1.frogW/2) && 
      (xfly > frog1.xfrog - frog1.frogW/2) && 
      (yfly < frog1.yfrog + frog1.frogH/2) &&
      (yfly > frog1.yfrog - frog1.frogH/2)) {  

      xfly = frog1.xfrog;
      yfly = frog1.yfrog;
      flyspeedX = frog1.speedfrog;
      flyspeedY = frog1.speedfrog;

      hasFly = true;
    }
  }
}
