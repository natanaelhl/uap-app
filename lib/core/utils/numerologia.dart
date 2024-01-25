class Numerologia {
  static Map<String, dynamic> calcularNumerologia(String fullName, String stringNumerica, String dataNascimento) {
    List<int> listaNumeros = obterListaNumeros(stringNumerica);
    double divisionResult = _calcularDivisao(stringNumerica);
    List<String> arcaneList = _calcularArcanosNumerologicos(stringNumerica);
    List<double> arcaneValueList = _processarLista(divisionResult, arcaneList);

    int idade = _calcularIdade(dataNascimento);
    double faseAtual = _calcularFaseAtual(idade, arcaneValueList);
    int arcanoAtual = _encontrarArcanoMaisProximo(faseAtual, arcaneValueList);

    int indiceResultante1 = _encontrarIndice(listaNumeros, arcaneValueList, faseAtual);
    int indiceResultante2 = indiceResultante1 + 1;

    List<int> listNumers = _stringToList(stringNumerica);

    List<List<int>> triangleList = _generateTriangle(stringNumerica);

    String name = addSpacesToString(fullName);

    Map<String, dynamic> data = {
      'arcanoAtual': arcanoAtual,
      'faseAtual': faseAtual,
      'indiceResultante1': indiceResultante1,
      'indiceResultante2': indiceResultante2,
      'list_numbers': listNumers,
      'triangle_list': triangleList,
      'name': name,
    };

    return data;
  }

  static double _calcularDivisao(String numeros) {
    int comprimento = numeros.length - 1;
    return 90 / comprimento;
  }

  static List<int> _stringToList(String stringNumbers) {
    return stringNumbers.split('').map((e) => int.parse(e)).toList();
  }

  static List<int> obterListaNumeros(String stringNumerica) {
    List<int> digitos = stringNumerica.split('').map((d) => int.parse(d)).toList();
    List<int> arcanos = [];

    for (int i = 0; i < digitos.length - 1; i++) {
      int arcano = int.parse('${digitos[i]}${digitos[i + 1]}');
      arcanos.add(arcano);
    }

    return arcanos;
  }

  static List<String> _calcularArcanosNumerologicos(String numeros) {
    List<String> arcanos = [];

    for (int i = 0; i < numeros.length - 1; i++) {
      String arcano = numeros.substring(i, i + 2);
      arcanos.add(arcano);
    }

    return arcanos;
  }

  static List<double> _processarLista(double valorDouble, List<String> listaNumeros) {
    double acumulador = 0.0;
    List<double> arcanosTable = [];

    for (String numero in listaNumeros) {
      acumulador += valorDouble;
      arcanosTable.add(double.parse(numero));
      arcanosTable.add(acumulador);
    }

    return arcanosTable;
  }

  static int _calcularIdade(String dataNascimento) {
    DateTime dataNasc = DateTime.parse(dataNascimento);
    DateTime agora = DateTime.now();
    Duration diferenca = agora.difference(dataNasc);
    int idade = (diferenca.inDays / 365).floor();
    return idade;
  }

  static double _calcularFaseAtual(int idade, List<double> listaArcanosFases) {
    for (int i = 1; i < listaArcanosFases.length; i += 2) {
      if (idade <= listaArcanosFases[i]) {
        return listaArcanosFases[i];
      }
    }
    return listaArcanosFases.last;
  }

  static int _encontrarArcanoMaisProximo(double faseAtual, List<double> listaArcanosFases) {
    int index = 0;
    double menorDiferenca = (faseAtual - listaArcanosFases[1]).abs();

    for (int i = 3; i < listaArcanosFases.length; i += 2) {
      double diferenca = (faseAtual - listaArcanosFases[i]).abs();
      if (diferenca < menorDiferenca) {
        menorDiferenca = diferenca;
        index = i - 1;
      }
    }

    return listaArcanosFases[index].toInt();
  }

  static int _encontrarIndice(List<int> listaInteiros, List<double> listaDouble, double valorQuebrado) {
    if (listaDouble.contains(valorQuebrado)) {
      int indiceDouble = listaDouble.indexOf(valorQuebrado);
      int indiceInteiro = indiceDouble ~/ 2;
      return indiceInteiro;
    } else {
      return -1;
    }
  }

  static List<List<int>> _generateTriangle(String stringNumbers) {
  List<int> numbers = stringNumbers.split('').map(int.parse).toList();
  List<List<int>> result = [];

  List<int> currentRow = numbers;
  while (currentRow.length > 1) {
    List<int> nextRow = [];
    for (int i = 0; i < currentRow.length - 1; i++) {
      int sum = currentRow[i] + currentRow[i + 1];
      nextRow.add(reduceToSingleDigit(sum));
    }
    result.add(nextRow);
    currentRow = nextRow;
  }

  return result;
}

static int reduceToSingleDigit(int number) {
  while (number >= 10) {
    number = number.toString().split('').map(int.parse).reduce((a, b) => a + b);
  }
  return number;
}

static String addSpacesToString(String input) {
  // Remove todos os espaços
  String noSpaces = input.replaceAll(' ', '');

  // Adiciona três espaços entre cada caractere
  String spacedString = noSpaces.split('').join('   '); // Três espaços

  return spacedString;
}



}

