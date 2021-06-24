float hue1;// = 25;
float hue2;// = 0;
float satHI;// = 95;
float satLO;// = 30;
float valHI;// = 70;
float valMID;// = 50;
float valLO;// = 30;

int minoSize;// = 10;
Tile [] tiles;

int appHeight;// = 600;
int gallerySize;// = 1;
int rightPanel;// = appHeight/5;//gallerySize;
int appWidth;// = appHeight;// + rightPanel;

int [] currentMinoLayout;
int sessionID;// = (int) random(0,1000000);
int ratingCount;// = 0;
String sessionString;// = sessionID+"-"+year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2);
float maxSessionTime;// = 25*60*1000;
ExitButton e;// = new ExitButton();
ExitButton d;// = new ExitButton();
ExitButton s;// = new ExitButton();
PFont font;
PFont smallFont;
boolean notStartedYet;// = false;
boolean notGotDemosYet;// = true;
boolean ratingShapes;// = false;
boolean needRatingShapesMessage;// = true;
boolean gallerySelection = false;
TextField tf1;
//TextField tf2;
RadioButton r1;

ArrayList uMinos;// = new ArrayList();
ArrayList selectedMinos;// = new ArrayList();
ArrayList trajectory;// = new ArrayList();
//IO post;// = new IO();

PVector minoCentroid;// = new PVector(0,0);

boolean carrying;// = false;

Tile carried;// = null;

int visitedCount;

color bg; 

GallerySpace [] gallery;// = new GallerySpace[gallerySize];
GallerySpace [] ratingGallery;

void setup() {

//  println("moo");
  hue1 = 25;
  hue2 = 0;
  satHI = 95;
  satLO = 30;
  valHI = 90;
  valMID = 50;
  valLO = 30;
  minoSize = 10;
  tiles = new Tile[minoSize];
  appHeight = 600;
  gallerySize = 1;
  rightPanel = appHeight/5;//gallerySize;
  appWidth = appHeight;// + rightPanel;
  sessionID = (int) random(0,1000000);
  ratingCount = 0;
  sessionString = sessionID+"-"+year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2);
  maxSessionTime = 25*60*1000;
  e = new ExitButton();
  d = new ExitButton();
  s = new ExitButton();
  notStartedYet = false;
  notGotDemosYet = true;
  ratingShapes = false;
  needRatingShapesMessage = true;
  uMinos = new ArrayList();
  selectedMinos = new ArrayList();
  trajectory = new ArrayList();
  //post = new IO();
  minoCentroid = new PVector(0,0);
  carrying = false;
  carried = null;
  gallery = new GallerySpace[gallerySize];



  try {
    //InetAddress thisIp = InetAddress.getLocalHost();
    //String ipString = ""+thisIp.getHostAddress()+" "+thisIp.isLoopbackAddress();
    //println(ipString);
    //trajectory.add(ipString);
  }
  catch(Exception e) {
    e.printStackTrace();
  }

  colorMode(HSB, 100);

  bg = color(hue1,0,valLO);

  size(appWidth,appHeight);
  smooth();

  font = loadFont("ArialUnicodeMS-48.vlw");
  smallFont = loadFont("ArialUnicodeMS-22.vlw");

  for (int i=0; i<minoSize; i++) {
    tiles[i] = new Tile();
  }

  for (int i=0; i<minoSize-1; i++) {
    Tile thisTile = tiles[i];
    Tile nextTile = tiles[i+1];

    thisTile.right = nextTile;
    nextTile.left = thisTile;
  }

  //  tiles[0].myMinoPos.x = 0;
  //  tiles[0].myMinoPos.y = 0;

  spreadPosition(tiles[0]);

  for (int i=0; i<minoSize; i++) {
    Tile t = tiles[i];
    t.positionSpread = false;
    //    println("i "+i+" ID "+t.ID+" left "+t.left+" right "+t.right+" above "+t.above+" below "+t.below);
  }

  calculateCentroid();

  isRemovable();

  currentMinoLayout = tilesToLayout();

  for (int i=0; i<gallerySize; i++) {

    gallery[i] = new GallerySpace(width-rightPanel,i*rightPanel,rightPanel,"Submit a shape.");
  }

  tf1 = new TextField(50,150,"Your age is:");
  tf1.focus = true;
  //  tf2 = new TextField(50,250,"Your gender is:");
  r1 = new RadioButton("Your gender is:");
  r1.myPos.x = 50;
  r1.myPos.y = 250;
  d.myPos.x = 50;
  d.myPos.y = 350;
  d.myWidth = 50;
  d.myHeight = 50;
  s.myPos.x = width - 50;
  s.myPos.y = height - 50;
  s.myWidth = 30;
  s.myHeight = 30;

  e.myPos.x = width - 50;
  e.myPos.y = height - 50;
  e.myHeight = 30;
  e.myWidth = 30;

  d.t = "Continue?";
  e.t = "Continue to rating step?";
  s.t = "Exit and finish session?";

  //  noLoop();
}

void draw() {

  colorMode(HSB, 100);

  fill(bg);
  stroke(0);
  strokeWeight(2);
  rect(0,0,width,height);

  if (!notGotDemosYet && !ratingShapes) {
    displayGallery();

    updateTiles();
    pushMatrix();
    translate((width/*-rightPanel*/)/2 - minoCentroid.x, height/2 - minoCentroid.y);
    displayTiles();
    popMatrix();

    e.display();
  }

  if (ratingShapes) {
    displayRatingGallery();
    s.display();
  }

  /*
  if (key == 'd') {
   textFont(smallFont,22);
   textAlign(LEFT);
   String t = "hue "+hue1+" main saturation "+satHI+" main value "+valHI+" background value "+valLO;
   text(t,50,50);
   } 
   */

  //Splash screen intro
  if(notStartedYet) {
    background(0);
    fill(0,0,100);
    textFont(smallFont,22);
    text("Hello, and thanks for taking part in this experiment.\n\nYour goal is to create shapes and choose the five that you think are the most interesting and beautiful.\n\nThe shapes are composed of 10 cubes that have to touch each other's edges. At each step you can move one cube from the current shape to create a new shape. You can only move the cubes that will keep the shape connected.\n\nWhen you reach a shape that you like you can save it in one of the 'Gallery Spaces' on the right by clicking in that space. You can also replace a shape currently in the Gallery by clicking there again.\n\nThe canvas will be open for your exploration and choices for the next 20 minutes. You may end your session earlier by clicking the red square in the top left.\n\nThanks and enjoy! (Click to continue.)",25,25,width-50,height-50);
    text("",50,100);
    text("",50,175);
    text("",50,300);
    text("",50,425);
    text("",50,525);
  }

  //demographics
  if(notGotDemosYet && !notStartedYet && !ratingShapes) {

    background(0);    
    fill(0,0,100);
    textFont(smallFont,22);
    textAlign(LEFT);
    text("Please enter a little information about yourself into the\nboxes below. Click the red square when complete.",50,50);
    tf1.display();
    //    tf2.display();
    r1.display();
    d.display();
  }
}

void updateTiles() {

  if (carrying) {
    carried.myMinoPos.x = mouseX - (width/*-rightPanel*/)/2 + minoCentroid.x;
    carried.myMinoPos.y = mouseY - height/2 + minoCentroid.y;
  }

  calculateCentroid(); 

  if (millis()>maxSessionTime) {
    endSession();
  }
}

void endSession() {

  sendData();
  //draw end screen
  noLoop();
  background(0);
  fill(0);
  rectMode(CORNER);
  rect(0,0,width,height);
  fill(0,0,100);
  textFont(smallFont,22);
  textAlign(LEFT);
  String message = "Thank you for playing!\n\n\nYour session number is\n"+sessionString+"\n\nTo play again refresh page";
  text(message,50,height/2);
  exit();
}

void displayTiles() {

  for (int i=0; i<minoSize; i++) {
    tiles[i].display();
  }

  if (carrying) {
    carried.display();
  }
}

void displayGallery() {

  for (int i=0; i<gallerySize; i++) {
    gallery[i].display();
  }
}

void displayRatingGallery() {

  int rgs = ratingGallery.length;

  for (int i=0; i<rgs; i++) {
    ratingGallery[i].display();
  }
}

void calculateCentroid() {

  float x = 0;
  float y = 0;

  for (int i=0; i<minoSize; i++) {

    x += tiles[i].myMinoPos.x;
    y += tiles[i].myMinoPos.y;
  }

  x /= float(minoSize);
  y /= float(minoSize);

  minoCentroid.x = x;
  minoCentroid.y = y;
}

void updatePositions() {
  if(tiles[0].carried) {
    tiles[1].myMinoPos.x = 0;
    tiles[1].myMinoPos.y = 0;
    spreadPosition(tiles[1]);
  } 
  else {
    tiles[0].myMinoPos.x = 0;
    tiles[0].myMinoPos.y = 0;
    spreadPosition(tiles[0]);
  }  
  for (int i=0; i<minoSize; i++) {

    tiles[i].positionSpread = false;
  }
}

void spreadPosition(Tile t) {

  t.positionSpread = true;

  if (t.left != null && !t.left.positionSpread) {
    t.left.myMinoPos.x = t.myMinoPos.x - t.mySize;
    t.left.myMinoPos.y = t.myMinoPos.y;
    spreadPosition(t.left);
  }
  if (t.right != null && !t.right.positionSpread) {
    t.right.myMinoPos.x = t.myMinoPos.x + t.mySize;
    t.right.myMinoPos.y = t.myMinoPos.y;
    spreadPosition(t.right);
  }
  if (t.above != null && !t.above.positionSpread) {
    t.above.myMinoPos.x = t.myMinoPos.x;
    t.above.myMinoPos.y = t.myMinoPos.y - t.mySize;
    spreadPosition(t.above);
  }
  if (t.below != null && !t.below.positionSpread) {
    t.below.myMinoPos.x = t.myMinoPos.x;
    t.below.myMinoPos.y = t.myMinoPos.y + t.mySize;
    spreadPosition(t.below);
  }
}

void isRemovable() {

  for (int i=0; i<minoSize; i++) {
    visitedCount = 0;
    Tile t = tiles[i];
    t.visited = true;
    //    traceShape(tiles[i]);
    if (t.left != null && !t.left.visited) {
      visitedCount += 1;
      traceShape(t.left);
    } 
    else
      if (t.right != null && !t.right.visited) {
        visitedCount += 1;
        traceShape(t.right);
      } 
      else
        if (t.above != null && !t.above.visited) {
          visitedCount += 1;
          traceShape(t.above);
        } 
        else
          if (t.below != null && !t.below.visited) {
            visitedCount += 1;
            traceShape(t.below);
          }
    if (visitedCount == minoSize - 1) {//no orphaned branches
      tiles[i].isSeperable = true;
    } 
    else {
      tiles[i].isSeperable = false;
    }
    for (int j=0; j<minoSize; j++) {
      tiles[j].visited = false;
    }
    //    println(visitedCount);
  }
}

void traceShape(Tile t) {

  t.visited = true;
  if (t.left != null && !t.left.visited) {
    visitedCount += 1;
    traceShape(t.left);
  }
  if (t.right != null && !t.right.visited) {
    visitedCount += 1;
    traceShape(t.right);
  }
  if (t.above != null && !t.above.visited) {
    visitedCount += 1;
    traceShape(t.above);
  }
  if (t.below != null && !t.below.visited) {
    visitedCount += 1;
    traceShape(t.below);
  }
}

void edgeFinder() {

  float x = mouseX - (width/*-rightPanel*/)/2 + minoCentroid.x;
  float y = mouseY - height/2 + minoCentroid.y;
  PVector mousePos = new PVector(x,y);

  for (int i = 0; i<minoSize; i++ ) {

    Tile t = tiles[i];
    PVector l = new PVector(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y);
    PVector r = new PVector(t.myMinoPos.x+t.mySize/2,t.myMinoPos.y);
    PVector a = new PVector(t.myMinoPos.x,t.myMinoPos.y-t.mySize/2);
    PVector b = new PVector(t.myMinoPos.x,t.myMinoPos.y+t.mySize/2);

    pushMatrix();
    translate((width/*-rightPanel*/)/2 - minoCentroid.x, height/2 - minoCentroid.y);
    stroke(255);
    strokeWeight(10);

    if (t.left == null && mousePos.dist(l) < t.mySize/1.5 && mousePos.dist(t.myMinoPos) > 0.45*t.mySize) {
      line(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y-t.mySize/2,t.myMinoPos.x-t.mySize/2,t.myMinoPos.y+t.mySize/2);
    }  
    if (t.right == null && mousePos.dist(r) < t.mySize/1.5 && mousePos.dist(t.myMinoPos) > 0.45*t.mySize) {
      line(t.myMinoPos.x+t.mySize/2,t.myMinoPos.y-t.mySize/2,t.myMinoPos.x+t.mySize/2,t.myMinoPos.y+t.mySize/2);
    }  
    if (t.above == null && mousePos.dist(a) < t.mySize/1.5 && mousePos.dist(t.myMinoPos) > 0.45*t.mySize) {
      line(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y-t.mySize/2,t.myMinoPos.x+t.mySize/2,t.myMinoPos.y-t.mySize/2);
    }  
    if (t.below == null && mousePos.dist(b) < t.mySize/1.5 && mousePos.dist(t.myMinoPos) > 0.45*t.mySize) {
      line(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y+t.mySize/2,t.myMinoPos.x+t.mySize/2,t.myMinoPos.y+t.mySize/2);
    }  

    popMatrix();
  }
}

void tileJoiner() {

  float x = mouseX - (width/*-rightPanel*/)/2 + minoCentroid.x;
  float y = mouseY - height/2 + minoCentroid.y;
  PVector mousePos = new PVector(x,y);
  boolean joined = false;

  //  Tile closestTile = tiles[0];
  //  float minDistance = mousePos.dist(closestTile.myMinoPos);

  Tile closestTile = null;
  float minDistance = 999999;

  for (int i = 0; i<minoSize; i++) {

    Tile t = tiles[i];
    float distance = mousePos.dist(t.myMinoPos);
    if (t != carried && (t.above == null || t.below == null || t.left == null || t.right == null)) {

      if (distance < minDistance) {

        minDistance = distance;
        closestTile = t;
      }
    }
  }

  PVector cl = new PVector(closestTile.myMinoPos.x-closestTile.mySize/2,closestTile.myMinoPos.y);
  PVector cr = new PVector(closestTile.myMinoPos.x+closestTile.mySize/2,closestTile.myMinoPos.y);
  PVector ca = new PVector(closestTile.myMinoPos.x,closestTile.myMinoPos.y-closestTile.mySize/2);
  PVector cb = new PVector(closestTile.myMinoPos.x,closestTile.myMinoPos.y+closestTile.mySize/2);

  String closestEdge = "none";
  float closestEdgeDistance = 99999999;
  if (mousePos.dist(cl) < closestEdgeDistance && closestTile.left == null) {
    closestEdge = "left";
    closestEdgeDistance = mousePos.dist(cl);
  }
  if (mousePos.dist(cr) < closestEdgeDistance && closestTile.right == null) {
    closestEdge = "right";
    closestEdgeDistance = mousePos.dist(cr);
  }
  if (mousePos.dist(ca) < closestEdgeDistance && closestTile.above == null) {
    closestEdge = "above";
    closestEdgeDistance = mousePos.dist(ca);
  }
  if (mousePos.dist(cb) < closestEdgeDistance && closestTile.below == null) {
    closestEdge = "below";
    closestEdgeDistance = mousePos.dist(cb);
  }

  if (closestEdge == "none") {
    println("ACK!!!");
  }
  if (closestEdge == "left") {
    closestTile.left = carried;
    carried.right = closestTile;
    joined = true;
    //      println("1joined at right "+closestTile.ID);
  }    
  if (closestEdge == "right") {
    closestTile.right = carried;
    carried.left = closestTile;
    joined = true;
    //      println("1joined at left "+closestTile.ID);
  }    
  if (closestEdge == "above") {
    closestTile.above = carried;
    carried.below = closestTile;
    joined = true;
    //      println("1joined at bottom "+closestTile.ID);
  }    
  if (closestEdge == "below") {
    closestTile.below = carried;
    carried.above = closestTile;
    joined = true;
    //      println("1joined at top "+closestTile.ID);
  }    
  updatePositions();

  for (int i = 0; i<minoSize; i++ ) {

    Tile t = tiles[i];
    PVector l = new PVector(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y);
    PVector r = new PVector(t.myMinoPos.x+t.mySize/2,t.myMinoPos.y);
    PVector a = new PVector(t.myMinoPos.x,t.myMinoPos.y-t.mySize/2);
    PVector b = new PVector(t.myMinoPos.x,t.myMinoPos.y+t.mySize/2);

    pushMatrix();
    translate((width/*-rightPanel*/)/2 - minoCentroid.x, height/2 - minoCentroid.y);
    stroke(255);
    strokeWeight(10);

    //    joined = false;
    //    println("attempting to join");

    if (t.left == null && carried.myMinoPos.dist(l) < t.mySize/1.5 && carried.myMinoPos.dist(t.myMinoPos) > 0.45*t.mySize) {
      t.left = carried;
      carried.right = t;
      joined = true;
      //      println("joined at right "+t.ID);
      //      line(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y-t.mySize/2,t.myMinoPos.x-t.mySize/2,t.myMinoPos.y+t.mySize/2);
    }  
    if (t.right == null && carried.myMinoPos.dist(r) < t.mySize/1.5 && carried.myMinoPos.dist(t.myMinoPos) > 0.45*t.mySize) {
      t.right = carried;
      carried.left = t;
      joined = true;
      //      println("joined at left "+t.ID);
      //      line(t.myMinoPos.x+t.mySize/2,t.myMinoPos.y-t.mySize/2,t.myMinoPos.x+t.mySize/2,t.myMinoPos.y+t.mySize/2);
    }  
    if (t.above == null && carried.myMinoPos.dist(a) < t.mySize/1.5 && carried.myMinoPos.dist(t.myMinoPos) > 0.45*t.mySize) {
      t.above = carried;
      carried.below = t;
      joined = true;
      //      println("joined at bottom "+t.ID);
      //      line(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y-t.mySize/2,t.myMinoPos.x+t.mySize/2,t.myMinoPos.y-t.mySize/2);
    }  
    if (t.below == null && carried.myMinoPos.dist(b) < t.mySize/1.5 && carried.myMinoPos.dist(t.myMinoPos) > 0.45*t.mySize) {
      t.below = carried;
      carried.above = t;
      joined = true;
      //      println("joined at top "+t.ID);
      //      line(t.myMinoPos.x-t.mySize/2,t.myMinoPos.y+t.mySize/2,t.myMinoPos.x+t.mySize/2,t.myMinoPos.y+t.mySize/2);
    }  


    popMatrix();
  }

  if(joined) {
    //    println(" ");
    Tile temp = carried;
    carried.carried = false;
    carried = null;
    carrying = false;
    updatePositions();
    temp.spreadActivation();
    temp = null;
    //    displayTiles();
    isRemovable();
  }
}

void checkForUniqueMino() {

  boolean unique = false;

  currentMinoLayout = tilesToLayout();

  for (int i=0; i<uMinos.size(); i++ ) {

    int[] previousMino = (int[]) uMinos.get(i);
    //print("\npreviousMino\t");
    for (int x=0; x<minoSize; x++) {
      //print(previousMino[x] + " ");
    }

    unique = true;

    for (int j=0; j<minoSize; j++) {
      unique = unique && (currentMinoLayout[j] == previousMino[j]);
    }

    if (unique) { //found a match
      //println(" ");
      break;
    }
  }   

  if (!unique) {

    uMinos.add(currentMinoLayout);
    //println("\nunique shape\n");
    //println(uMinos.size());
    //animate nice reward
    //    bg = color(random(50,150),random(50,250),random(0,100));
  }
}

int[] tilesToLayout() {

  //Find the topmost of the leftmost tiles. And find the bounding corners.
  PVector topLeftTilePos = new PVector(99999,99999);
  PVector topLeftBound = new PVector(99999,99999);
  PVector bottomRightBound = new PVector(-99999,-99999);
  for (int i=0; i<minoSize; i++) {
    PVector tilePos = new PVector(tiles[i].myMinoPos.x,tiles[i].myMinoPos.y);

    if(tilePos.x < topLeftTilePos.x) {
      topLeftTilePos = tilePos;
    } 
    else if(tilePos.x == topLeftTilePos.x && tilePos.y < topLeftTilePos.y) {
      topLeftTilePos = tilePos;
    }

    if(tilePos.x < topLeftBound.x) {
      topLeftBound.x = tilePos.x;
    }
    if(tilePos.y < topLeftBound.y) {
      topLeftBound.y = tilePos.y;
    }
    if(tilePos.x > bottomRightBound.x) {
      bottomRightBound.x = tilePos.x;
    }
    if(tilePos.y > bottomRightBound.y) {
      bottomRightBound.y = tilePos.y;
    }
  }

  float tileSize = (float) tiles[0].mySize;

  int[] layout = new int[minoSize];

  for (int i = 0; i<minoSize; i++) {
    layout[i] = 0;
  }

  for (int i=0; i<minoSize; i++) {
    PVector tilePos = new PVector((tiles[i].myMinoPos.x - topLeftBound.x)/tileSize,(tiles[i].myMinoPos.y - topLeftBound.y)/tileSize);

	tilePos.x = (float) round(tilePos.x);
	tilePos.y = (float) round(tilePos.y);
	//println("x: " + tilePos.x + " y: " + tilePos.y);
    layout[int(tilePos.y)] += pow(2,(minoSize-1)-int(tilePos.x));
  }

  // print layout
  //println("\n\ncurrent layout ");
  //for (int i=0; i<minoSize; i++) {
    //print(layout[i] + " ");
  //}

  return layout;
}

void populateRatingGallery() {

//  println("populating rating gallery");

  int gs = min(selectedMinos.size(), 48);
//  println("gs "+gs);
  ratingGallery = new GallerySpace[gs];
  int gsdim = width / 7;

  for (int i=0; i<gs; i++) {

//    println("i: "+i+" x "+(i%7)*gsdim+" y "+(i/7)*gsdim);

    //    gallery[i] = new GallerySpace(width-rightPanel,i*rightPanel,rightPanel,"Submit a shape.");    


    ratingGallery[i] = new GallerySpace((i%7)*gsdim,(int) (i/7.0)*gsdim,gsdim,"");
    ratingGallery[i].myMinoLayout = (int []) selectedMinos.get(gs-(i+1)); 
    ratingGallery[i].findMyCentroid();
  }
}

void recordTrajectory() {

  int [] layoutToAdd = tilesToLayout();
  String timestamp = ""+year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2)+"-"+millis(); 

  String layoutStr = "";
  for (int i=0; i<minoSize;i++) {
    layoutStr = layoutStr + layoutToAdd[i] + " ";
  }
  layoutStr = layoutStr + timestamp;

  trajectory.add(layoutStr);
}

void recordFinalGalleryTrajectory() {

  for (int g=0; g<gallerySize; g++) {
    int [] layoutToAdd = gallery[g].myMinoLayout;
    String timestamp = ""+year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2)+"-"+millis(); 

    String layoutStr = "";
    if(gallery[g].myMinoLayout != null) {
      for (int i=0; i<minoSize;i++) {
        layoutStr = layoutStr + layoutToAdd[i] + " ";
      }
      layoutStr = "Final Gallery slot "+ g + " " + layoutStr + timestamp;
    } 
    else {
      layoutStr = "empty";
    }

    trajectory.add(layoutStr);
  }

  for (int i=0; i<ratingGallery.length; i++) {
    GallerySpace rg = ratingGallery[i];
    if (rg.selected) {
      int [] layoutToAdd = rg.myMinoLayout;
      String timestamp = ""+year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2)+"-"+millis(); 

      String layoutStr = "";
      if(rg.myMinoLayout != null) {
        for (int r=0; r<minoSize; r++) {
          layoutStr = layoutStr + layoutToAdd[r] + " ";
        }
        layoutStr = "Rated "+ i + " " + layoutStr + timestamp;
      } 
      else {
        layoutStr = "empty";
      }

      trajectory.add(layoutStr);
    }
  }
}

void processMouseRelease() {

  if (carrying) {
    //put the tile down again
    tileJoiner();
    updatePositions();
    checkForUniqueMino();
    recordTrajectory();
  }     

}

void processMousePress() {

//  if (s.over() && !notStartedYet && !notGotDemosYet && ratingShapes) {
//    recordFinalGalleryTrajectory();
//    endSession();
//  }

  if (needRatingShapesMessage && ratingShapes) {
    needRatingShapesMessage = false;
    mousePressed = false;
  }
  
  if (e.over() && !notStartedYet && !notGotDemosYet && !ratingShapes) {
    populateRatingGallery();
    ratingShapes = true;
    mousePressed = false;
    noLoop();
  }
  
  if (needRatingShapesMessage && ratingShapes) {
    //display message
    mousePressed = false;
    background(0);
    textFont(smallFont,22);
    textAlign(CENTER);
    text("Thank you for creating!\nPlease choose the 5 most creative shapes you discovered.\nClick a box to select or deselect.\nClick to continue!",width/2,height/4);
  } 
  
//  if (ratingShapes && !needRatingShapesMessage && !gallerySelection) {
//    mousePressed = false;
//    loop();
//    gallerySelection = true;
//  }

  //  if (notStartedYet) {
  //    notStartedYet = false;
  //    loop();
  //  }

  if (d.over() && notGotDemosYet) {
    if (tf1.field.length()>0) {
      notGotDemosYet = false;
      trajectory.add("Age\t"+tf1.field);
      //      trajectory.add("Gender\t"+tf2.field);
      if (r1.m) trajectory.add("Gender\t"+"male");
      if (r1.f) trajectory.add("Gender\t"+"female");
      if (!r1.m && !r1.f) notGotDemosYet = true;
    }
  }    

  if (r1.over() && notGotDemosYet) {
    r1.setFlag();
  }

  if (tf1.over() && !tf1.focus && notGotDemosYet) {
    tf1.focus = !tf1.focus;
    //    tf2.focus = false;
  }

  //  if (tf2.over() && !tf2.focus && notGotDemosYet) {
  //    tf2.focus = !tf2.focus;
  //    tf1.focus = false;
  //  }

  if (ratingShapes && !needRatingShapesMessage && gallerySelection) {
    for (int i=0; i<ratingGallery.length; i++) {

      if (ratingGallery[i].over()) {
        if (ratingCount < 5 && !ratingGallery[i].selected) {
          ratingCount++;
          ratingGallery[i].selected = true;
//          ratingGallery[i].t = "";
        } else
        if (ratingGallery[i].selected) {
          ratingCount--;
          ratingGallery[i].selected = false;
//          ratingGallery[i].t = "";
        } else
        if (ratingCount > 4 && !ratingGallery[i].selected) {
//          textAlign(CENTER);
//          text("Maximum of 5 selections.\nDeselect another shape in order to select this one.",width/2,height/2);
//          systemMessage = "Maximum of 5 selections.\nDeselect another shape in order to select this one.",5000,width/2,height/2);
//          ratingGallery[i].t = "Maximum of 5 selections.\nDeselect another shape in order to select this one.";
        }       
      }
    }
  }
  
  if (s.over() && !notStartedYet && !notGotDemosYet && ratingShapes && gallerySelection) {
    recordFinalGalleryTrajectory();
    endSession();
  }
  
  if (ratingShapes && !needRatingShapesMessage && !gallerySelection) {
    loop();
    mousePressed = false;
    gallerySelection = true;
  }

  if (!notGotDemosYet && !ratingShapes) {

    for (int i=0; i<gallerySize; i++) {

      if (gallery[i].over()) {
        selectedMinos.add(currentMinoLayout);
        gallery[i].myMinoLayout = tilesToLayout();
        gallery[i].findMyCentroid();
        String timestamp = ""+year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2)+"-"+millis(); 
        String galleryAdd = "User added shape to gallery slot.\t" + timestamp;
        trajectory.add(galleryAdd);
      }
    }

    for (int i=0; i<minoSize; i++) {
      Tile t = tiles[i];

      t.notSpreadYet = true;

      if (t.over() && t.isSeperable) {

        t.carried = true;
        carried = t;
        carrying = true;
        if (t.left != null) {
          t.left.right = null;
          t.left = null;
        }  
        if (t.right != null) {
          t.right.left = null;
          t.right = null;
        }  
        if (t.above != null) {
          t.above.below = null;
          t.above = null;
        }  
        if (t.below != null) {
          t.below.above = null;
          t.below = null;
        }
      }
    }

    updatePositions();
  }
}

void mousePressed() {

  processMousePress();
  mousePressed = false;
}

void mouseReleased() {

  processMouseRelease();
}

void sendData() {

  String [] out = new String[trajectory.size()];

  for (int i=0; i<trajectory.size(); i++) {
    String ashape = (String) trajectory.get(i);
    out[i] = ashape;
  }

//  post.saveToWeb_saveFileString("leaps", "txt", "minos", out, false);
  saveDataOnWebServer("leaps", "txt","minos", join(out,"\n"), sessionString);
}

void keyPressed() {

  //  if (tf2.focus) {
  //
  //    tf2.processKeyPress();
  //    if(key == ENTER || key == RETURN || key == TAB){
  //      tf2.focus = false;
  //    }
  //
  //  } 

  if (tf1.focus) {

    tf1.processKeyPress();
    if(key == ENTER || key == RETURN || key == TAB) {
      tf1.focus = false;
      //      tf2.focus = true;
    }
  } 

  /*
  if (key == 'h') {
   
   hue1 = (hue1+1)%100;
   
   }
   
   if (key == 's') {
   
   satHI = (satHI+1)%100;
   
   }
   
   if (key == 'v') {
   
   valHI = (valHI+1)%100;
   
   }
   
   if (key == 'c') {
   
   valLO = (valLO+1)%100;
   
   }
   
   for(int i=0;i<minoSize; i++) {
   tiles[i].myColor = color(hue1,satHI,valHI);
   }
   bg = color(hue1,0,valLO);
   
   if (key == 'p') {
   println("hue1 "+hue1+" satHI "+satHI+" valHI "+valHI+" valLO "+valLO);
   }
   */
}




















