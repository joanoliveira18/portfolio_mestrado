var tam;
function atualizarVariavelComTamanhoDaTela() {
  var larguraDaTela = window.innerWidth;

  if (larguraDaTela < 768) {
    tam = 0;
  } else if (larguraDaTela < 1040) {
    tam = 2;
  } else {
    tam = 3;
  }
}
//array de imagens
var imagens = [];

var caminhos = ['Imagens/glaad.png', 'Imagens/glsen.png', 'Imagens/humanrights.png', 'Imagens/lambda.png', 'Imagens/ncte.png','Imagens/pflag.png'];

for (var i = 0; i < caminhos.length; i++) {
    var imagem = new Image();
    imagem.src = caminhos[i];
    imagens.push(imagem);
}
//array com verções mais pequenas das imagens
var imagens2 = [];

var caminhos2 = ['Imagens/glaadpikeno.png', 'Imagens/glsenpikeno.png', 'Imagens/humanrightspikeno.png', 'Imagens/lambdapikeno.png', 'Imagens/tctepikeno.png','Imagens/pflagpikeno.png'];

for (var i = 0; i < caminhos2.length; i++) {
    var imagem2 = new Image();
    imagem2.src = caminhos2[i];
    imagens2.push(imagem2);
}


var numero = 0;

var setaesquerda = document.getElementById("esquerda");
var setadireita = document.getElementById("direita");

setaesquerda.addEventListener("click", function() {
  if (numero > 0) {
    numero--;
    atualizarImagens();
  }
});

setadireita.addEventListener("click", function() {
  if (numero+tam < imagens.length) {
    numero++;
    atualizarImagens();
  }
});

var imgOne = document.getElementById("um");
var imgTwo = document.getElementById("dois");
var imgThree = document.getElementById("tres");


function atualizarImagens() {
  if(window.innerWidth>=500){
  imgOne.src = imagens[numero].src;
  imgTwo.src = imagens[numero + 1].src;
  imgThree.src = imagens[numero + 2].src;
  }else{
    imgOne.src = imagens2[numero].src;
    imgTwo.src = imagens2[numero + 1].src;
    imgThree.src = imagens2[numero + 2].src;
  }
}

// Inicializar as imagens no carrossel
atualizarImagens();
atualizarVariavelComTamanhoDaTela();



