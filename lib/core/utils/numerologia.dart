class Numerologia {
  static Map<String, dynamic> calcularNumerologia(
      String fullName, String stringNumerica, String dataNascimento) {
    final listaNumeros = obterListaNumeros(stringNumerica);
    final divisionResult = _calcularDivisao(stringNumerica);
    final arcaneList = _calcularArcanosNumerologicos(stringNumerica);
    final arcaneValueList = _processarLista(divisionResult, arcaneList);

    final idade = _calcularIdade(dataNascimento);
    final faseAtual = _calcularFaseAtual(idade, arcaneValueList);
    final arcanoAtual = _encontrarArcanoMaisProximo(faseAtual, arcaneValueList);

    final indiceResultante1 = _encontrarIndice(listaNumeros, arcaneValueList, faseAtual);
    final indiceResultante2 = indiceResultante1 + 1;

    final listNumers = _stringToList(stringNumerica);
    final triangleList = _generateTriangle(stringNumerica);
    final name = addSpacesToString(fullName);


    return {
      'arcanoAtual': arcanoAtual,
      'faseAtual': faseAtual,
      'indiceResultante1': indiceResultante1,
      'indiceResultante2': indiceResultante2,
      'list_numbers': listNumers,
      'triangle_list': triangleList,
      'name': name,
      'data_nasc': dataNascimento,
    };
  }

  static double _calcularDivisao(String numeros) {
    final comprimento = numeros.length - 1;
    return 90 / comprimento;
  }

  static List<int> _stringToList(String stringNumbers) =>
      stringNumbers.split('').map((e) => int.parse(e)).toList();

  static List<int> obterListaNumeros(String stringNumerica) {
    final digitos = stringNumerica.split('').map((d) => int.parse(d)).toList();
    final arcanos = <int>[];

    for (int i = 0; i < digitos.length - 1; i++) {
      final arcano = int.parse('${digitos[i]}${digitos[i + 1]}');
      arcanos.add(arcano);
    }

    return arcanos;
  }

  static List<String> _calcularArcanosNumerologicos(String numeros) {
    final arcanos = <String>[];

    for (int i = 0; i < numeros.length - 1; i++) {
      arcanos.add(numeros.substring(i, i + 2));
    }

    return arcanos;
  }

  static List<double> _processarLista(double valorDouble, List<String> listaNumeros) {
    var acumulador = 0.0;
    final arcanosTable = <double>[];

    for (var numero in listaNumeros) {
      acumulador += valorDouble;
      arcanosTable..add(double.parse(numero))..add(acumulador);
    }

    return arcanosTable;
  }

  static int _calcularIdade(String dataNascimento) {
    final dataNasc = DateTime.parse(dataNascimento);
    final agora = DateTime.now();
    final diferenca = agora.difference(dataNasc);
    return (diferenca.inDays / 365).floor();
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
    var index = 0;
    var menorDiferenca = (faseAtual - listaArcanosFases[1]).abs();

    for (int i = 3; i < listaArcanosFases.length; i += 2) {
      final diferenca = (faseAtual - listaArcanosFases[i]).abs();
      if (diferenca < menorDiferenca) {
        menorDiferenca = diferenca;
        index = i - 1;
      }
    }

    return listaArcanosFases[index].toInt();
  }

  static int _encontrarIndice(List<int> listaInteiros, List<double> listaDouble, double valorQuebrado) {
    if (listaDouble.contains(valorQuebrado)) {
      final indiceDouble = listaDouble.indexOf(valorQuebrado);
      return indiceDouble ~/ 2;
    } else {
      return -1;
    }
  }

  static List<List<int>> _generateTriangle(String stringNumbers) {
    final numbers = stringNumbers.split('').map(int.parse).toList();
    final result = <List<int>>[];

    var currentRow = numbers;
    while (currentRow.length > 1) {
      final nextRow = <int>[];
      for (int i = 0; i < currentRow.length - 1; i++) {
        nextRow.add(reduceToSingleDigit(currentRow[i] + currentRow[i + 1]));
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
    
    final noSpaces = input.replaceAll(' ', '');
    return noSpaces;
  }
}
