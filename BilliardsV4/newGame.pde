void newGame() {
  newGame = false;

  for (int i = 0; i < ballArrangement.length; i++) ballArrangement[i] = 16;
  ballArrangement[0] = 1; // Set one ball and eight ball ids
  ballArrangement[4] = 8;
  boolean isNew = false;
  int idCandidate = 16;
  int selectionCleared = 0;
  for (int i = 0; i < ballArrangement.length; i++) {
    if (i != 0 && i != 4) {
      while (!isNew) {
        idCandidate = floor(random(2, 16));
        for (int j = 0; j < ballArrangement.length; j++) {
          if (ballArrangement[j] != idCandidate) selectionCleared++; // Checking if random placement is not equal to an already placed ball
        }
        if (selectionCleared == ballArrangement.length) {
          isNew = true;
        } else {
          selectionCleared = 0;
        }
      }
      ballArrangement[i] = idCandidate;
      isNew = false;
      selectionCleared = 0; // Place id into index, then reset
    }
  }
  
  myBalls = new ArrayList<Ball>();
  world = new FWorld();
  world.setGravity(0, 0);
  pb = new PlayerBall();
  pb.setPosition(263, 305);
  pb.attachImage(ballImages[0]);
  pb.setFillColor(0);
  pb.setFriction(0.5);
  pb.setRestitution(0.9);
  pb.setStatic(false);
  pb.setGrabbable(false);
  myBalls.add(pb);
  world.add(pb);
  
  // Create all six bumpers
  FBox topLeft = new FBox(370, 10);
  FBox topRight = new FBox(370, 10);
  FBox bottomLeft = new FBox(370, 10);
  FBox bottomRight = new FBox(370, 10);
  FBox left = new FBox(10, 325);
  FBox right = new FBox(10, 325);
  
  // Set position of bumpers
  topLeft.setPosition(270, 100);
  topRight.setPosition(690, 100);
  bottomLeft.setPosition(270, 500);
  bottomRight.setPosition(690, 500);
  left.setPosition(45, 298);
  right.setPosition(915, 298);
  
  // Make sure they don't move
  topLeft.setStatic(true);
  topRight.setStatic(true);
  bottomLeft.setStatic(true);
  bottomRight.setStatic(true);
  left.setStatic(true);
  right.setStatic(true);
  
  // Make sure they can't be grabbed
  topLeft.setGrabbable(false);
  topRight.setGrabbable(false);
  bottomLeft.setGrabbable(false);
  bottomRight.setGrabbable(false);
  left.setGrabbable(false);
  right.setGrabbable(false);
  
  // Set noStroke and noFill
  topLeft.setNoFill();
  topRight.setNoFill();
  bottomLeft.setNoFill();
  bottomRight.setNoFill();
  left.setNoFill();
  right.setNoFill();

  topLeft.setNoStroke();
  topRight.setNoStroke();
  bottomLeft.setNoStroke();
  bottomRight.setNoStroke();
  left.setNoStroke();
  right.setNoStroke();
  
  world.add(topLeft);
  world.add(topRight);
  world.add(bottomLeft);
  world.add(bottomRight);
  world.add(left);
  world.add(right);

  /*
  rect(85, 95, 370, 10); // Testing
  rect(505, 95, 370, 10);
  rect(85, 495, 370, 10);
  rect(505, 495, 370, 10);
  rect(40, 135, 10, 325);
  rect(910, 135, 10, 325);
  ellipse(60, 115, 26, 26);
  */

  int bpi = 1; // Ball placed index, used to refrence which ball should be placed where
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5-i; j++) { // Convert to ball array for Fisica
      Ball b = new Ball();
      myBalls.add(b);
      world.add(b);
      b.attachImage(ballImages[ballArrangement[15-bpi]]);
      b.setPosition(800 - i*22.52, 250 + j*26 + i*13);
      b.setFriction(0.5);
      b.setRestitution(0.9);
      b.setStatic(false);
      b.setGrabbable(false);
      bpi++;
    }
  }
}
