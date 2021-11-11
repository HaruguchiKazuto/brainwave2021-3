import controlP5.*;
import ddf.minim.*;

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
int condition = -50;
int concentration = 0;


void setup(){
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
  if (count%2==0){
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
