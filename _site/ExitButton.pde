class ExitButton {
  
  int myWidth;// = 15;
  int myHeight;// = 15;
  PVector myPos;// = new PVector(5,5);
  String t;// = "";
  
  ExitButton () {
    //println("exit button created");   
    myWidth = 15;
    myHeight = 15;
    myPos = new PVector(5,5);
    t = "";  
  }
  
  void display() {
       
    strokeWeight(2);
    noStroke();
    if (over()) {
      stroke(hue2,satHI,valHI);
    }
    
    fill(hue2,100,40);
    rectMode(CORNER);
    rect(myPos.x,myPos.y,myWidth,myHeight);
    
    if (over()) {
      if(!ratingShapes) {
        stroke(0,0,0);
        line(myPos.x+myWidth/2,myPos.y,myPos.x+myWidth,myPos.y+myHeight/2);
        line(myPos.x+myWidth,myPos.y+myHeight/2,myPos.x+myWidth/2,myPos.y+myHeight);
        line(myPos.x,myPos.y+myHeight/2,myPos.x+myWidth/2,myPos.y+myHeight/2);
        line(myPos.x+myWidth/2,myPos.y,myPos.x+myWidth/2,myPos.y+myHeight);
      }
      else if (ratingShapes) {
        stroke(0,0,0);
        line(myPos.x,myPos.y,myPos.x+myWidth,myPos.y+myHeight);
        line(myPos.x+myWidth,myPos.y,myPos.x,myPos.y+myHeight);
      }
      fill(hue1,100,100);
      if(notGotDemosYet) {
        textAlign(LEFT, BOTTOM);
        text(t,myPos.x+myWidth,myPos.y+textAscent()+textDescent());
      } else {
        textAlign(RIGHT, BOTTOM);
        text(t,myPos.x,myPos.y+textAscent()+textDescent());
      }
    } 
    
  }
  
  boolean over() {
    
    if (mouseX>myPos.x && mouseX<(myPos.x+myWidth) && mouseY>myPos.y && mouseY<(myPos.y+myHeight)) {
      return true;
    } else {
      return false;
    }
    
  }
  
}