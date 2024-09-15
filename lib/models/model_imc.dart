
class ModelImc {
  late double altura;
  late double peso;
 

  ModelImc( this.altura,  this.peso,  );

  double calcularImc(altura, peso){
    final double imc = peso / (altura*altura);
    return imc;
  }

  String  trocarImage(double imc){
    if(imc < 16){
      return 'assets/images/esqueleto.jpg';
    }
    else if(imc > 16 && imc <17){
      return "assets/images/esqueleto2.jpg";
    }
    else if(imc < 18.5){
      return "assets/images/esqueleto_comendo.jpg";
    }
    else if(imc < 25){
      return "assets/images/saudaver.jpg";
    }
    else if(imc < 30){
      return "assets/images/brocando.png";
    }
    else if(imc < 35){
      return "assets/images/on_beso.jpg";
    }
    else if(imc < 40){
      return "assets/images/paitarolisso.png";
    }
    else if( imc >= 40){
      return "assets/images/barriguitas.png";
    }
    return "assets/images/skaterson.jpg";
  }

  String  varificarClassificacao(double imc){
    if(imc < 16){
      return "Magreza grau 3";
    }
    else if(imc > 16 && imc <17){
      return "Magreza grau 2";
    }
    else if(imc < 18.5){
      return "Magreza grau 1";
    }
    else if(imc < 25){
      return "Eutrofia";
    }
    else if(imc < 30){
      return "Pré-Obesidade";
    }
    else if(imc < 35){
      return "Obesidade moderada(grau 1)";
    }
    else if(imc < 40){
      return "Obesidade severa(grau 2)";
    }
    else if( imc >= 40){
      return "Obesidade muito severa(grau 3)";
    }
    return "Erro ao classificar";
  }
}



    