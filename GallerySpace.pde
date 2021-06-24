class GallerySpace {
  
  PVector myPos;// = new PVector(0,0);
  PVector myCentroid;// = new PVector(0,0);
  int [] myMinoLayout;// = null;   
  float mySize;
  float tileSize;
  String t;// = "";
  boolean selected;// = false;
  
  
  GallerySpace(int x, int y, float gssize, String s) {
    myPos = new PVector(0,0);
    myCentroid = new PVector(0,0);
    myMinoLayout = null;   
    t = "";
    selected = false;
    myPos.x = x;
    myPos.y = y;
    mySize = gssize;
    tileSize = mySize/(minoSize+1);
    t = s;
  }
  
  void display() {
    
    rectMode(CORNER);
    fill(0,0,50);
    if (selected) {
      fill(hue2,100,50);
      stroke(hue2,100,100);
      strokeWeight(2);
      rect(myPos.x,myPos.y,mySize-2,mySize-2);
    } else {
      stroke(0,0,15);
    }
    if (over() && !carrying) {
      strokeWeight(2);
      stroke(15,100,80);
//      textAlign(RIGHT, BOTTOM);
//      fill(hue1,100,100);
//      text(t,width,myPos.y+mySize+textAscent()+textDescent()); 
//      noFill();  
//      fill(0,0,50);
    }
    strokeWeight(2);
    rect(myPos.x,myPos.y,mySize-2,mySize-2);
  
    strokeWeight(1);
    stroke(0,0,15);
    if (myMinoLayout != null) drawMyMino();  
    
  }
  
  void drawMyMino() {
  
    fill(hue1,satHI,80);
//    int tileSize = mySize/(minoSize); 

//    findMyCentroid();
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(myPos.x+mySize/2-myCentroid.x,myPos.y+mySize/2-myCentroid.y);
    
    for (int j=0; j<minoSize; j++) {   
      String row = binary(myMinoLayout[j]); 
      for (int i=0; i<row.length(); i++) {
        if (row.charAt(i) == "1") {
          rect(tileSize*(i+minoSize-row.length()),tileSize*j,tileSize,tileSize);  
        }
      }
    }
    
    popMatrix();
    
  }
  
  void findMyCentroid() {
    
    float x = 0;
    float y = 0;
    
    for (int j=0; j<minoSize; j++) {   
      String row = binary(myMinoLayout[j]); 
      for (int i=0; i<row.length(); i++) {
        if (row.charAt(i) == "1") {
          x += i+minoSize-row.length();
          y += j;  
        }
      }
    }    
    
    myCentroid.x = tileSize * x/float(minoSize);
    myCentroid.y = tileSize * y/float(minoSize);
    
    //println("\n"+myCentroid.x+" "+myCentroid.y);
    
  }
  
  boolean over() {
   
    if(mouseX>myPos.x && mouseX<(myPos.x+mySize) && mouseY>myPos.y && mouseY<(myPos.y+mySize)) {
      return true;
    } else {  
    return false;   
    }
    
  }
  
}