/*
Luiz Fillipe Oliveira Morais
Matrícula: 2019107733
Computação e representação gráfica 2022/1
*/

void setup(){
  size(1000,600);
  background(72,209,204);
}

void draw(){
  // Cenário
  float red = 155;
  float blue = 255;
  for (int i = 0; i < 600.0; i++){
    stroke(red, 0, blue, 200);
    line(0 ,i , 1000, i);
    blue = blue - (255/600.0);
    red = red + (255/600.0);
}
  stroke(0,0,0);
  //Desenho do retangulo do prédio
  fill(228,233,159);
  rect(350,150,300,450);
  
  //Desenho do telhado

  fill(182,0,55);
  triangle(300, 150, 700, 150, 500, 10);
  noFill();

  
  
  //Desenho das janelas
  fill(184,189,22);
  rect(380,260,90,45);
  line(425,260,425,305);
  
  fill(243,255,58);
  rect(380,330,90,45);
  line(425,330,425,375);
  
  rect(380,400,90,45);
  line(425,400,425,445);
  
  fill(221,228,24);
  rect(380,470,90,45);
  line(425,470,425,515);
  
  rect(530,400,90,45);
  line(575,400,575,445);
 
  rect(530,470,90,45);
  line(575,470,575,515);
  
  fill(0,0,0);
  rect(530,260,90,45);
  
  rect(530,330,90,45);
  
  fill(110,114,11);
  circle(500,200,60);
  
  //Desenho da porta
  fill(96,96,96);
  rect(450,540,100,60);
  line(500,540,500,600);
  circle(490,575,5);
  circle(510,575,5);
  
  //Desenho da árvore
  //tronco
  fill(160,82,45);
  rect(100,445,80,160,25);
  //folhas
  fill(0,100,0);
  ellipse(100,445,300,20);
  ellipse(150,445,150,30);
  ellipse(150,400,80,90);
  ellipse(150,400,100,20);
  circle(120,400,50);
  circle(120,450,60);
  circle(80,420,60);
  
  //pressione a tecla "s" ou "S" para salvar a imagem em formate PNG.
  if (key == 's' || key == 'S') {
    save("Tarefa01.png"); 
  }  
}
