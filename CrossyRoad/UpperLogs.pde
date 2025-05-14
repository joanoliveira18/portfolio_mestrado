class upperlogs {
  float cantoX;
  float cantoY;
  float comp;
  float alt;
  color cor1;
  float vel;
  upperlogs(float cantoX, float cantoY, float comp, float alt, color cor1, float vel) {
    this.cantoX=cantoX;
    this.cantoY=cantoY;
    this.comp=comp;
    this.alt=alt;
    this.cor1=cor1;
    this.vel=vel;
  }
  void desenha() {
     if(nivel==1){
    image(log, cantoX+comp/2, cantoY+alt/2, comp, alt);
   }else if(nivel==2){
     image(floatie,cantoX+comp/2,cantoY+alt/2,comp,alt);
   } else if(nivel==3){
   image(lilypad,cantoX+comp/2,cantoY+alt/2,comp,alt);
   }
  }
  void move() {
    cantoX+=vel;
    if (cantoX+comp/2>=width) {
      cantoX=0-comp/2;
    }
  }
      boolean collide() {
    if (x>cantoX && x< cantoX+comp && y>cantoY && y< cantoY+alt) {
      return true;
    } else {
      return false;
    }
  }
}
