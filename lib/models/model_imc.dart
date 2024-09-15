
class ModelImc {
  late double altura;
  late double peso;
 

  ModelImc( this.altura,  this.peso,  );

  double calcularImc(altura, peso){
    final double imc = peso / (altura*altura);
    return imc;
  }

  String  verificarClassificacao(double imc){
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