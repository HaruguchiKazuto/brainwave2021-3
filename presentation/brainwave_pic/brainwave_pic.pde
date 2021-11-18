import oscP5.*;
import netP5.*;

final int N_CHANNELS = 4;
final int N_BANDS = 5;
final int BUFFER_SIZE = 30;

final int PORT = 5000;
OscP5 oscP5 = new OscP5(this, PORT);

float[][][] buffer = new float[N_BANDS][N_CHANNELS][BUFFER_SIZE];
// int pointer = 0;
int[] pointer = { 0, 0, 0, 0, 0 };
float[] offsetX = new float[N_CHANNELS];
float[] offsetY = new float[N_CHANNELS];

//make data list
float alpha[], beta[], delta[], theta[];

float alpha_ave;
float beta_ave;
float gamma_ave;
float evalue;
float evaluate;
float [][][] buffer_tmp;


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
  
  for(int ch = 0; ch < N_CHANNELS; ch++){
    offsetX[ch] = (width / N_CHANNELS) * ch + 15;
    offsetY[ch] = height / 2;
  }
  
}

void draw()
{
  
  //background(BG_COLOR);

  
  
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
    
     a = evalue/50;
    
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




void oscEvent(OscMessage msg){
  float data;
  int band;

  // if(msg.checkAddrPattern("/muse/eeg")){

  band = 0;
  if(msg.checkAddrPattern("/muse/elements/alpha_relative")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      // data = (data - (MAX_MICROVOLTS / 2)) / (MAX_MICROVOLTS / 2); // -1.0 1.0
      buffer[band][ch][pointer[band]] = data;
      //System.out.println("alpha"+data);
    }
    pointer[band] = (pointer[band] + 1) % BUFFER_SIZE;
  }

  band = 1;
  if(msg.checkAddrPattern("/muse/elements/beta_relative")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      buffer[band][ch][pointer[band]] = data;
      //System.out.println("beta:"+data+"ch"+ch);
    }
    pointer[band] = (pointer[band] + 1) % BUFFER_SIZE;
  }
  

  band = 2;
  if(msg.checkAddrPattern("/muse/elements/gamma_relative")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      buffer[band][ch][pointer[band]] = data;
    }
    pointer[band] = (pointer[band] + 1) % BUFFER_SIZE;
  }

  band = 3;
  if(msg.checkAddrPattern("/muse/elements/delta_relative")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      buffer[band][ch][pointer[band]] = data;
    }
    pointer[band] = (pointer[band] + 1) % BUFFER_SIZE;
  }

  band = 4;
  if(msg.checkAddrPattern("/muse/elements/theta_relative")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      buffer[band][ch][pointer[band]] = data;
    }
    pointer[band] = (pointer[band] + 1) % BUFFER_SIZE;
    System.out.println("pointer:"+pointer[band]);
    if (pointer[band] == 29){
      System.out.println("in!");
      //buffer_tmp = buffer;
      //alpha_ave = (sum(buffer_tmp[0][0])+sum(buffer_tmp[0][1])+sum(buffer_tmp[0][2])+sum(buffer_tmp[0][3]))/(4*60); 
      //System.out.println("alpha_aveeeeeeee:"+alpha_ave);
      get_data_1(buffer);
      
    }
      
  }
  

}

void get_data_1(float buffer_1[][][]){
  
  alpha_ave = (sum(buffer_1[0][0])+sum(buffer_1[0][1])+sum(buffer_1[0][2])+sum(buffer_1[0][3]))/(4*60); 
  beta_ave = (sum(buffer_1[1][0])+sum(buffer_1[1][1])+sum(buffer_1[1][2])+sum(buffer_1[1][3]))/(4*60);
  evalue = 400*(alpha_ave+1.2*beta_ave);
  
  //evaluate = alpha_ave * 1000;
  
  
  System.out.println("alpha_ave:"+alpha_ave);
  System.out.println("beta_ave:"+beta_ave);
  System.out.println("evalue:"+evalue);
  System.out.println("get_data");
} 

private static float sum(float[] list){
  float ans = 0;
  for(int i = 0; i < list.length ; i++){
    ans += list[i];
  }
  return ans;
}
