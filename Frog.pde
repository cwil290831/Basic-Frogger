class Frog {

  color b;
  float xfrog;
  float yfrog;
  float speedfrog;
  int frogW;
  int frogH;
  int lives;
  int score;
  PImage frog;
  boolean scorePrint = true;
  boolean livesPrint = true;


  Frog(float _X, float _Y, float _speed) {
    //b = _b;
    xfrog = _X;
    yfrog = _Y;
    speedfrog = _speed;
    frogW = 30;
    frogH = 30;
    lives = 1;
    score = 0;
  }


  //display frog
  void displayFrog() {
    imageMode(CENTER);
    image(frog, xfrog, yfrog, frogW, frogH);
  }

  //move frog  
  void moveFrog() {
    if (keyPressed == true) {
      if (keyCode == RIGHT) {
        xfrog = xfrog + 5;
      }
      if (keyCode == LEFT) {
        xfrog = xfrog - 5;
      }
      if (keyCode == UP) {
        yfrog = yfrog - 5;
      }
      if (keyCode == DOWN) {
        yfrog = yfrog + 5;
      }
      //fixes bug that allows player to avoid cars by climbing outside the play area 
      if ((xfrog < 0) || (xfrog > width - frogW/2)) {
        xfrog = 0 + frogW/2; 
        xfrog = width - frogW/2;
      }
    }
  }

  //a function to show when the frog hits a car and loses lives
  void hitRedCar() {
    for (int i = 0; i < redCars.length; i++) {
      if ((xfrog < redCars[i].xpos + redCars[i].carW/2) &&
        (xfrog > redCars[i].xpos - redCars[i].carW/2) &&
        (yfrog < redCars[i].ypos + redCars[i].carH/2) &&
        (yfrog > redCars[i].ypos - redCars[i].carH/2)) {
        
          lives = lives - 1;
      }
    
    }
    
   }
 void hitYellowCar(){
     for (int i = 0; i < yellowCars.length; i++) {
        if ((xfrog < yellowCars[i].xpos + yellowCars[i].carW/2) &&
          (xfrog > yellowCars[i].xpos - yellowCars[i].carW/2) &&
          (yfrog < yellowCars[i].ypos + yellowCars[i].carH/2) &&
          (yfrog > yellowCars[i].ypos - yellowCars[i].carH/2)) {
          
            lives = lives - 1;
        }
      }
   
 }

    //a function to reset the frog each time it crosses the street
    void crossedTheStreet() {
      if ((frog1.yfrog == 0) &&
        (frog1.xfrog <= width) && 
        (frog1.xfrog >= 0)) {

        xfrog = 250;
        yfrog = 700;
        score = score + 1;

        for (int i = 0; i < redCars.length; i++) {
          redCars[i].xspeed = random(1, 10);
          redCars[i].ypos  = random(0,height);
        }

        for (int i = 0; i < yellowCars.length; i++) {
          yellowCars[i].xspeed = random(1, 10);
          yellowCars[i].ypos  = random(0,height);
        }

        if (fly1.hasFly == true) {
          score = score + 1;
          fly1.hasFly = false;
          fly1.flyspeedX = random(1, 10);
          fly1.flyspeedY = random(1, 10);
        }
        
      }
    }
  

    //Functions for winning or losing
    void wonGame() {
      if (scorePrint == true) {
        textSize(15);
        fill(255);
        text("Score: " + score, 50, 50);
      }
      
      if (score >= 10) {
        background(239,250,12);
        textSize(50);
        fill(0);
        text("You Won", 230, 350);
        noLoop();
      }
    }

    void startOver() {
       if (livesPrint == true) {
        textSize(15);
        fill(255);
        text("Lives: " + lives, 50, 70);
      }
      
      if (lives <= 0) {
        background(255, 0, 0);
        textSize(50);
        fill(0);
        text("Game over!", 200, 350);
        noLoop();
      }
    }
  }
