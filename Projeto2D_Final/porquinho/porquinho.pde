/*
COMPUTAÇÃO E REPRESENTAÇÃO GRÁFICA 01/2022
PROJETO PORQUINHO - VERSÃO COMPLETA DO PROJETO DE ANIMAÇÃO 2D

DUPLA: LUIZ FILLIPE OLIVEIRA MORAIS E EMANUEL SILVA SERGIO

COMANDOS:
Mover orelhas = 'O' ou 'o'
Mover sobrancelhas = 'S' ou 's'
Piscar olho esquerdo = '<--'
Piscar olho direito = '-->'
Fecha ambos os olhos = 'F' ou 'f'
Mover boca = 'B' ou 'b'
Trilha sonora = 'G' ou 'g'
Flor = 'z' ou 'z' (pressed == true)
Além da interação com a posição do mouse e do botão

*/


import processing.sound.*;
SoundFile file;

color rosaCorpo = color(255,192,203);
color rosaFocinho = color(255,166,181);
color preto = color(0,0,0);
int sobrancelhaTAM = 280;
int curve = -180;
float rotate = 0.45;
float rotateEsquerda = -0.6;
float rotatePiercing = 0.0;
float rotatePernaDireita = 0;

int alpha = 1, delta = 1;
 
int bocaX = -105;
int bocaY = 83;
int contador = 0;
int flag = 0;
int contador1 = 0;
int flag1 = 0;

int  olhoD=10;
int  olhoE=10;
int  olhoD2=10;
int  olhoE2=10;

int contadorD = 0;
int flagD = 0;
int contadorE = 0;
int flagE = 0;
 
void setup() {
  size(1080, 700);
  background(255,255,255);  
  file = new SoundFile(this, "porco.wav");
  noFill();

 
}

void corpo(){
  fill(rosaCorpo);
  circle(540,350,300);
}

void movimentaOrelhaDireita(){
  if ( key == 'o' || key == 'O'){
    if (flag == 0){
      rotate = rotate + 0.001;
      rotateEsquerda = rotateEsquerda - 0.001;
      rotatePiercing = rotatePiercing - 0.0001;
      contador = contador + 1;
    if (contador == 50){
        flag = 1; 
    }
  }
      if (flag == 1) {
      rotate = rotate - 0.001;
      rotateEsquerda = rotateEsquerda + 0.001;
      rotatePiercing = rotatePiercing + 0.0001;
      contador = contador - 1;
      if (contador == 0)
        flag = 0;
      }  
  }    
}  
    


void orelhaDireita(){
  //Direita
  pushMatrix();
  fill(0,0,0);
  stroke(0);
  fill(rosaCorpo);
  beginShape();
  curveVertex(curve,  480);
  curveVertex(190,  270);
  curveVertex(148, 97);
  curveVertex(140,  97);
  curveVertex(80, 280);
  curveVertex(780, 270);
  translate(600,-50);
  rotate(rotate); //0.4

  endShape();
  popMatrix();
 
  //contorno interno
  pushMatrix();
  scale(0.7);
  noStroke();
  fill(rosaFocinho);
  beginShape();
  curveVertex(-180,  480);
  curveVertex(190,  270);
  curveVertex(148, 97);
  curveVertex(140,  97);
  curveVertex(80, 280);
  curveVertex(780, 270);
  translate(900,30);
  rotate(rotate + 0.12);
  endShape();
  popMatrix();
  stroke(1);
 }
 
void orelhaEsquerda(){
  pushMatrix();
  fill(rosaCorpo);
  beginShape();
  curveVertex(-180,  480);
  curveVertex(190,  270);
  curveVertex(148, 97);
  curveVertex(140,  97);
  curveVertex(80, 280);
  curveVertex(780, 270);
  translate(180,120);
  rotate(rotateEsquerda);
  endShape();
  popMatrix();
   
  //contorno interno
  pushMatrix();
  scale(0.7);
  noStroke();
  fill(rosaFocinho);
  beginShape();
  curveVertex(-180,  480);
  curveVertex(190,  270);
  curveVertex(148, 97);
  curveVertex(140,  97);
  curveVertex(80, 280);
  curveVertex(780, 270);
  translate(370,220);
  rotate(rotateEsquerda);
  endShape();
  popMatrix();
  stroke(1);

}

void olhoDireito(){
  fill(255,255,255);
  //ellipse(500,300,70,80);
  fill(preto);
  ellipse(500,315,40,50);
  strokeWeight(4);
  line(490, 315, 470, 310);
  line(500, 315, 470, 300);
  strokeWeight(1);
}

void olhoEsquerdo(){
  fill(255,255,255);
  //ellipse(600,280,70,80);
  fill(preto);
  ellipse(600,295,40,50);
  strokeWeight(4);
  line(590, 295, 570, 280);
  line(600, 300, 570, 290);
  strokeWeight(1);
}

void pernaDireita(){
  pushMatrix();
  fill(0,0,0);
  stroke(0);
  fill(rosaCorpo);
  rotate (rotatePernaDireita);
  rect(555,480,70,70,20);
  fill(0,0,0);
  rect(555,520,70,35,150);
  if(mouseX < 540 && rotatePernaDireita > - 0.01)
    rotatePernaDireita = rotatePernaDireita - 0.0001;
  else if (mouseX > 540 && rotatePernaDireita < + 0.01)
    rotatePernaDireita = rotatePernaDireita + 0.0001;
    
  
  noFill();
 
  popMatrix();
}

void pernaEsquerda(){
    fill(0,0,0);
  stroke(0);
  fill(rosaCorpo);
  rect(465,480,70,70,20);
  fill(0,0,0);
  rect(465,520,70,35,150);
  noFill();
}

void focinho(){
 
  fill(rosaFocinho);
  beginShape();
  curveVertex(580,  60);
  curveVertex(560,  380);
  curveVertex(650,  350);
  curveVertex(550, 40);
  //curveVertex(132, 200);
  endShape();
  noStroke();
  //Nariz esquerdo
  pushMatrix();
  fill(rosaCorpo);
  rotate(-0.25);
  translate(-120,142);
  ellipse(600,380,20,30);
  popMatrix();
  //nariz direito
  pushMatrix();
  fill(rosaCorpo);
  rotate(-0.25);
  translate(-90,140);
  ellipse(600,380,20,30);
  popMatrix();
  stroke(1);
 }

void boca(){
    pushMatrix();
    pushStyle();
    translate(520,400);
    scale(0.5,0.5);
    rotate(0);
    fill(rosaFocinho);
    stroke(0xFF000000);
    strokeWeight(4);
    beginShape();
    curveVertex(bocaX,bocaY); curveVertex(30,100); curveVertex(-100,79); curveVertex(-133,-43); curveVertex(bocaX,bocaY); curveVertex(30,100); curveVertex(-100,79); /**/
    endShape();
    popStyle();
    popMatrix();
    
  }
  
void mexeBoca(){
    if ( key == 'b' || key == 'B'){
    if (bocaX >= -105 && bocaX < -45 ) {
      bocaX = bocaX + 1;
    }
    if (bocaY <= 83 && bocaY > 40){
      bocaY = bocaY - 1;
    }
}
  else{
  if (bocaX > -105 ) 
      bocaX = bocaX - 1;
   
    if (bocaY < 83 ){
      bocaY = bocaY + 1;
    
    }
  }
}

void piercing(){
 pushMatrix();
 noFill();
 rotate(rotatePiercing);
 arc(350,155,50,50,1.8,6);
  popMatrix();
}


void sobrancelha(){
  noFill();
  strokeWeight(4);
 arc(480,sobrancelhaTAM,50,50,3.12,4.8);
   
 arc(580,sobrancelhaTAM,50,80,3.8,4.8);
    strokeWeight(1);
}


void sobrancelhaMexe(){
   if ( key == 's' || key == 'S'){
    if (flag1 == 0) {
      sobrancelhaTAM --;
      contador1++;
      if (contador1 == 17)
        flag1 = 1;
    }
    if (flag1 == 1){
        sobrancelhaTAM ++;
        contador1--;
    if (contador1 == 0)
      flag1 = 0;   
    }
  }
}
void palpedraD(){
  noStroke();
  fill(rosaCorpo);
  rect(460,280,61,olhoD); 
  stroke(1);

}
void palpedraE(){
  noStroke();
  fill(rosaCorpo);
  rect(560,258,61,olhoE); 
  stroke(1);

}
void palpedraD2(){
  noStroke();
  fill(rosaCorpo);
  rect(460,280,61,olhoD2); 
  stroke(1);

}
void palpedraE2(){
  noStroke();
  fill(rosaCorpo);
  rect(560,258,61,olhoE2); 
  stroke(1);

}



void fecharolhodireito(){
  palpedraD();


  if(olhoD>=10){
   olhoD ++;
    
  }
  if(olhoD>60){
    olhoD --;
  }
   if(olhoD==60){
     stroke(1);     
     strokeWeight(4);
     noFill();
     arc(500, 265, 55, 150, 0.8, 2.2);
     strokeWeight(1);
     
   }   
}



void fecharolhoesquedo(){
  palpedraE();

  if(olhoE>=10){
   olhoE ++;
    
  }
  if(olhoE>60){
    olhoE=60;
  }
   if(olhoE==60){
     stroke(1);     
     strokeWeight(4);
     noFill();
     arc(600, 245, 55, 150, 0.8, 2.2);
     strokeWeight(1);
     
   }   
}


void abreolhoD(){
  if(olhoE>=10){
   olhoE --;
    
  }
  if(olhoE>60){
    olhoE ++;
  }
     
}
  
  
void fechaolhos(){
    if(key== 'f' || key=='F'){ 
      fecharolhoesquedo();
      fecharolhodireito();
}else{
  olhoE=10;
  olhoD=10;
}}


void fecharolhodireito2(){
  palpedraD2();


  if(contadorD<50){
   contadorD++;
   olhoD2 ++;
    
  }
  if(contadorD>=50 && contadorD<80){
     contadorD++;
    stroke(1);
     strokeWeight(4);
     noFill();
     arc(500, 265, 55, 150, 0.8, 2.2);
     strokeWeight(1);
     
  }
   if(contadorD>=80 ){
     contadorD++;
     olhoD2 --;
   } 
   if(contadorD>=130){
     contadorD = 0;
     olhoD2=10;
   } 
}



void fecharolhoesquedo2(){
  palpedraE2();

  if(contadorE<50){
   contadorE++;
   olhoE2 ++;
    
  }
  if(contadorE>=50 && contadorE<80){
     contadorE++;
    stroke(1);
     strokeWeight(4);
     noFill();
     arc(600, 245, 55, 150, 0.8, 2.2);
     strokeWeight(1);
     
  }
   if(contadorE>=80 ){
     contadorE++;
     olhoE2 --;
   } 
   if(contadorE>=130){
    contadorE = 0;
    olhoE2=10;
   } 
}


void piscaesdireito(){
  if(key == CODED && keyCode == LEFT){ 
   fecharolhodireito2();  

 
}}  




void piscaEsquerdo(){
  if(key == CODED && keyCode == RIGHT){ 
   fecharolhoesquedo2();  

 
}} 


void barulhoPorco(){
  if (key == 'G' || key == 'g' ) {
    if(file.isPlaying())
      file.pause();
    else
      file.play();
  } 
 
}
void animaFlor(){
  if(keyPressed == true && key == 'z' || key == 'Z')
    flor();

}
void flor(){
  if (alpha == 0 || alpha == 255) { delta = -delta; }
  alpha += delta;

  pushMatrix();
  translate(100,300);
  strokeWeight(10);
  stroke(0, 128, 0);
  line(100, 100, 100, 300);
  
  
  ellipse(105, 200, 10, 10);
  ellipse(95, 225, 10, 10);
  
  strokeWeight(1);
  stroke(0);
  
  
  fill(255, 100, 0,alpha);
  ellipse(50, 50, 100, 100);
  ellipse(150, 50, 100, 100);
  ellipse(50, 150, 100, 100);
  ellipse(150, 150, 100, 100);
  
  fill(255, 128, 0,alpha);
  ellipse(100, 100, 100, 100);
  
  
  popMatrix();
}
void draw() {
  background(255,255,255);
  make();
  pernaDireita();
  pernaEsquerda();
  orelhaDireita();
  orelhaEsquerda();
  corpo();
  olhoDireito();
  olhoEsquerdo();
  focinho();
  piercing();
  boca();
  sobrancelha();
  sobrancelhaMexe();
  movimentaOrelhaDireita();
  mexeBoca();
  fechaolhos(); 
  piscaEsquerdo();
  piscaesdireito();
  barulhoPorco();
  night();
  animaFlor();
  }
