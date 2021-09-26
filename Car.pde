class Car {


  float xpos;
  float ypos;
  float xspeed;
  int carW;
  int carH;
  PImage Car;

  Car(float tempX, float tempY, float tempXspeed, int W, int H) {

    xpos = tempX;
    ypos = tempY;
    xspeed = tempXspeed;
    carW = W;
    carH = H;
  }

  //display cars  
  void display() {
    imageMode(CENTER);    
    image(Car, xpos, ypos, carW, carH);
  }

  //move cars
  void move() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
    }
  }

  void moveOther() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }

  //change the speed of the car with each point earned
  void changeSpeed() {
    if ((frog1.yfrog <= 0) &&
      (frog1.xfrog <= width) && (frog1.xfrog >=0)) {
      this.xspeed = int(random(1, 10));
    }
  }
}
