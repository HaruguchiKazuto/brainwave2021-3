float r = 10;
float x0 = r;
float y0 = r;
float dx0 = 2;
float dy0 = 3;
float x1 = r+100;
float y1 = r;
float dx1 = 5;
float dy1 = 1;
float x2 = r;
float y2 = r+100;
float dx2 = 3;
float dy2 = 5;
float x3 = r+40;
float y3 = r+20;
float dx3 = 2;
float dy3 = 5;
float condition = 0;
float a = 0;

void setup()
{
  size(300,300);
  ellipseMode(RADIUS);
  background(0,0,0);
  frameRate(60);
}

void draw()
{
  stroke( 0, 0, 0, 10 );
  fill( 0, 0, 0, 10 );
  rect( 0, 0, width, height );

  stroke( 0, 0, 255, 100 );
  fill( 255, 255, 0 );
  
  if(condition<20){
    a = 0.5;
  }
  
  else if(condition<50 && condition>= 20){
    
    a = 1;
  }
  else if (condition>= 50){
    
     a = 3;
    
  }
  
  

  ellipse( x0, y0, r, r );
  x0 = x0 + a*dx0;
  y0 = y0 + a*dy0;
  if( y0 > height-r || y0 < r ) dy0 = -dy0;
  if( x0 > width-r || x0 < r )  dx0 = -dx0;
 
  ellipse( x1, y1, r, r );
  x1 = x1 + a*dx1;
  y1 = y1 + a*dy1;
  if( y1 > height-r || y1 < r ) dy1 = -dy1;
  if( x1 > width-r || x1 < r )  dx1 = -dx1;
 
  ellipse( x2, y2, r, r );
  x2 = x2 + a*dx2;
  y2 = y2 + a*dy2;
  if( y2 > height-r || y2 < r ) dy2 = -dy2;
  if( x2 > width-r || x2 < r )  dx2 = -dx2;
  
  
  ellipse( x3, y3, r, r );
  x3 = x3 + a*dx3;
  y3 = y3 + a*dy3;
  if( y3 > height-r || y3 < r ) dy3 = -dy3;
  if( x3 > width-r || x3 < r )  dx3 = -dx3;
}
