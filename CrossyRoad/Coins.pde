class coins {
  float centroX;
  float centroY;
  float raio1;
  color cor;
  boolean collect;
  coins(float centroX, float centroY, float raio1, color cor) {
    this.centroX=centroX;
    this.centroY=centroY;
    this.raio1=raio1;
    this.cor=cor;
    collect=false;
  }
  void desenha() {
   image(coin,centroX,centroY);
    if(dist(x, y, centroX, centroY)<r+raio1){
    collect=true;
    centroX=5000000;
    points+=1;
    }
  }
  //boolean collect() {
  //  if () {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}
  //void desaparece() {
  //  show=false;
  //}
  //boolean getShow() {
  //  return show;
  //}
}
