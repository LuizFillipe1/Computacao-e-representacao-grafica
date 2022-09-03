/*
COMPUTAÇÃO E REPRESENTAÇÃO GRÁFICA 01/2022
 PROJETO PORQUINHO - VERSÃO COMPLETA DO PROJETO DE ANIMAÇÃO 3D
 
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

color rosaCorpo = color(255, 192, 203);
color rosaFocinho = color(255, 166, 181);
color preto = color(0, 0, 0);
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

int a = -30;
int b = - 130;

float scale_boca = 3.0;
float sphere_eye = 20;
float sphere_eye_esq = 20;
int contador12 = 0;
int contador13 = 0;
float fecha_olho_direito_total = 94.0;

int concentration = mouseX + mouseY; 
void setup() {
  size(1080, 700, P3D);
  background(255, 255, 255);  
  file = new SoundFile(this, "porco.wav");
  noFill();
}

void corpo() {

  pushMatrix();
  fill(rosaCorpo);
  noStroke();

  translate(550, 350, -80);
  scale(1.0, 1.0, 1.5);
  sphere(150);


  popMatrix();
}

void movimentaOrelhaDireita() {
  if ( key == 'o' || key == 'O') {
    if (flag == 0) {
      rotate = rotate + 0.001;
      rotateEsquerda = rotateEsquerda - 0.001;
      rotatePiercing = rotatePiercing - 0.0001;
      contador = contador + 1;
      if (contador == 50) {
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


int z = 0;
void orelhaDireita() {
  //Direita
  pushMatrix();
  fill(0, 0, 0);
  stroke(0);
  fill(rosaCorpo);
  translate(610, 55);
  //directionalLight(51, 102, 126, 600, -50, 50);
  rotate(rotate); //0.4
  scale(0.6);
  for (z = 0; z<50; z++) {
    if (z == 0 || z == 49)
      stroke(0.1);
    else
      noStroke();
    beginShape();

    curveVertex(curve, 480, z-50);
    curveVertex(190, 270, z);
    curveVertex(148, 97, z+20);
    curveVertex(140, 97, z-30);
    curveVertex(80, 280, z-30);
    curveVertex(780, 270, z);

    //
    endShape();
  }
  popMatrix();

}

void orelhaEsquerda() {
  pushMatrix();
  fill(0, 0, 0);
  stroke(0);
  fill(rosaCorpo);

  rotate(-0.75);
    translate(180, 340, 14);
  //directionalLight(51, 102, 126, 600, -50, 50);
  rotate(rotate); //0.4
  scale(0.6);
  for (z = 0; z<50; z++) {
    if (z == 0 || z == 49)
      stroke(0.1);
    else
      noStroke();
    beginShape();

    curveVertex(curve, 480, z-30);
    curveVertex(190, 270, z-130);
    curveVertex(148, 97, z+20);
    curveVertex(140, 97, z);
    curveVertex(80, 280, z);
    curveVertex(780, 270, z-30);

    
    endShape();
  }


  popMatrix();
 

}

void olhoDireito() {
  pushMatrix();
  fill(255, 255, 255);
  translate(500, 320, 100);
  sphere(35);
  fill(preto);
  translate(0, 0, sphere_eye);
  sphere(25);
  popMatrix();
}

void olhoEsquerdo() {
  pushMatrix();
  fill(255, 255, 255);
  translate(600, 320, 100);
  sphere(35);
  fill(preto);
  translate(0, 0, sphere_eye_esq);
  sphere(25);
  popMatrix();
}

void pernaDireita() {
  pushMatrix();
  fill(0, 0, 0);
  //stroke(0);
  noStroke();
  fill(rosaCorpo);
  rotate (rotatePernaDireita);
  //scale(1.0,1.0,1.5);
  translate(600, 480, 0);
  box(80, 80, 80);
  fill(0, 0, 0);
  translate(0, 50, 0);
  box(80, 20, 80);
  fill(rosaCorpo);
  translate(0, -50, -150);
  box(80, 80, 80);
  fill(0, 0, 0);
  translate(0, 50, 0);
  box(80, 20, 80);

  if (mouseX < 540 && rotatePernaDireita > - 0.01)
    rotatePernaDireita = rotatePernaDireita - 0.0001;
  else if (mouseX > 540 && rotatePernaDireita < + 0.01)
    rotatePernaDireita = rotatePernaDireita + 0.0001;


  noFill();

  popMatrix();
}

void pernaEsquerda() {
  pushMatrix();
  fill(0, 0, 0);
  //stroke(0);
  noStroke();
  fill(rosaCorpo);
  translate(500, 480, 0);
  box(80, 80, 80);
  //rect(465,480,70,70,20);
  fill(0, 0, 0);
  translate(0, 50, 0);
  box(80, 20, 80);


  fill(rosaCorpo);
  translate(0, -50, -150);
  box(80, 80, 80);
  fill(0, 0, 0);
  translate(0, 50, 0);
  box(80, 20, 80);
  popMatrix();
}

void focinho() {
  
  pushMatrix();
  fill(rosaFocinho);
  noStroke();
  translate(550, 360, 140);
  scale(1.5, 1, 1);
  sphere(20);

  fill(rosaFocinho);
  translate(-5, 0, 20);
  scale(1, 1.9, 1);
  sphere(3);

  translate(10, 0, 0);

  sphere(3);
  popMatrix();
}


void boca() {
  pushMatrix();
  fill(rosaFocinho);
  noStroke();
  translate(550, 430, 84);
  scale(scale_boca, 1, 1.5);
  sphere(20);
  popMatrix();
  pushMatrix();
  fill(167, 2, 2);
  translate(550, 430, 42);
  scale(2.9, 1, scale_boca+2);
  sphere(14);
  
  popMatrix();
}

void mexeBoca() {
  
    if ( key == 'b' || key == 'B') {
    if (scale_boca >= 3.0 && scale_boca < 3.6 ) {
      scale_boca = scale_boca + 0.01;
    }}
    else{
        if (scale_boca >= 3.6 ) 
     scale_boca = 3.0;

    }
    
  }



void piercing() {
  pushMatrix();
  noFill();
  rotate(rotatePiercing);
  arc(350, 155, 50, 50, 1.8, 6);
  popMatrix();
}


void sobrancelha() {
  pushMatrix();
  noFill();
  strokeWeight(4);
  translate(300, 530, 100);
  arc(480, sobrancelhaTAM, 50, 50, 3.12, 4.8);

  arc(580, sobrancelhaTAM, 50, 80, 3.8, 4.8);
  strokeWeight(1);
  popMatrix();
}


void sobrancelhaMexe() {
  if ( key == 's' || key == 'S') {
    if (flag1 == 0) {
      sobrancelhaTAM --;
      contador1++;
      if (contador1 == 17)
        flag1 = 1;
    }
    if (flag1 == 1) {
      sobrancelhaTAM ++;
      contador1--;
      if (contador1 == 0)
        flag1 = 0;
    }
  }
}
void palpedraD() {
  noStroke();
  fill(rosaCorpo);
  rect(460, 280, 61, olhoD); 
  stroke(1);
}
void palpedraE() {
  noStroke();
  fill(rosaCorpo);
  rect(560, 258, 61, olhoE); 
  stroke(1);
}
void palpedraD2() {
  noStroke();
  fill(rosaCorpo);
  rect(460, 280, 61, olhoD2); 
  stroke(1);
}
void palpedraE2() {
  noStroke();
  fill(rosaCorpo);
  rect(560, 258, 61, olhoE2); 
  stroke(1);
}

float fecha_olho_direito = 100;

void fecharolhodireito() {
  pushMatrix();
  noStroke();
  fill(rosaCorpo);
  translate(500, 320, fecha_olho_direito);
  if (fecha_olho_direito < 106)
    fecha_olho_direito = fecha_olho_direito + 0.1;
  if (sphere_eye > 0)
      sphere_eye = sphere_eye - 0.1; 
  sphere(35);
  popMatrix();
}

void fecha_total_olho(){
  pushMatrix();
   noStroke();
  fill(rosaCorpo);
  translate(500, 320, fecha_olho_direito_total);
  if(fecha_olho_direito_total < 99)
    fecha_olho_direito_total = fecha_olho_direito_total + 0.1;
  scale(1.0,1.0,1.4);
  sphere(35);

  popMatrix();
}

void fecha_total_olho_esquerdo(){
  pushMatrix();
   noStroke();
  fill(rosaCorpo);
  translate(600, 320, fecha_olho_direito_total);
  if(fecha_olho_direito_total < 99)
    fecha_olho_direito_total = fecha_olho_direito_total + 0.1;
  scale(1.0,1.0,1.4);
  sphere(35);

  popMatrix();
}



void fecharolhoesquedo() {
  pushMatrix();
  noStroke();
  fill(rosaCorpo);
  translate(600, 320, fecha_olho_direito);
  if (fecha_olho_direito < 106)
    fecha_olho_direito = fecha_olho_direito + 0.1;
  if (sphere_eye_esq > 0)
      sphere_eye_esq = sphere_eye_esq - 0.1; 
  sphere(35);
  popMatrix();
  
}



void fechaolhos() {
  if (key== 'f' || key=='F') { 
     fecha_total_olho();
     fecha_total_olho_esquerdo();
}
  else
    fecha_olho_direito_total = 90;

}

    
  



void fecharolhodireito2() {
  
  if (contador13 < 90 ){
     fecharolhodireito();
     contador13++;
}
  else{
    fecha_olho_direito = 100;
    sphere_eye =  20; 
    contador13 =0;
  }
}

void fecharolhoesquerdo2() {
  
  if (contador12 < 90 ){
     fecharolhoesquedo();
     contador12++;
}
  else{
    fecha_olho_direito = 100;
    sphere_eye_esq =  20; 
    contador12 =0;
  }
}
void piscaesdireito() {
  if (key == CODED && keyCode == LEFT) { 
    fecharolhodireito2();
  }
  }  

void piscaEsquerdo() {
  if (key == CODED && keyCode == RIGHT) {
    fecharolhoesquerdo2();
    
  }
} 

void sombrancelhaD(){
fill(preto);
pushMatrix();
rotate(0.3);
translate(550, -170+sobrancelhaTAM , 130);
box(80, 20, 30);
popMatrix();
}
void sombrancelhaE(){
pushMatrix();
rotate(2.7);
translate(-430, -770+sobrancelhaTAM , 130);
box(80, 20, 30);
popMatrix();

}

void barulhoPorco() {
  if(keyPressed){
  if (key == 'G' || key == 'g' ) {
    if (file.isPlaying())
      file.pause();
    else
      file.play();
  }
}}
void animaFlor() {
  if (keyPressed == true && key == 'z' || key == 'Z')
    flor();
}
void flor() {
  if (alpha == 0 || alpha == 255) { 
    delta = -delta;
  }
  alpha += delta;

  pushMatrix();
  translate(100, 300);
  strokeWeight(10);
  stroke(0, 128, 0);
  line(100, 100, 100, 300);


  ellipse(105, 200, 10, 10);
  ellipse(95, 225, 10, 10);

  strokeWeight(1);
  stroke(0);


  fill(255, 100, 0, alpha);
  ellipse(50, 50, 100, 100);
  ellipse(150, 50, 100, 100);
  ellipse(50, 150, 100, 100);
  ellipse(150, 150, 100, 100);

  fill(255, 128, 0, alpha);
  ellipse(100, 100, 100, 100);


  popMatrix();
}



void draw() {
  camera(mouseX, mouseY, (height/1.8) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  background(150, 150, 255);
  perspective(PI/3.0, float(width)/float(height), 10, 1280);
  

  
  
  
  // pointLight(255, 255, 255, 300, 160, 300);
  directionalLight(126, 126, 126, 0, 0, -1);
  ambientLight(102, 102, 102);
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
  sombrancelhaD();
  sombrancelhaE();
  
}
