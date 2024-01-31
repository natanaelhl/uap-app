class Triangle {
  static Map<String, dynamic> reducaoNumerologica(
      List<int> lista, int numberSum) {
    List<int> sumList = processarLista(lista, numberSum);
    List<List<int>> novaLista = [];

    List<int> firstLine = sumList;

    while (sumList.length > 1) {
      List<int> novaSublista = [];
      for (int i = 0; i < sumList.length - 1; i++) {
        int soma = sumList[i] + sumList[i + 1];
        if (soma >= 10) {
          // Se a soma tiver duas casas decimais, reduza-a
          soma = (soma % 10) + (soma ~/ 10);
        }
        novaSublista.add(soma);
      }
      novaLista.add(novaSublista);

      // Atualize sumList com a novaSublista
      sumList = novaSublista;
    }

    return {'head': firstLine, 'body': novaLista};
  }

  static List<int> processarLista(List<int> lista, int valorInteiro) {
    List<int> novaLista = [];

    for (int numero in lista) {
      // Soma o valor da lista com o valor inteiro
      int resultado = numero + valorInteiro;
      print(valorInteiro);
      // Reduz o número para um dígito, se necessário
      while (resultado >= 10) {
        int somaDigitos = 0;
        while (resultado > 0) {
          somaDigitos += resultado % 10;
          resultado ~/= 10;
        }
        resultado = somaDigitos;
      }

      novaLista.add(resultado);
    }

    return novaLista;
  }
}
