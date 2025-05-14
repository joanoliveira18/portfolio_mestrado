Button b1, b2, b3, b4, b5, b6, b7;
cars [] arraycars= new cars[8];
cars2 [] arraycars2= new cars2[4];
cars [] arraycars3= new cars[4];
cars [] arraycars4= new cars[4];
upperlogs [] arrayupperlogs= new upperlogs[8];
upperlogs [] arrayupperlogs1= new upperlogs[8];
lowerlogs [] arraylowerlogs= new lowerlogs[8];
coins [] arraycoins1= new coins[20];
coins [] arraycoins2= new coins[20];
coins [] arraycoins3= new coins [20];
//Variáveis
float x, y, r=20, r1=10, pX, pY, pX1, pY1, pX2, pY2, pX3, pY3, comp, alt, cX, cY, cX1, cY1, cX2, cY2, time=61;
int a, b, c, d, vel=2, life=3, points=0, nivel=1;
boolean morte=false;
boolean inlog=false;
boolean inlogup=false;
boolean menuinicial=true;
boolean choosecharacter=false;
boolean p1=false;
boolean p2=false;
boolean startgame=false;
boolean gameoverscreen=false;
boolean issueskill=false;
boolean youWin=false;
//Imagens
//Personagens e Moedas
PImage c1;
PImage c2;
PImage coin;
//Obstáculos
PImage log;
PImage floatie;
PImage lilypad;
PImage car;
PImage redcar;
PImage yellowcar;
//Fundos
PImage crossyroad;
PImage lvl1;
PImage lvl2;
PImage lvl3;
PImage gameover;
PImage skillissue;
PImage choosecharacter1;
PImage win;
//Código
void setup() {
  size(1600, 800);
  //Valores de variáveis
  x=width/2;
  y=height-height/16;
  pX=0;
  pY=height-(height/8)-height/16;
  pX1=100;
  pY1= height-2*(height/8)-height/16;
  pX2=0;
  pY2=height-(height/8)-height/16;
  pX3=0;
  pY3=height/2+height/16;
  comp=width/16;
  alt= height/16;
  cX=0;
  cY= height/8+(height/35);
  cX1=100;
  cY1=(height/8)*2+height/35;
  cX2=0;
  cY2=(height/8)*3+height/35;
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  b1= new Button(width/3, height-(height/8)-height/16, 200, 75, color(186, 137, 255));
  b4= new Button(width/4, height/2, 200, 250, color(186, 137, 255));
  b5= new Button(width-width/4, height/2, 200, 250, color(186, 137, 255));
  b2= new Button(width-width/6, height/2-height/8, 250, 100, color(0));
  b3= new Button(width-width/6, height/2+height/8, 250, 100, color(0));
  b6= new Button(width-75, 25, 150, 55, color(0));
  b7=new Button(width-width/3, height-(height/8)-height/16, 200, 75, color(186, 137, 255));
  //Carros
  for (int i=0; i<arraycars.length; i++) {
    arraycars [i]= new cars(pX, pY, comp, alt, color(random(255), random(255), random(255)), vel);
    pX+=200;
  }
  for (int i=0; i<arraycars2.length; i++) {
    arraycars2 [i]= new cars2(pX1, pY1, comp, alt, color(random(255), random(255), random(255)), vel);
    pX1+=400;
  }
  for (int i=0; i<arraycars3.length; i++) {
    arraycars3[i]= new cars(pX2, pY2, comp, alt, color(random(255), random(255), random(255)), vel);
    pX2+=400;
  }
  for (int i=0; i<arraycars4.length; i++) {
    arraycars4[i]= new cars(pX3, pY3, comp, alt, color(random(255), random(255), random(255)), vel);
    pX3+=400;
  }
  //Logs/Boias/Lilypads
  for (int i=0; i<arrayupperlogs.length; i++) {
    arrayupperlogs [i]= new upperlogs(cX, cY, comp, alt, color(133, 70, 3), vel);
    cX+=200;
  }
  for (int i=0; i<arrayupperlogs1.length; i++) {
    arrayupperlogs1[i]= new upperlogs(cX2, cY2, comp, alt, color(133, 70, 3), vel);
    cX2+=200;
  }
  for (int i=0; i<arraylowerlogs.length; i++) {
    arraylowerlogs [i]= new lowerlogs(cX1, cY1, comp, alt, color(133, 70, 3), vel);
    cX1+=200;
  }
  // moedas
  for (int i=0; i<arraycoins1.length; i++) {
    arraycoins1[i]= new coins((round(random(1, 15)))*width/16, (round(random(2, 7)))*height/8-height/16, r1, color(255, 250, 0));
  }
   for (int i=0; i<arraycoins2.length; i++) {
    arraycoins2[i]= new coins((round(random(1, 15)))*width/16, (round(random(2, 7)))*height/8-height/16, r1, color(255, 250, 0));
  }
   for (int i=0; i<arraycoins3.length; i++) {
    arraycoins3[i]= new coins((round(random(1, 15)))*width/16, (round(random(2, 7)))*height/8-height/16, r1, color(255, 250, 0));
  }
  //Imagens
  crossyroad= loadImage("crossyroad.jpg");
  lvl1= loadImage("lvl1.jpg");
  lvl2=loadImage("lvl2.jpg");
  lvl3=loadImage("lvl3.jpg");
  gameover=loadImage("gameover.jpg");
  skillissue= loadImage("skillissue.jpg");
  log= loadImage("log.png");
  floatie= loadImage("floatie.png");
  lilypad=loadImage("lilypad.png");
  car=loadImage("car.png");
  redcar=loadImage("redcar.png");
  yellowcar=loadImage("yellowcar.png");
  coin=loadImage("coin.png");
  choosecharacter1=loadImage("choosecharacter.png");
  win=loadImage("win.png");
}
void draw() {
  println(life);
  //println(points);
  // println(time);
  if (menuinicial==true) {
    image(crossyroad, width/2, height/2);
    b1.desenha();
    begin();
  }
  if (startgame==true) {
    if (nivel==1) {
      image(lvl1, width/2, height/2);
      for (int i=0; i<arraycars.length; i++) {
        arraycars[i].desenha();
        arraycars[i].move();
      }
      for (int i=0; i<arraycars.length; i++) {
        if (arraycars[i].collide()==true) {
          life=life-1;
          y=height-height/16;
          x=width/2;
        }
      }
      for (int i=0; i<arraycoins1.length; i++) {
        arraycoins1[i].desenha();
      }
    }
    if (nivel==2) {
      image(lvl2, width/2, height/2);
      for (int i=0; i<arraycars2.length; i++) {
        arraycars2[i].desenha();
        arraycars2[i].move();
      }
      for (int i=0; i<arraycars2.length; i++) {
        if (arraycars2[i].collide()==true) {
          life=life-1;
          y=height-height/16;
          x=width/2;
        }
      }
      for (int i=0; i<arraycars3.length; i++) {
        arraycars3[i].desenha();
        arraycars3[i].move();
      }
      for (int i=0; i<arraycars3.length; i++) {
        if (arraycars3[i].collide()==true) {
          life=life-1;
          y=height-height/16;
          x=width/2;
        }
      }
    }
    if (nivel==3) {
      image(lvl3, width/2, height/2);
      for (int i=0; i<arraycars2.length; i++) {
        arraycars2[i].desenha();
        arraycars2[i].move();
      }
      for (int i=0; i<arraycars2.length; i++) {
        if (arraycars2[i].collide()==true) {
          life=life-1;
          y=height-height/16;
          x=width/2;
        }
      }
      for (int i=0; i<arraycars3.length; i++) {
        arraycars3[i].desenha();
        arraycars3[i].move();
      }
      for (int i=0; i<arraycars3.length; i++) {
        if (arraycars3[i].collide()==true) {
          life=life-1;
          y=height-height/16;
          x=width/2;
        }
      }
      for (int i=0; i<arraycars4.length; i++) {
        arraycars4[i].desenha();
        arraycars4[i].move();
      }
      for (int i=0; i<arraycars3.length; i++) {
        if (arraycars4[i].collide()==true) {
          life=life-1;
          y=height-height/16;
          x=width/2;
        }
      }
    }
    //Troncos
    for (int i=0; i<arrayupperlogs.length; i++) {
      arrayupperlogs[i].desenha();
      arrayupperlogs[i].move();
    }
    for (int i=0; i<arraylowerlogs.length; i++) {
      arraylowerlogs[i].desenha();
      arraylowerlogs[i].move();
    }
    for (int i=0; i<arrayupperlogs1.length; i++) {
      arrayupperlogs1 [i].desenha();
      arrayupperlogs1[i].move();
    }
    if (y>(height/8)*3 && y<(height/2)) {
      for (int i=0; i<arrayupperlogs1.length; i++) {
        if (arrayupperlogs1[i].collide()) {
          inlogup=true;
          d=i;
        }
      }
      if (arrayupperlogs1[d].collide()==false) {
        inlogup=false;
      }
      if (inlogup) {
        x+=vel;
      } else {
        x=width/2;
        y=height-height/16;
        life=life-1;
      }
    }
    if (y> (height/8)*2 && y<(height/8)*3) {
      for (int i=0; i<arraylowerlogs.length; i++) {
        if (arraylowerlogs[i].collide()) {
          inlog=true;
          a=i;
        }
      }
      if (arraylowerlogs[a].collide()==false) {
        inlog=false;
      }
      if (inlog) {
        x=x-vel;
      } else {
        x=width/2;
        y=width-width/16;
        life=life-1;
      }
    }
    if (y>height/8 && y<(height/8)*2) {
      for (int i=0; i<arrayupperlogs.length; i++) {
        if (arrayupperlogs[i].collide()) {
          inlogup=true;
          b=i;
        }
      }
      if (arrayupperlogs[b].collide()==false) {
        inlogup=false;
      }
      if (inlogup) {
        x+=vel;
      } else {
        x=width/2;
        y=width-width/16;
        life=life-1;
      }
    }
    //moedas
    if (nivel==1) {
      for (int i=0; i<arraycoins1.length; i++) {
        arraycoins1[i].desenha();
      }
    } else if (nivel==2) {
      for (int i=0; i<arraycoins2.length; i++) {
        arraycoins2[i].desenha();
      }
    } else if (nivel==3) {
      for (int i=0; i<arraycoins1.length; i++) {
        arraycoins3[i].desenha();
      }
    }
    fill(255);
    textSize(30);
    image(coin, width-width/16, height/16-10);
    text(+points, width-width/22, height/16);
    //personagens
    if (p1==true) {
      image(c1, x, y, 2*r, 2*r);
    } else if (p2==true) {
      p1=false;
      image(c2, x, y, 2*r, 2*r);
    }
    character();
    time();
  }
  if (y==height/16) {
    x=width/2;
    y=height-height/16;
    if (nivel==1) {
      nivel=2;
      time=90;
      life=3;
    } else if (nivel==2) {
      nivel=3;
      time=121;
      life=3;
    } else if (nivel==3) {
      nivel=4;
    }
    youWin=true;
  }
  if (life==0) {
    gameoverscreen=true;
    startgame=false;
  }
  if (youWin==true) {
    image(win, width/2, height/2);
    if (nivel<4) {
      textSize(50);
      b7.desenha();
      fill(0);
      text("NEXT", width-width/3, height-(height/8)-75/2);
    }
  }
  if (choosecharacter==true) {
    image(choosecharacter1, width/2, height/2);
    texto();
    c1=loadImage("piglet.png");
    c2=loadImage("froggo.png");
    b4.desenha();
    b5.desenha();
    image(c1, width/4, height/2, 120, 120);
    image(c2, width-width/4, height/2, 120, 120);
  }
  if (gameoverscreen==true) {
    image(gameover, width/2, height/2, width, height);
    b2.desenha();
    b3.desenha();
    texto1();
  }
  if (issueskill==true) {
    background(0);
    image(skillissue, width/2, height/2, width/2, height);
    b6.desenha();
    fill(255);
    text("Back", width-90, 40);
  }
}
void mousePressed() {
  if (menuinicial==true) {
    if (b1.mouseOver()==true) {
      choosecharacter=true;
      menuinicial=false;
    }
  }
if (choosecharacter==true) {
    if (b4.mouseOver()==true) {
      choosecharacter=false;
      youWin=false;
      startgame=true;
      p1=true;
      p2=false;
      x=width/2;
      y=height-height/16;
    } else if (b5.mouseOver()==true) {
      if(points>=20){
      choosecharacter=false;
      youWin=false;
      startgame=true;
      p1=false;
      p2=true;
      x=width/2;
      y=height-height/16;
      points=points-20;
      }
    }
  }
  if (gameoverscreen==true) {
    if (b3.mouseOver()==true) {
      gameoverscreen=false;
      issueskill=true;
    } else if (b2.mouseOver()==true) {
      time=60;
      life=3;
      gameoverscreen=false;
      startgame=true;
     x=width/2;
     y=height-height/16;
    }
  }
  if (issueskill==true) {
    if (b6.mouseOver()==true) {
      issueskill=false;
      gameoverscreen=true;
    }
  }
  if (youWin==true) {
    if (nivel<4) {
      if (b7.mouseOver()==true) {
        choosecharacter=true;
        youWin=false;
      }
    }
  }
}
void keyPressed() {
  if (key=='w') {
    y= y-height/8;
  }
  if (key=='d') {
    x+=width/16;
  }
  if (key=='a') {
    x=x-width/16;
  }
  if (key=='s') {
    y+=height/8;
  }
}
void character() {
  if (x<r) {
    x=width/16;
  } else if (x>width-r) {
    x=width-width/16;
  } else if (y> height) {
    y=height-height/16;
  } else if (y<0) {
    y=height/16;
  }
}
void time() {
  textSize(50);
  fill(255);
  text("Time="+int(time), width/16, height-height/16);
  time=time-0.01;
  if (time<=0) {
    gameoverscreen=true;
  }
}
void begin() {
  textSize(60);
  fill(0);
  text("START", width/3, height-(height/8)-height/20);
}
void texto() {
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text("piggy", width/4, height/2+175);
  text("froggy", width-width/4, height/2+175);
  image(coin, width-width/4+30,height/2+215);
  textSize(40);
  text("20",width-width/4,height/2+225);
}
void texto1() {
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("PLAY AGAIN", width-width/6, height/2-height/8+10);
  text("GIVE UP", width-width/6, height/2+height/8+10);
}
