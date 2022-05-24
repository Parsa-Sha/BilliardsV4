PVector mouseStart, mouseEnd, velocity;
boolean hasPressed;
float rotationPressed;
float testVelocity;
float tVelbegin, tVel;
float angle;

PVector beginPressed, endPressed;
PVector newVel;

PVector finalVelocity = new PVector(0, 0);

void playerShoot() { // We will get back to the shooting code, don't worry about this; Edit: We're back, time to deal with this mess
  
  pushMatrix();
  translate(pb.getX(), pb.getY());
  rotate(atan2(mouseY - pb.getY(), mouseX - pb.getX()) * int(!hasPressed));
  rotate(rotationPressed * int(hasPressed));
  translate(20 + finalVelocity.y, -6); // Incorporate length of mouse dragged
  if (abs(pb.getVelocityX()) < 1 && abs(pb.getVelocityY()) < 1) image(stick, 0, 0);
  popMatrix();
  
  println(pb.getX(), pb.getY());
}

void mousePressed() { // Rotate origin, mouseDragged ignoring Y changes, only X. Take X change, rotate back, and then apply velocity
  if (gameState == PLAYERSHOOT) {
    /*
    if (!hasPressed) {
      hasPressed = true; // Vx = V * cos(angle), Vy = V * sin(angle)
      rotationPressed = atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x);
      pushMatrix();
      translate(myBalls.get(0).pos.x, myBalls.get(0).pos.y);
      rotate(rotationPressed);
      tVelbegin = mouseX - myBalls.get(0).pos.x;
      popMatrix();
    }
    */
    
    
    finalVelocity.x = atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x);
    
    beginPressed = new PVector(mouseX, mouseY);
  }
}

// Main issue is, I need to get mouseX relative to ROTATED ball

void mouseReleased() {
  if (gameState == PLAYERSHOOT) {
    /*
    
    pushMatrix();
    translate(myBalls.get(0).pos.x, myBalls.get(0).pos.y);
    rotate(rotationPressed);
    tVel = abs(mouseX - myBalls.get(0).pos.x - tVelbegin);
    popMatrix();
    
    velocity = new PVector(tVel * cos(-rotationPressed), tVel * sin(-rotationPressed)); 
    //velocity = new PVector(velocity.x * cos(rotationPressed) - velocity.y * sin(rotationPressed), velocity.y * cos(rotationPressed) + velocity.x * sin(rotationPressed)); 
    // Vector rotation newX = x*cos(theta) - y*sin(theta), newY = y*cos(theta) + x*sin(theta)
    
    velocity.setMag(min(tVel, 40)); 
    velocity.x *= -1;
    myBalls.get(0).vel = velocity;

    hasPressed = false;
    gameState = CALCULATE;
    
    */
    
    
    
    // New NEW testing May 10
    endPressed = new PVector(mouseX, mouseY);
    newVel = beginPressed.sub(endPressed);
    newVel.setMag(100);
    pb.setVelocity(newVel.x, newVel.y);
  }
}
