int barWidth = 20;
int lastBar = -1;
color meioFechada = color(184,189,22);
color aberta = color(243,255,58);
color fechada = color(0,0,0);
color telhado = color(182,0,55);

void setup(){
  size(1000,600);
  background(72,209,204);
}



void fundo(){
  colorMode(HSB, width, height, 100);
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
  int barX = whichBar * barWidth;
  fill(barX, mouseY, 66);
  rect(barX, 0, barWidth, height);
  lastBar = whichBar;
  }
}

void keyPressed()
{
  if  (keyPressed == true && key == 'd') {
    meioFechada = color(0);
    aberta = color(0);
    fechada = color(0);
  }
  if ((keyPressed == true) && (key == 'l')) {
    meioFechada = color(243,255,58);
    aberta = color(243,255,58);
    fechada = color(243,255,58);
}}
void keyReleased()
{
  meioFechada = color(184,189,22);
  aberta = color(243,255,58);
  fechada = color(0,0,0);

}
void mouseMoved() {
  if(mouseX >500){
  meioFechada = color(243,255,58);
  aberta = color(0);
  fechada = color(243,255,58);

}
else{
  meioFechada = color(184,189,22);
  aberta = color(243,255,58);
  fechada = color(0,0,0);
}

  if(mouseY>300){
    telhado = color(mouseY*0.2,mouseX*0.2,mouseY*0.01);

  }
  else{
    telhado = color(182,0,55);
  }
}
void draw(){
  // Cenário
  fundo();
  colorMode(RGB, 255);
  stroke(0,0,0);
  //Desenho do retangulo do prédio
  fill(228,233,159);
  rect(350,150,300,450);
  
  //Desenho do telhado

  fill(telhado);
  triangle(300, 150, 700, 150, 500, 10);
  noFill();

  
  
  //Desenho das janelas
  fill(meioFechada);
  rect(380,260,90,45);
  line(425,260,425,305);
  
  fill(aberta);
  rect(380,330,90,45);
  line(425,330,425,375);
  
  rect(380,400,90,45);
  line(425,400,425,445);
  
  fill(aberta);
  rect(380,470,90,45);
  line(425,470,425,515);
  
  rect(530,400,90,45);
  line(575,400,575,445);
 
  rect(530,470,90,45);
  line(575,470,575,515);
  
  fill(fechada);
  rect(530,260,90,45);
  line(575,305,575,260);
  
  rect(530,330,90,45);
  
  fill(meioFechada);
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
  if (keyPressed == true && key == 's') {
    saveFrame("line-######.png");
  }





  

}
