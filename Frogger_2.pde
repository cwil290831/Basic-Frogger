Car [] redCars = new Car[5];
Car [] yellowCars = new Car[5];
Frog frog1;
Flies fly1;


void settings() {
  size(700, 700);
}

void setup() {
  //cars
  for (int i = 0; i < redCars.length; i++) {
    redCars[i] = new Car (100, int(random(0, height)), int(random(1, 10)), 30, 20);
    redCars[i].Car = loadImage("car.png");
  }

  for (int i = 0; i < yellowCars.length; i++) {
    yellowCars[i] = new Car (100, int(random(0, height)), int(random(1, 10)), 30, 20);
    yellowCars[i].Car = loadImage("yellowCar.png");
  }

  //frog
  frog1 = new Frog(350, 700, 2);
  frog1.frog = loadImage("frog.png");


  ///fly
  fly1 = new Flies(int(random(0, width)), int(random(0, height)), 
    int(random(1, 5)), int(random(1, 5)));
  fly1.fly = loadImage("fly_2.jpg.png");
}

void draw () {
  background(0);

  for (int i = 0; i < redCars.length; i++) {
    redCars[i].display();
    redCars[i].move();
    redCars[i].changeSpeed();
  }

  for (int i = 0; i < yellowCars.length; i++) {
    yellowCars[i].display();
    yellowCars[i].moveOther();
    yellowCars[i].changeSpeed();
  }


  frog1.moveFrog();
  frog1.displayFrog();
  frog1.crossedTheStreet();
  frog1.hitRedCar();
  frog1.hitYellowCar();
  frog1.startOver();
  frog1.wonGame();


  fly1.displayFly();
  fly1.moveFly();
  fly1.flyCaught();
}
