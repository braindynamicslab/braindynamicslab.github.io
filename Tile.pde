class Tile {

  int mySize;// = min(width/*-rightPanel*/,height)/(minoSize+1);
  float ID;// = 0;
  PVector myMinoPos;// = new PVector(0,0); 
  color myColor;// = color(hue1,satHI,valHI);
  boolean positionSpread;// = false;
  boolean carried;// = false;
  boolean isSeperable;// = true;
  boolean visited;// = false;
  boolean notSpreadYet;// = true;

  int animationCounter;// = 0;
  int activationCounter;// = 0;

  Tile above;// = null;
  Tile below;// = null;
  Tile left;// = null;
  Tile right;// = null;

  Tile() {
    mySize = min(width/*-rightPanel*/,height)/(minoSize+1);
    myMinoPos = new PVector(0,0); 
    myColor = color(hue1,satHI,valHI);
    positionSpread = false;
    carried = false;
    isSeperable = true;
    visited = false;
    notSpreadYet = true;

    animationCounter = 0;
    activationCounter = 0;

    above = null;
    below = null;
    left = null;
    right = null;
    ID = random(1000);
    //    println("ID "+ID);

  }

  void display() {

    fill(myColor);
    if((isSeperable && over() && !carrying) || carried) {
      animateSeparability();
      //      fill(255,0,0);
    }
    strokeWeight(2);

    if((isSeperable && over() && !carrying) || carried){
      stroke(hue1,satHI,valLO);
    } 
    else {
      noStroke();
      //      stroke(0);
    }

    rectMode(CENTER);
    rect(myMinoPos.x,myMinoPos.y,mySize-5,mySize-5);

    if (activationCounter > 0 ) {
      spreadActivation();
      fill(hue1+10,satHI,valHI,75);
      //    rectMode(CENTER);
      rect(myMinoPos.x,myMinoPos.y,mySize-5,mySize-5);
    }

  }

  boolean over() {

    float x0 = myMinoPos.x - mySize/2 + (width/*-rightPanel*/)/2 - minoCentroid.x;
    float x1 = myMinoPos.x + mySize/2 + (width/*-rightPanel*/)/2 - minoCentroid.x;
    float y0 = myMinoPos.y - mySize/2 + height/2 - minoCentroid.y;
    float y1 = myMinoPos.y + mySize/2 + height/2 - minoCentroid.y;

    return mouseX > x0 && mouseX < x1 && mouseY > y0 && mouseY < y1;

  }

  void animateSeparability() {

    animationCounter = (animationCounter + 1)%60;
    if (animationCounter < 30) {
      fill(hue1,satHI,valHI-animationCounter);
      //      println(100+animationCounter); 
    } 
    else {
      fill(hue1,satHI,valHI-60+animationCounter);
      //      println(250-animationCounter); 
    }      

  }

  void spreadActivation() {

    notSpreadYet = false;
    activationCounter += 1;
    if (activationCounter > 4) {
      if(left != null && left.notSpreadYet) {
        left.spreadActivation();
      }
      if(right != null && right.notSpreadYet) {
        right.spreadActivation();
      }
      if(above != null && above.notSpreadYet) {
        above.spreadActivation();
      }
      if(below != null && below.notSpreadYet) {
        below.spreadActivation();
      }
      activationCounter = 0;
    }  

  }

}




