mixin ValidatorTextField {
  double? validateAndConvert(String text) {
    // Substitui vírgula por ponto para garantir a compatibilidade com o formato double
    String cleanedText = text.replaceAll(',', '.');
    
    // Verifica se o campo está vazio
    if (cleanedText.isEmpty) {
      return null;  // Retorna null se o campo estiver vazio
    }

    // Tenta converter o texto limpo para double
    final double? convertedValue = double.tryParse(cleanedText);

    // Se a conversão falhar, retorna null
    if (convertedValue == null) {
      return null;
    }

    return convertedValue;  // Retorna o valor convertido
  }
}