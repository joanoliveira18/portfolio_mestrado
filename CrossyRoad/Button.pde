class Button {
  float a, b, larg, alt;
  color cor;
  Button(float a, float b, float larg, float alt,color cor) {
    this.a=a;
    this.b=b;
    this.larg=larg;
    this.alt=alt;
    this.cor=cor;
  }
  void desenha() {
    stroke(255);
    rectMode(CENTER);
    fill(cor);
    rect(a, b, larg, alt);
  }
  boolean mouseOver() {
    if (dist(mouseX, mouseY, a, b)< larg/2) {
      return true;
    } else {
      return false;
    }
  }
}
