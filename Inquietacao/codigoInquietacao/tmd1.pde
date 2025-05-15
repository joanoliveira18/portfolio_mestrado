import processing.sound.*;
AudioIn som;
Amplitude amp;
PImage fonte, inq, ui, eta, cao;
int i=0;
int count=0;
float x, y, x1, y1, x2, y2, x3, y3, x4, y4, w, h, w1, w2, w3, w4;
color amarelo= color(227, 224, 53);
int[] letras;
int [] letras1;
int [] letras2;
int [] letras3;
int [] letras4;
void setup() {
  size(360, 640);
  imageMode(CENTER);
  frameRate(20);
  som=new AudioIn(this, 0);
  som.start();
  amp= new Amplitude(this);
  amp.input(som);
  fonte= loadImage("inquietacao.png");
  inq= loadImage("inq.png");
  ui=loadImage("ui.png");
  eta= loadImage("eta.png");
  cao= loadImage("cao.png");
  fonte.loadPixels();
  inq.loadPixels();
  ui.loadPixels();
  eta.loadPixels();
  cao.loadPixels();
  letras= new int[fonte.pixels.length];
  letras1= new int[inq.pixels.length];
  letras2= new int[ui.pixels.length];
  letras3= new int[eta.pixels.length];
  letras4= new int[cao.pixels.length];
  for (int i=0; i<fonte.pixels.length; i++) {
    if (color(fonte.pixels[i])>color(5)) {
      letras[i]=1;
    } else {
      letras[i]=0;
    }
  }
  for (int i=0; i<inq.pixels.length; i++) {
    if (color(inq.pixels[i])>color(5)) {
      letras1[i]=1;
    } else {
      letras1[i]=0;
    }
  }
  for (int i=0; i<ui.pixels.length; i++) {
    if (color(ui.pixels[i])>color(5)) {
      letras2[i]=1;
    } else {
      letras2[i]=0;
    }
  }
  for (int i=0; i<eta.pixels.length; i++) {
    if (color(eta.pixels[i])>color(5)) {
      letras3[i]=1;
    } else {
      letras3[i]=0;
    }
  }
  for (int i=0; i<cao.pixels.length; i++) {
    if (color(cao.pixels[i])>color(5)) {
      letras4[i]=1;
    } else {
      letras4[i]=0;
    }
  }
  w=197;
  h=45.5;
  w1=72.6;
  w2=31.3;
  w3=44.5;
  w4=49;
}
void draw() {
  float a= amp.analyze();
  float maxdistX= map(mouseY, 0, height, width/2-w1/8, w1/2);
  float maxdistY=map(mouseY, 0, height, height/2-h/8, h/2);
  count=count+1;
  background(0);
  for (int i=0; i<fonte.pixels.length; i++) {
    if (letras[i]==1) {
      fonte.pixels[i]=color(amarelo);
    } else {
      fonte.pixels[i]=color(0);
    }
  }
  for (int i=0; i<inq.pixels.length; i++) {
    if (letras1[i]==1) {
      inq.pixels[i]=color(amarelo);
    } else {
      inq.pixels[i]=color(0);
    }
  }
  for (int i=0; i<ui.pixels.length; i++) {
    if (letras2[i]==1) {
      ui.pixels[i]=color(amarelo);
    } else {
      ui.pixels[i]=color(0);
    }
  }
  for (int i=0; i<eta.pixels.length; i++) {
    if (letras3[i]==1) {
      eta.pixels[i]=color(amarelo);
    } else {
      eta.pixels[i]=color(0);
    }
  }
  for (int i=0; i<cao.pixels.length; i++) {
    if (letras4[i]==1) {
      cao.pixels[i]=color(amarelo);
    } else {
      cao.pixels[i]=color(0);
    }
  }
  if (count>105 && count < 110) {
    background(amarelo);
    for (int i=0; i<fonte.pixels.length; i++) {
      if (letras[i]==1) {
        fonte.pixels[i]=color(0);
      } else {
        fonte.pixels[i]=color(amarelo);
      }
    }
    for (int i=0; i<inq.pixels.length; i++) {
      if (letras1[i]==1) {
        inq.pixels[i]=color(0);
      } else {
        inq.pixels[i]=color(amarelo);
      }
    }
    for (int i=0; i<ui.pixels.length; i++) {
      if (letras2[i]==1) {
        ui.pixels[i]=color(0);
      } else {
        ui.pixels[i]=color(amarelo);
      }
    }
    for (int i=0; i<ui.pixels.length; i++) {
      if (letras3[i]==1) {
        eta.pixels[i]=color(0);
      } else {
        eta.pixels[i]=color(amarelo);
      }
    }
    for (int i=0; i<cao.pixels.length; i++) {
      if (letras4[i]==1) {
        cao.pixels[i]=color(0);
      } else {
        cao.pixels[i]=color(amarelo);
      }
    }
    if (count==109) {
      count=0;
    }
  }
  if (a>0.1) {
    float red= map(a, 0, 1, 227, 255);
    amarelo=color(red, 0, 0);
  } else {
    amarelo= color(227, 224, 53);
  }
  fonte.updatePixels();
  inq.updatePixels();
  ui.updatePixels();
  eta.updatePixels();
  cao.updatePixels();
  x=random(width/2-w/10, width/2+w/10);
  y=random(height/2-h/10, height/2+h/10);
  x1=random(maxdistX, width-maxdistX);
  y1=random(maxdistY, height-maxdistY);
  x2=random(maxdistX, width-maxdistX);
  y2=random(maxdistY, height-maxdistY);
  x3=random(maxdistX, width-maxdistX);
  y3=random(maxdistY, height-maxdistY);
  x4=random(maxdistX, width-maxdistX);
  y4=random(maxdistY, height-maxdistY);
  if (mouseY<120) {
    image(fonte, x, y, w, h);
  } else {
    image(inq, x1, y1, w1, h);
    image(ui, x2, y2, w2, h);
    image(eta, x3, y3, w3, h);
    image(cao,x4,y4,w4,h);
  }
}
