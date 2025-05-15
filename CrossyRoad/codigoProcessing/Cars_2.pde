class cars2 {
  float pontaX1;
  float pontaY1;
  float comp;
  float alt;
  color cor;
  float carvel;
  cars2(float pontaX1, float pontaY1, float comp, float alt, color cor, float carvel) {
    this.pontaX1=pontaX1;
    this.pontaY1=pontaY1;
    this.comp=comp;
    this.alt=alt;
    this.cor=cor;
    this.carvel=carvel;
  }
  void desenha() {
   if(nivel==2){
   image(car,pontaX1,pontaY1,comp,alt);
   } else if(nivel==3){
  image(redcar,pontaX1,pontaY1,comp,alt);
   } 
  }
  void move() {
    pontaX1=pontaX1-vel;
    if (pontaX1+comp/2<=0) {
      pontaX1=width-comp/2;
    }
  }
  boolean collide() {
    if (x>pontaX1-comp/2 && x< pontaX1+comp/2 && y>pontaY1-alt/2 && y< pontaY1+alt/2) {
      return true;
    } else {
      return false;
    }
  }
}
