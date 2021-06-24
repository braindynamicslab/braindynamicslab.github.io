class TextField {

  PVector pos;// = new PVector(0,0);
  PVector dim;// = new PVector(100,20);
  String label;// = "";
  String field;// = "";
  PFont font;

  boolean focus;// = false;

  TextField(int x, int y, String l) {
    pos = new PVector(0,0);
    dim = new PVector(100,20);
    field = "";
    focus = false;
  
    font = loadFont("ArialUnicodeMS-22.vlw");
    textFont(font,22);
    dim.y = textAscent() + textDescent() + 6;
    dim.x = textWidth("female")+5;

    pos.x = x;
    pos.y = y;
    label = l;

  }

  void display() {

    fill(50,0,50);
    rectMode(CORNER);
    strokeWeight(1);
    stroke(50,0,150);
    if(focus) stroke(25,100,100);
    if(over()) stroke(15,100,100);
    rect(pos.x,pos.y,dim.x,dim.y);
    
    textAlign(LEFT, BOTTOM);
    fill(hue1,100,100);
    text(label,pos.x,pos.y-textDescent());
    textAlign(RIGHT, BOTTOM);
    fill(0,0,100);
    text(field,pos.x+dim.x,pos.y+dim.y);  

  }

  void processKeyPress() {
    
	if (key == BACKSPACE || key == DELETE) {
      if(field.length()> 0){
        field = field.substring(0,field.length()-1);
      }
    }
	
    else if(key != RETURN && key != ENTER) {
      if (textWidth(""+field+key)<dim.x) {
        field += String.fromCharCode(key);
      }
    }
    

    
  }
  
  boolean over() {

    if(mouseX>pos.x && mouseX<pos.x+dim.x && mouseY>pos.y && mouseY<pos.y+dim.y) {

      return true;

    } 
    else {

      return false;

    }

  }

}
