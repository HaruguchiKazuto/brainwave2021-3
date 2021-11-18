import controlP5.*;
import ddf.minim.*;

ControlP5 cp5;
Minim  minim;
AudioPlayer player;

String fileName1; 
String fileName2;
String fileName3;
String fileName4; 
String fileName5; 
String fileName6;
String fileName7; 
int count = 0;
int count2 = 0;
int condition = -50;
float circle_x = 100;
float circle_y = 20;
// how much to move the circle on each frame
float move_x = 5;
float move_y = -5;


void setup(){
  fileName1 = "6.mp3";
  fileName2 = "9.mp3";
  fileName3= "10.mp3";
  fileName4 = "11.mp3";
  fileName5= "12.mp3"; 
  fileName6= "13.mp3";
  fileName7 ="14.mp3";

  size(600, 650);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER, CENTER);
  minim = new Minim( this );
  frameRate(60);
  
 
 //音楽ファイルを読み込む
   player = minim.loadFile(fileName1);
   if(player == null ){
   //読み込み失敗時
   println( fileName1 + "の読み込み失敗" );
   
   stroke(#D60DFF);
  strokeWeight(7);
   
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
  ellipse(circle_x, circle_y, 20, 20);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  if(circle_x > 500) {
    circle_x = 500;
    move_x = -move_x;
    println("too far right");
  }
  if(circle_y > 420) {
    circle_y = 420;
    move_y = -move_y;
    println("too far bottom");
  }
  if(circle_x < 100) {
    circle_x = 100;
    move_x = -move_x;
    println("too far left");
  }
  if(circle_y < 135) {
    circle_y = 135;
    move_y = -move_y;
    println("too far top");
  }
  
  
  fill(150);
  text(fileName1, 300, 80);
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
  player.close();
  println("Backward clicked");
  
  if (count2%7 ==0){
    player = minim.loadFile(fileName7 );
  if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
  if (count2%7 ==1){
  player = minim.loadFile(fileName6 );
    if(player == null ){
   //読み込み失敗時
     println( fileName2 + "の読み込み失敗" );
   
 }
     player.play();
    
}
if (count2%7 ==2){
  player = minim.loadFile(fileName5 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==3){
  player = minim.loadFile(fileName4 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==4){
  player = minim.loadFile(fileName3 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==5){
  player = minim.loadFile(fileName2 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==6){
  player = minim.loadFile(fileName1 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
}

count2++;
    
}

void Forward(){
  println("Forward clicked");
 player.close();
    if (count2%7 ==0){
      text(fileName1, 300, 80);
    player = minim.loadFile(fileName2 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();

    
}
if (count2%7 ==1){
   player = minim.loadFile(fileName3 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==2){
   player = minim.loadFile(fileName4 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==3){
   player = minim.loadFile(fileName5 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==4){
   player = minim.loadFile(fileName6 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==5){
   player = minim.loadFile(fileName7 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
if (count2%7 ==6){
   player = minim.loadFile(fileName1 );
 if(player == null ){
   //読み込み失敗時
   println( fileName2 + "の読み込み失敗" );
   
 }
 player.play();
    
}
count2 ++;
}
