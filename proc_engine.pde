//private World world; // the world
private int[][] temp_map = {
      {1, 1, 1, 1, 1}, 
      {1, 2, 2, 2, 1}, 
      {1, 2, 3, 2, 1}, 
      {1, 2, 2, 2, 1}, 
      {1, 1, 1, 1, 1}};
private int tilesize = 10;// in pixels

void setup() {
      size(450, 450, P3D);
      noSmooth(); // anti alias
      
      translateX = 0;
      translateY = 0;
      translateZ = 0;
      rotateDegsX = 50;// tilt back (rotateX done before Z)
      rotateDegsY = 0; 
      rotateDegsZ = 30;
      
}

int translateX, translateY, translateZ;
int rotateDegsX, rotateDegsY, rotateDegsZ;

boolean keyW=false, keyA=false, keyS=false, keyD=false, 
      keyQ=false, keyE=false; // wasd keys pressed

//String turn;
void draw() {
      background(20,20,20);
      translate(width/2, height/2);// point of origen with 0,0 centered
      //scale(2.0,2.0,2.0);
      //check for key events
      checkKeys();
      pushMatrix();     

      translate(translateX, translateY, translateZ); 
      
      rotateX(radians(rotateDegsX));
      rotateY(radians(rotateDegsY));
      rotateZ(radians(rotateDegsZ));
      
      drawOrigin(15);
      drawGrid();
      drawAxes();
      drawEnvironment();
      popMatrix();
}
/**      draw everything in th scene      */
private void drawEnvironment(){
      pushMatrix();
      translate(100,100);
      fill(20,100,20);
      stroke(20,100,20);
      
      box(10);
      popMatrix();
}

private void checkKeys(){
       if (keyW) {
           
      }
      if (keyA) {
           
      }
      if (keyQ) {
            rotateDegsZ ++; 
            if (rotateDegsZ > 360) rotateDegsZ=0;
      }
      if (keyS) {
           
      }
      if (keyD) {
           
      }
      if (keyE) {
            rotateDegsZ --; 
            if (rotateDegsZ < 0) rotateDegsZ=360;
      }
}
/**
 draws 3d cube thingie at center
 */
private void drawOrigin(int cubeSize) {
      pushMatrix();
      stroke(190, 190, 190);
      fill(255, 0);//transparent

      lineRect(0, 0, cubeSize, cubeSize, "center");// draw on x,y plane
      rotateX(PI/2); // rotate around X
      lineRect(0, 0, cubeSize, cubeSize, "center");// draw on y,z plane
      rotateY(PI/2);// rotate around Y
      lineRect(0, 0, cubeSize, cubeSize, "center");// draw on x,z plane
      popMatrix();// preserve previous transform stack
}

/**
 draw the 10x10 grid at current location
 */
private void drawGrid() {
      pushMatrix();
      //fill(0,0);//transparent
      stroke(255);

      for (int i = -100; i< 100; i+=20) {
            for (int j = -100; j< 100; j+=20) {
                  lineRect(i, j, 20, 20, "corner");
            }
      }
      popMatrix();
}
/***/private void drawAxes() {
      pushMatrix();
      pushStyle();
      strokeWeight(3);
      
      stroke(255,0,0);//x
      line(0,0,50,0);
      
      stroke(0,255,0);//y
      line(0,0,0,50);
      
      stroke(0,0,255);//z
      rotateY(radians(-90));
      line(0,0,50,0);
      
      popStyle();
      popMatrix();
}
/**
 helper function for drawing
 draws a square out of 4 lines
 */
private void lineRect(int x, int y, int w, int h, String mode) {
      if (mode.equals("center")) { // pull square back by half width, height 
            x = x-(w/2);
            y = y-(h/2);
      }
      line(x, y, x, y+h);// left
      line(x, y, x+w, y);//top
      line(x+w, y, x+w, y+h);//right
      line(x, y+h, x+w, y+h);//bottom
}

void  mousePressed() {
}
void mouseReleased() {
}
void keyPressed() {
      if (key == 'w' || key == 'W')
            keyW = true;
      else if (key == 'a' || key == 'A') {
            keyA = true;
      } else if (key == 's' || key == 'S') {
            keyS = true;
      } else if (key == 'd' || key == 'D') {
            keyD = true;
      } else if (key == 'q' || key == 'Q') {
            keyQ = true;
      } else if (key == 'e' || key == 'E') {
            keyE = true;
      } 
}
void keyReleased() {
      if (key == 'w' || key == 'W')
            keyW = false;
      else if (key == 'a' || key == 'A') {
            keyA = false;
      } else if (key == 's' || key == 'S') {
            keyS = false;
      } else if (key == 'd' || key == 'D') {
            keyD = false;
      }else if (key == 'q' || key == 'Q') {
            keyQ = false;
      } else if (key == 'e' || key == 'E') {
            keyE = false;
      } 
}