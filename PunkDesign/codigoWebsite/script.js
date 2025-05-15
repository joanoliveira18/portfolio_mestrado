//array de imagens
var imagens = [];
var caminhos = ["img1.jpg", "img2.jpg", "img3.jpg"];
for (var i = 0; i < caminhos.length; i++) {
  var imagem = new Image();
  imagem.src = caminhos[i];
  imagens.push(imagem);
}

var numero = 0;
var setaesquerda = document.getElementById("setaEsquerda");
var setadireita = document.getElementById("setaDireita");

setaesquerda.addEventListener("click", function () {
  if (numero > 0) {
    numero--;
    atualizarImagens();
  }
});

setadireita.addEventListener("click", function () {
  if (numero < imagens.length) {
    numero++;
    atualizarImagens();
  }
});

var imag = document.getElementById("imagemPr");
function atualizarImagens() {
  imag.src = imagens[numero].src;
}