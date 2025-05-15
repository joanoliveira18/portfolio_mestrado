//Variáveis
float x, x1, y, z, cam;
float ang;
float desce;
float angle=0, angle1=0;
float flying=0;
int scale=50;
int w, h;
int col;
int row;
int n, total;
boolean cancelaaberta=false;
boolean noite= true;
PVector[][] globe;
float [][] river;
//Texturas
PImage [] terra= new PImage[4];
PImage [] estrada =new PImage[4];
PImage [] ponte= new PImage[4];
PImage [] rio = new PImage [4];

//Settings
void settings() {
  size(1800, 800, P3D);
  smooth(8);
}
void setup() {
  colorMode(RGB, 255, 255, 255);
  strokeWeight(0.01);
  x=width/2;
  y=150;
  ang=0;
  desce=0;
  cam=100;
  n= 0;
  total=200;
  w=width;
  h=width;
  col= w/scale;
  row= h/scale;
  river= new float[col][row];
  globe= new PVector[total+1][total+1];
  for (int i=0; i<terra.length; i++) {
    terra[i]=loadImage("relva"+i+".jpg");
  }
  for (int i=0; i<estrada.length; i++) {
    estrada[i]= loadImage("road"+i+".jpg");
  }
  for (int i=0; i<rio.length; i++) {
    rio[i]= loadImage("rio"+i+".jpg");
  }
  for (int i=0; i<ponte.length; i++) {
    ponte[i]=loadImage("bridge"+i+".jpg");
  }
  textureMode(NORMAL);
}

void draw() {
  if (noite) {
    background(0, 0, 50);
    ambientLight(0, 0, 100);//cor
    pushMatrix();
    lightSpecular(100, 100, 100);
    pointLight(60, 60, 0, 175, height/2-190, 150);
    pointLight(60, 60, 0, 175, height/2-190, -150);
    pointLight(60, 60, 0, 1625, height/2-190, 150);
    pointLight(60, 60, 0, 1625, height/2-190, -150);
    popMatrix();
  } else {
    background(0, 200, 200);
    ambientLight(150, 100, 0);//cor
    pushMatrix();
    lightSpecular(80, 80, 80);
    pointLight(0, 0, 0, 175, height/2-190, 150);
    pointLight(0, 0, 0, 175, height/2-190, -150);
    pointLight(0, 0, 0, 1625, height/2-190, 150);
    pointLight(0, 0, 0, 1625, height/2-190, -150);
    popMatrix();
  }
  perspective(PI/4, 2.5, 0.1, 10000);
  x1 = x + cos(ang) * 1500;
  z = 125 + sin(ang) * 1500;
  camera(x1, cam, z, x, 310, 125, 0, 1, 0);
  lightSpecular(150, 150, 150);
  directionalLight(255, 255, 255, -1, 1, -1);//cor, direção
  ambient(255, 255, 255);//cor
  tint(180);
  fill(180);
  specular(125);

  //Tabuleiro da Ponte ----------------------------------------------------------------
  pushMatrix();
  translate(x, y, 0);
  y+=desce;
  if (y>=height/2) {
    desce=0;
  } else if (y<=150) {
    desce=0;
  }
  rotateX(-PI);
  scale(450, 50, 250);
  cuboLDM(ponte[n]);
  popMatrix();
  pushMatrix();
  translate(450, height/2, 0);
  rotateX(-PI);
  scale(450, 50, 250);
  cuboLDM(ponte[n]);
  popMatrix();
  pushMatrix();
  translate(1350, height/2, 0);
  rotateX(-PI);
  scale(450, 50, 250);
  cuboLDM(ponte[n]);
  popMatrix();

  //Colunas ------------------------------------------------------------------------
  pushMatrix();
  translate(675, height/2, 150);
  rotateX(-PI);
  scale(50, 555, 50);
  cuboLDM(ponte[n]);
  popMatrix();
  pushMatrix();
  translate(1125, height/2, 150);
  rotateX(-PI);
  scale(50, 555, 50);
  cuboLDM(ponte[n]);
  popMatrix();
  pushMatrix();
  translate(1120, height/2, -150);
  rotateX(-PI);
  scale(50, 555, 50);
  cuboLDM(ponte[n]);
  popMatrix();
  pushMatrix();
  translate(680, height/2, -150);
  rotateX(-PI);
  scale(50, 555, 50);
  cuboLDM(ponte[n]);
  popMatrix();

  //Cordas--------------------------------------------------------------------------
  fill(255, 255, 255);
  stroke(255);
  pushMatrix();
  canosDeSuporte(width/4-10, height/4+55, 125, 4, 245, 425);
  canosDeSuporte(width/4-10, height/4+55, -125, 4, 245, 425);
  canosDeSuporte(3*width/4-10, height/4+55, 125, 4, 245, -425);
  canosDeSuporte(3*width/4-10, height/4+55, -125, 4, 245, -425);
  popMatrix();

  //Cancela-----------------------------------------------------------------
  fill(150);
  pushMatrix();
  translate(1500, height/2-50, -100); // Posição da cancela
  drawCylinder(10, 50); // Cancela (diâmetro, altura)
  popMatrix();
  pushMatrix();
  translate(300, height/2-50, 100);
  drawCylinder(10, 50);
  popMatrix();
  if (cancelaaberta) {
    angle-=PI/500;
    angle1+=PI/500;
  } else {
    angle+=PI/12;
    angle1-=PI/12;
  }
  angle=constrain(angle, -PI/2, 0);
  angle1=constrain(angle1, 0, PI/2);
  fill(200, 200, 0);
  pushMatrix();
  translate(300, height/2-60, 100);
  rotateX(angle);
  rotateX(PI/2);
  translate(0, -75, 0);
  drawCylinder(5, 200);
  popMatrix();
  pushMatrix();
  translate(1500, height/2-60, -100);
  rotateX(angle1);
  rotateX(PI/2);
  translate(0, 75, 0);
  drawCylinder(5, 200);
  popMatrix();

  //Candeeiros-----------------------------------------------------------------------
  //1
  pushMatrix();
  fill(150);
  translate(175, height/2-75, 150);
  rotateX(-PI);
  drawCylinder(10, 200); // Cancela (diâmetro, altura)
  popMatrix();

  pushMatrix();
  fill(150, 150, 0);
  translate(175, height/2-190, 150);
  rotateX(-PI);
  noStroke();
  esfera(35);
  popMatrix();
  //2
  pushMatrix();
  fill(150);
  translate(175, height/2-75, -150);
  rotateX(-PI);
  drawCylinder(10, 200); // Cancela (diâmetro, altura)
  popMatrix();

  pushMatrix();
  fill(150, 150, 0);
  translate(175, height/2-190, -150);
  rotateX(-PI);
  noStroke();
  esfera(35);
  popMatrix();
  //3
  pushMatrix();
  fill(150);
  translate(1625, height/2-75, 150);
  rotateX(-PI);
  drawCylinder(10, 200); // Cancela (diâmetro, altura)
  popMatrix();

  pushMatrix();
  fill(150, 150, 0);
  translate(1625, height/2-190, 150);
  rotateX(-PI);
  noStroke();
  esfera(35);
  popMatrix();
  //4
  pushMatrix();
  fill(150);
  translate(1625, height/2-75, -150);
  rotateX(-PI);
  drawCylinder(10, 200); // Cancela (diâmetro, altura)
  popMatrix();

  pushMatrix();
  fill(150, 150, 0);
  translate(1625, height/2-190, -150);
  rotateX(-PI);
  noStroke();
  esfera(35);
  popMatrix();

  //Terra----------------------------------------------------------------------------
  pushMatrix();
  fill(0, 150, 0);
  noStroke();
  translate(0, height/2+175, 0);
  pushMatrix();
  translate(0, -201, 0);
  rectanguloComMalha(450, width, 10, terra[n]);
  popMatrix();
  rotateX(-PI);
  scale(450, height/2, width);
  cuboLDM(terra[n]);
  popMatrix();

  pushMatrix();
  fill(0, 150, 0);
  noStroke();
  translate(1800, height/2+175, 0);
  pushMatrix();
  translate(0, -201, 0);
  rectanguloComMalha(450, width, 10, terra[n]);
  popMatrix();
  rotateX(-PI);
  scale(450, height/2, width);
  cuboLDM(terra[n]);
  popMatrix();

  //Plano do Rio---------------------------------------------------------------------
  pushMatrix();
  push();
  fill(0, 150, 150,120);
  tint(0,150,150,120);
  specular(255);
  shininess(100);
  noStroke();
  translate(width/2, height/2-200, 0);
  desenharAgua(rio[n]);
  pop();
  popMatrix();

  //Estrada-------------------------------------------------------------------------
  pushMatrix();
  fill(100);
  translate(1800, height/2-28, 0);
  rotateX(-PI);
  scale(450, 1, 200);
  cuboLDM(estrada[n]);
  popMatrix();
  pushMatrix();
  tint(255);
  translate(0, height/2-28, 0);
  rotateX(-PI);
  scale(450, 1, 200);
  cuboLDM(estrada[n]);
  popMatrix();
}

//Interações-----------------------------------------------------------------------
void keyPressed() {
  if (keyCode==DOWN) {
    desce+=1;
    cancelaaberta=true;
  }
  if (keyCode==UP) {
    desce=-0.5;
    cancelaaberta=false;
  }
  if (key== ' ') {
    noite=!noite;
  }
  //Camara--------------------------
  if (key=='a' || key=='A') {
    ang--;
  } else if (key=='d' || key=='D') {
    ang++;
  } else if (key=='w' || key=='W') {
    cam-=100;
  } else if (key=='s' || key=='S') {
    cam+=100;
  }
  //Texturas----------------------------------------------------------------------------
  if (key=='t' || key=='T') {
    n=int(random(0, 3.5));
  }
}

//Cubo-------------------------------------------------------------------------------
void cuboLDM (PImage texture) {
  beginShape(QUADS);
  texture(texture);
  //Front---------------------
  normal(0, 1, 0);
  vertex(-0.5, 0.5, 0.5, 0, 1);
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(0.5, 0.5, -0.5, 1, 0);
  vertex(-0.5, 0.5, -0.5, 0, 0);
  //Bottom--------------------
  normal(0, 0, -1);
  vertex(-0.5, -0.5, -0.5, 0, 0);
  vertex(-0.5, 0.5, -0.5, 0, 1);
  vertex(0.5, 0.5, -0.5, 1, 1);
  vertex(0.5, - 0.5, -0.5, 1, 0);
  //Back------------------------
  normal(0, -1, 0);
  vertex(-0.5, -0.5, 0.5, 0, 1);
  vertex(0.5, -0.5, 0.5, 1, 1);
  vertex(0.5, -0.5, -0.5, 1, 0);
  vertex(-0.5, -0.5, -0.5, 0, 0);
  //Top-------------------------
  normal(0, 0, 1);
  vertex(-0.5, -0.5, 0.5, 0, 0);
  vertex(-0.5, 0.5, 0.5, 0, 1);
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(0.5, -0.5, 0.5, 1, 0);
  //Left-----------------------
  normal(-1, 0, 0);
  vertex(-0.5, -0.5, 0.5, 0, 1);
  vertex(-0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, -0.5, 1, 0);
  vertex(-0.5, -0.5, -0.5, 0, 0);
  //Right---------------------
  normal(1, 0, 0);
  vertex(0.5, -0.5, 0.5, 0, 1);
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(0.5, 0.5, -0.5, 1, 0);
  vertex(0.5, -0.5, -0.5, 0, 0);
  endShape(CLOSE);
}

//Cordas-----------------------------------------------------------------------------
void canosDeSuporte(int x, int y, int z, int d, float alt1, int larg) {
  float alt=-alt1;
  beginShape();
  for ( int i=0; i<20; i++) {
    vertex(x-larg/2+cos(2*PI/20*i)*d, y-alt/2, z+sin(2*PI/20*i)*d);
  }
  endShape(CLOSE);
  beginShape();
  for ( int i=0; i<20; i++) {
    vertex(x+larg/2, y+cos(2*PI/20*i)*d+alt/2, z+sin(2*PI/20*i)*d);
  }
  endShape(CLOSE);
  for ( int i=0; i<20; i++) {
    beginShape();
    if (larg>0) {
      vertex(x-larg/2+cos(2*PI/20*i)*d, y-alt/2, z+sin(2*PI/20*i)*d);
      vertex(x-larg/2+cos(2*PI/20*(i+1))*d, y-alt/2, z+sin(2*PI/20*(i+1))*d);
      vertex(x+larg/2, y+cos(2*PI/20*(i+1))*d+alt/2, z+sin(2*PI/20*(i+1))*d);
      vertex(x+larg/2, y+cos(2*PI/20*i)*d+alt/2, z+sin(2*PI/20*i)*d);
    } else {
      vertex(x-larg/2+cos(2*PI/20*(30-i))*d, y-alt/2, z+sin(2*PI/20*(30-i))*d);
      vertex(x-larg/2+cos(2*PI/20*(29-i))*d, y-alt/2, z+sin(2*PI/20*(29-i))*d);
      vertex(x+larg/2, y+cos(2*PI/20*(i+1))*d+alt/2, z+sin(2*PI/20*(i+1))*d);
      vertex(x+larg/2, y+cos(2*PI/20*(i))*d+alt/2, z+sin(2*PI/20*(i))*d);
    }
    endShape(CLOSE);
  }
}

//Cilindros--------------------------------------------------------------------------
void drawCylinder(float radius, float alt) {
  int sides = 30; // Número de lados do cilindro
  float angleIncrement = TWO_PI / sides;
  // Desenhar os lados do cilindro
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= sides; i++) {
    float x = cos(i * angleIncrement) * radius;
    float z = sin(i * angleIncrement) * radius;
    vertex(x, -alt/2, z);
    vertex(x, alt/2, z);
  }
  endShape();
  // Desenhar as bases do cilindro
  beginShape(TRIANGLE_FAN);
  vertex(0, -alt/2, 0);
  for (int i = 0; i <= sides; i++) {
    float x = cos(i * angleIncrement) * radius;
    float z = sin(i * angleIncrement) * radius;
    vertex(x, -alt/2, z);
  }
  endShape();
  beginShape(TRIANGLE_FAN);
  vertex(0, alt/2, 0);
  for (int i = 0; i <= sides; i++) {
    float x = cos(i * angleIncrement) * radius;
    float z = sin(i * angleIncrement) * radius;
    vertex(x, alt/2, z);
  }
  endShape();
}

//Malha Poligonal--------------------------------------------------------------------
void rectanguloComMalha(float w, float h, float res, PImage textura) {
  pushMatrix();
  rotateX(-PI/2);
  translate(-w/2, -h/2, 0);
  float s, t, s2, t2;
  beginShape(QUADS);
  texture(textura);
  for (int i = 0; i < res; i++) { // para cada linha (x)
    for (int j = 0; j < res; j++) { // para cada coluna (y)
      s=i/res;
      t=j/res;
      s2=(i+1)/res;
      t2=(j+1)/res;
      vertex(i/res*w, j/res*h, 0, s, t);
      vertex(i/res*w, (j+1)/res*h, 0, s, t2);
      vertex((i+1)/res*w, (j+1)/res*h, s2, t2);
      vertex((i+1)/res*w, j/res*h, 0, s2, t);
    }
  }
  endShape(CLOSE);
  popMatrix();
}

//Esfera----------------------------------------------------------------------------------------
void esfera(float r) {
  for (int i=0; i<total+1; i++) {
    float lat=map(i, 0, total, 0, PI);
    for (int j=0; j<total+1; j++) {
      float lon=map(j, 0, total,0, TWO_PI);
      float x= r* sin(lat)*cos(lon);
      float y= r*sin(lat)*sin(lon);
      float z=r* cos(lat);
      globe[i][j]= new PVector(x, y, z);
    }
  }
  for (int i=0; i<total; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j=0; j<total+1; j++) {
      PVector v1= globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2= globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}

//Malha da água-----------------------------------
void desenharAgua(PImage textura) {
  flying -= 0.01;
  float yoff = flying;
  for (int y = 0; y < row; y++) {
    float xoff = 0;
    for (int x = 0; x < col; x++) {
      river[x][y] = map(noise(xoff, yoff), 0, 1, -80, 80);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  translate(0, height/2 + 50, 15);
  rotateX(PI / 2);
  translate(-w/2, -h/2);

  for (int y = 0; y < row-1; y++) {
    beginShape(TRIANGLE_STRIP);
    texture(textura);
    for (int x = 0; x < col; x++) {
      float u = map(x, 0, col-1, 0, 1);
      float v0 = map(y, 0, row-1, 0, 1);
      float v1 = map(y+1, 0, row-1, 0, 1);
      vertex(x * scale, y * scale, river[x][y], u, v0);
      vertex(x * scale, (y + 1) * scale, river[x][y+1], u, v1);
    }
    endShape();
  }
}
