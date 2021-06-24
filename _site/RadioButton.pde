class RadioButton {
  
  int myWidth;// = 100  ;
  int myHeight;// = 50;
  PVector myPos;// = new PVector(5,5);
//  PVector dim = new PVector(100,20);
  boolean f;// = false;
  boolean m;// = false;
  String label;// = "";
//  PFont font;
  
  RadioButton (String l) {
    //println("radio button created");  
    myWidth = 100  ;
    myHeight = 50;
    myPos = new PVector(5,5);
    f = false;
    m = false;
    label = l;  
  }
  
  void display() {
       
    strokeWeight(2);
    noStroke();
    if (over()) {
//      stroke(15,255,255);
    }

    textAlign(LEFT, BOTTOM);
    fill(hue1,100,100);
    text(label,myPos.x,myPos.y-textDescent());
    
    fill(hue2,0,255);
    ellipseMode(CENTER);
    ellipse(myPos.x+myHeight/2,myPos.y+myHeight/2,myHeight/2,myHeight/2);
    ellipse(myPos.x+3*myHeight/2,myPos.y+myHeight/2,myHeight/2,myHeight/2);
    stroke(hue2,0,55);
    fill(hue1,0,0);
    ellipse(myPos.x+myHeight/2,myPos.y+myHeight/2,0.7*(myHeight/2),0.7*(myHeight/2));
    ellipse(myPos.x+3*myHeight/2,myPos.y+myHeight/2,0.7*myHeight/2,0.7*myHeight/2);
    noStroke();
    if (m) {
      fill(hue2,0,255);
      noStroke();
      ellipse(myPos.x+myHeight/2,myPos.y+myHeight/2,0.7*(myHeight/2),0.7*(myHeight/2));
      fill(hue1,0,0);
    }
    if (f) {
      fill(hue2,0,255);
      noStroke();
      ellipse(myPos.x+3*myHeight/2,myPos.y+myHeight/2,0.7*myHeight/2,0.7*myHeight/2);
      fill(hue1,0,0);
    }
    
    fill(hue2,0,255);
    if (over()) fill(15,255,255);
    textFont(smallFont,22);
    text("m",myPos.x-10,myPos.y+myHeight/1.3);
    text("f",myPos.x+myWidth/2,myPos.y+myHeight/1.3);
    
  }
  
  boolean over() {
    
    if (mouseX>myPos.x && mouseX<(myPos.x+myWidth) && mouseY>myPos.y && mouseY<(myPos.y+myHeight)) {
      return true;
    } else {
      return false;
    }
    
  }
  
  void setFlag() {
   
    if (over() && mouseX<=(myPos.x+myWidth/2)) {
      m = true;
      f = false;
    }
    if (over() && mouseX>(myPos.x+myWidth/2)) {
      m = false;
      f = true;
    }
    
    
  }
  
}