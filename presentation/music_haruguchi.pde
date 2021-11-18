import controlP5.*;
import ddf.minim.*;
import oscP5.*;
import netP5.*;


ControlP5 cp5;
Minim  minim;
AudioPlayer player;

String Classic0; 
String Classic1; 
String Song0;
String Song1; 
String Song2; 
String Song3; 
String Song4; 
int count = 0;
int count2 = 0;
int count3 = 0;
int condition = -50;
int concentration = 1; // boundary

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


void setup(){
  
  for(int ch = 0; ch < N_CHANNELS; ch++){
    offsetX[ch] = (width / N_CHANNELS) * ch + 15;
    offsetY[ch] = height / 2;
  }
  
  Song0 = "Fallin_For_You.mp3";
  Song1 = "Orange.mp3";
  Song2 = "Raindrop.mp3"; 
  Song3 = "SweetShareRooM.mp3";
  Song4 = "With_You.mp3";
  Classic0 = "6.mp3";
  Classic1 = "9.mp3";

  size(600, 650);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER, CENTER);
  minim = new Minim( this );
 
 if (concentration == 1){
 player = minim.loadFile(Song0);
 player.play();
 if(player == null ){
   println( Song0 + "の読み込み失敗" );
 }
}

if (concentration == 0){
 player = minim.loadFile(Classic0);
 player.play();
 if(player == null ){
   println( Classic0 + "の読み込み失敗" );
 }
}

  cp5 = new ControlP5(this);
  
  cp5.addButton("Play")
    .setLabel("Play")
    //.setFont(font)
    .setPosition(250, 440)
    .setSize(130,50);
    
    
  cp5.addButton("Backward")
    .setLabel("Backward")
    //.setFont(font)
    .setPosition(250, 500)
    .setSize(50,30);
    
  cp5.addButton("Forward")
    .setLabel("Forward")
    //.setFont(font)
    .setPosition(330, 500)
    .setSize(50,30);
  
    
}





void draw(){
  fill(0);
  rect(300, 80, 400, 50);
  fill(0);
  rect(300, 280, 400, 300);
  fill(0);
  rect(300, 570, 400, 50);
  
  if (concentration == 1){
    fill(150);
    if (count2%5 ==0){
      text(Song0, 300, 80);
    }
    if (count2%5 ==1){
      text(Song1, 300, 80);
    }
    if (count2%5 ==2){
      text(Song2, 300, 80);
    }
    if (count2%5 ==3){
      text(Song3, 300, 80);
    }
    if (count2%5 ==4){
      text(Song4, 300, 80);
    }
  }
  
  if (concentration == 0){
    fill(150);
    if (count2%2 ==0){
      text(Classic0, 300, 80);
    }
    if (count2%2 ==1){
      text(Classic1, 300, 80);
    }
  }
  
  
  if(condition<0){
    //fill(126);
    text("No Concentration",300, 570);
    textSize(15);
    frameRate(3);
    fill(random(0,255),random(0,255),random(0,255));
   
    
  }
  if(condition>= 0 && condition <5){
    fill(200);
    text("Some Concentration", 300, 570);
     textSize(15);
     
  }
  if(condition>=5){
    fill(126);
    text("A lot of Concentration", 300, 570);
     textSize(15);
    
  }

  
}

void Play(){

  count++;
  if (count%2==1){
    println("Pressed multiples of 2");
    player.pause();
  }else{
    println("Pressed multiples of not 2");
    player.play();
  }
  
}

void Backward(){
  
if (concentration == 1){
  if (count2 == 0){
    count2 = count2 + 5;
  }
  count2--;
  player.close();
  println("Backward clicked");
  if (count2%5 ==0){
      player = minim.loadFile(Song0);
   if(player == null ){
     println( Song0 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==1){
    player = minim.loadFile(Song1);
   if(player == null ){
     println( Song1 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==2){
    player = minim.loadFile(Song2);
   if(player == null ){
     println( Song2 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==3){
    player = minim.loadFile(Song3);
   if(player == null ){
     println( Song3 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==4){
    player = minim.loadFile(Song4);
   if(player == null ){
     println( Song4 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
}

if (concentration == 0){
  if (count2 == 0){
    count2 = count2 + 2;
  }
  count2--;
  player.close();
  println("Backward clicked");
  if (count2%2 ==0){
    player = minim.loadFile(Classic0);
   if(player == null ){
     println( Classic0 + "の読み込み失敗" );
     
   }
   player.play();
  }
  if (count2%2 ==0){
    player = minim.loadFile(Classic1);
   if(player == null ){
     println( Classic1 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
}
    
}

void Forward(){
if (concentration == 1){
  count2 ++;
  println("Forward clicked");
  player.close();
  if (count2%5 ==0){
      player = minim.loadFile(Song0);
   if(player == null ){
     println( Song0 + "の読み込み失敗" );
     
   }
   player.play();
  
      
  }
  if (count2%5 ==1){
     player = minim.loadFile(Song1);
   if(player == null ){
     println( Song1 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==2){
     player = minim.loadFile(Song2);
   if(player == null ){
     println( Song2 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==3){
     player = minim.loadFile(Song3);
   if(player == null ){
     println( Song3 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==4){
     player = minim.loadFile(Song4);
   if(player == null ){
     println( Song4 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
}

if (concentration == 0){
  count2 ++;
  println("Forward clicked");
  player.close();
  if (count2%2 ==0){
     player = minim.loadFile(Classic0);
   if(player == null ){
     println( Classic0 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%2 ==1){
     player = minim.loadFile(Classic1);
   if(player == null ){
     println( Classic1 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
}

}

void Music(int concentration){
  System.out.println("Music function");
if (concentration == 1){
  println("Forward clicked");
  player.close();
  if (count2%5 ==0){
      player = minim.loadFile(Song0);
   if(player == null ){
     println( Song0 + "の読み込み失敗" );
     
   }
   player.play();
  
      
  }
  if (count2%5 ==1){
     player = minim.loadFile(Song1);
   if(player == null ){
     println( Song1 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==2){
     player = minim.loadFile(Song2);
   if(player == null ){
     println( Song2 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==3){
     player = minim.loadFile(Song3);
   if(player == null ){
     println( Song3 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%5 ==4){
     player = minim.loadFile(Song4);
   if(player == null ){
     println( Song4 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
}

if (concentration == 0){
  println("Forward clicked");
  player.close();
  if (count2%2 ==0){
     player = minim.loadFile(Classic0);
     
   if(player == null ){
     println( Classic0 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
  if (count2%2 ==1){
     player = minim.loadFile(Classic1);
   if(player == null ){
     println( Classic1 + "の読み込み失敗" );
     
   }
   player.play();
      
  }
}

}




void oscEvent(OscMessage msg){
  
  float data;
  int band;


  band = 0;
  if(msg.checkAddrPattern("/muse/elements/alpha_relative")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      buffer[band][ch][pointer[band]] = data;
    }
    pointer[band] = (pointer[band] + 1) % BUFFER_SIZE;
  }

  band = 1;
  if(msg.checkAddrPattern("/muse/elements/beta_relative")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue();
      buffer[band][ch][pointer[band]] = data;
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
    if (pointer[band] == 29){
      get_data_1(buffer);
      
    }
   
  }
 
}


void get_data_1(float buffer_1[][][]){
  
  alpha_ave = (sum(buffer_1[0][0])+sum(buffer_1[0][1])+sum(buffer_1[0][2])+sum(buffer_1[0][3]))/(4*60); 
  beta_ave = (sum(buffer_1[1][0])+sum(buffer_1[1][1])+sum(buffer_1[1][2])+sum(buffer_1[1][3]))/(4*60);
  evalue = 4000*(alpha_ave+1.2*beta_ave);
  
  
  System.out.println("alpha_ave:"+alpha_ave);
  System.out.println("beta_aves:"+beta_ave);
  System.out.println("evalue:"+evalue);
  
  
  boolean  ret  =  player.isPlaying() ;

  if (evalue >= 800){
    concentration = 1;
    if (ret == true && count3>0){
        Music(concentration);
    }
     count3 = 0;
    
    
  }else{
    concentration = 0;
    if (ret == true && count3 ==0){
        Music(concentration);
    }
    count3++;
  }
} 

private static float sum(float[] list){
  float ans = 0;
  for(int i = 0; i < list.length ; i++){
    ans += list[i];
  }
  return ans;
}
