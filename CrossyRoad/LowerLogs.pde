class lowerlogs {
  float comp;
  float alt;
  float cantoX1;
  float cantoY1;
  color cor1;
  float vel;
  lowerlogs(float cantoX1, float cantoY1, float comp, float alt, color cor1, float vel) {
    this.comp=comp;
    this.alt=alt;
    this.cantoX1=cantoX1;
    this.cantoY1=cantoY1;
    this.cor1=cor1;
    this.vel=vel;
  }
  void desenha() {
   if(nivel==1){
    image(log, cantoX1+comp/2, cantoY1+alt/2, comp, alt);
   }else if(nivel==2){
     image(floatie,cantoX1+comp/2,cantoY1+alt/2,comp,alt);
   } else if(nivel==3){
   image(lilypad,cantoX1+comp/2,cantoY1+alt/2,comp,alt);
   }
}
  void move() {
    cantoX1=cantoX1-vel;
      if(cantoX1+comp/2<=0){
      cantoX1=width-comp/2;
    }
  }
  float getCantoX1(){
  return cantoX1;
  }
    boolean collide() {
    if (x>cantoX1 && x< cantoX1+comp && y>cantoY1 && y< cantoY1+alt) {
      return true;
    } else {
      return false;
    }
  }
}
