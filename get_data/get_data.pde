import oscP5.*;
import netP5.*;

final int N_CHANNELS = 4;
final int N_BANDS = 5;
final int BUFFER_SIZE = 30;
// final float MAX_MICROVOLTS = 1682.815;
// final float DISPLAY_SCALE = 200.0;
final float DISPLAY_SCALE = - 400.0;
final String[] LABELS = new String[] {
  "TP9", "FP1", "FP2", "TP10"
};

final color BG_COLOR = color(0, 0, 0);
final color AXIS_COLOR = color(255, 0, 0);
// final color GRAPH_COLOR = color(0, 0, 255);
final color[] GRAPH_COLORS = { color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), 
			       color(0, 255, 255), color(0, 255, 255) };
final color LABEL_COLOR = color(255, 255, 0);
final int LABEL_SIZE = 21;

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

void setup(){
  size(1000, 600);
  frameRate(30);
  smooth();
  for(int ch = 0; ch < N_CHANNELS; ch++){
    offsetX[ch] = (width / N_CHANNELS) * ch + 15;
    offsetY[ch] = height / 2;
  }
}

void draw(){
  float x1, y1, x2, y2;
  background(BG_COLOR);

  for(int band = 0; band < 3; band++){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      for(int t = 0; t < BUFFER_SIZE; t++){
        stroke(GRAPH_COLORS[band]);
        x1 = offsetX[ch] + t;
        y1 = offsetY[ch] + buffer[band][ch][(t + pointer[band]) % BUFFER_SIZE] * DISPLAY_SCALE;
        x2 = offsetX[ch] + t + 1;
        y2 = offsetY[ch] + buffer[band][ch][(t + 1 + pointer[band]) % BUFFER_SIZE] * DISPLAY_SCALE;
        line(x1, y1, x2, y2);
      }
    }
  }

  for(int ch = 0; ch < N_CHANNELS; ch++){
    stroke(AXIS_COLOR);
    x1 = offsetX[ch];
    y1 = offsetY[ch];
    x2 = offsetX[ch] + BUFFER_SIZE;
    y2 = offsetY[ch];
    line(x1, y1, x2, y2);
  }

  fill(LABEL_COLOR);
  textSize(LABEL_SIZE);
  for(int ch = 0; ch < N_CHANNELS; ch++){
    text(LABELS[ch], offsetX[ch], offsetY[ch]);
  }
  
  //System.out.println(buffer[0][0]);

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
      get_data(buffer);
      
    }
      
  }
  

}

void get_data(float buffer_1[][][]){
  
  alpha_ave = (sum(buffer_1[0][0])+sum(buffer_1[0][1])+sum(buffer_1[0][2])+sum(buffer_1[0][3]))/(4*60); 
  beta_ave = (sum(buffer_1[1][0])+sum(buffer_1[1][1])+sum(buffer_1[1][2])+sum(buffer_1[1][3]))/(4*60);
  evalue = 400*(alpha_ave+1.2*beta_ave);
  
  evaluate = alpha_ave * 1000;
  
  
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
