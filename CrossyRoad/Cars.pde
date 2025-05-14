class cars {
  float pontaX;
  float pontaY;
  float comp;
  float alt;
  color cor;
  float carvel;
  cars(float pontaX, float pontaY, float comp, float alt, color cor, float carvel) {
    this.pontaX=pontaX;
    this.pontaY=pontaY;
    this.comp=comp;
    this.alt=alt;
    this.cor=cor;
    this.carvel=carvel;
  }
  void desenha() {
   if(nivel==1){
    image(car,pontaX,pontaY,comp,alt);
   }else if(nivel==2){
    image(redcar,pontaX,pontaY,comp,alt);
   } else if(nivel==3){
 image(yellowcar,pontaX,pontaY,comp,alt);
   } 
  }
  void move() {
    pontaX+=carvel;
    if (pontaX>=width) {
      pontaX=0;
    }
  }
  boolean collide() {
    if (x>pontaX-comp/2 && x< pontaX+comp/2 && y>pontaY-alt/2 && y< pontaY+alt/2) {
      return true;
    } else {
      return false;
    }
  }
}
