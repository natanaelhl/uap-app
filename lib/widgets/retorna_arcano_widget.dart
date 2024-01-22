class RetornaArcanoWidget{
  static build(String stringNumers, String dataNascimento) {
    List<int> listaNumeros = arcanosNumericos(stringNumers);
    double divisionResult = calcularDivisao(stringNumers);
    List<String> arcaneList = calcularArcanosNumerologicos(stringNumers);
    List<double> arcaneValueList = processarLista(divisionResult, arcaneList);

    int idade = calcularIdade(dataNascimento);
    double faseAtual = calcularFaseAtual(idade, arcaneValueList);
    int arcanoAtual = encontrarArcanoMaisProximo(faseAtual, arcaneValueList);

    int indiceResultante = encontrarIndice(listaNumeros, arcaneValueList, 33.75);

    print(indiceResultante);    

  }
}

// 1°
double calcularDivisao(String numeros) {
  // Identificar o comprimento e subtrair 1
  int comprimento = numeros.length - 1;

  // Calcular a divisão de 90 pelo comprimento
  double resultado = 90 / comprimento;

  // Retornar o resultado
  return resultado;
}

//1.1
List<int> arcanosNumericos(String stringNumerica) {
  // Converte a string para uma lista de dígitos
  List<int> digitos = stringNumerica.split('').map((d) => int.parse(d)).toList();

  // Inicializa a lista de arcanos numéricos
  List<int> arcanos = [];

  // Gera os arcanos numéricos a partir da lista de dígitos
  for (int i = 0; i < digitos.length - 1; i++) {
    int arcano = int.parse('${digitos[i]}${digitos[i + 1]}');
    arcanos.add(arcano);
  }

  return arcanos;
}


// 2°
List<String> calcularArcanosNumerologicos(String numeros) {
  List<String> arcanos = [];

  for (int i = 0; i < numeros.length - 1; i++) {
    String arcano = numeros.substring(i, i + 2);
    arcanos.add(arcano);
  }

  return arcanos;
}

// 3°
List<double> processarLista(double valorDouble, List<String> listaNumeros) {
  double acumulador = 0.0;
  List<double> arcanosTable = [];

  for (String numero in listaNumeros) {
    acumulador += valorDouble;
    arcanosTable.add(double.parse(numero)); // Convertendo a string para double
    arcanosTable.add(acumulador);
  }

  return arcanosTable;
}


//4° 
int calcularIdade(String dataNascimento) {
  DateTime dataNasc = DateTime.parse(dataNascimento);
  DateTime agora = DateTime.now();
  Duration diferenca = agora.difference(dataNasc);
  int idade = (diferenca.inDays / 365).floor();
  return idade;
}

double calcularFaseAtual(int idade, List<double> listaArcanosFases) {
  for (int i = 1; i < listaArcanosFases.length; i += 2) {
    if (idade <= listaArcanosFases[i]) {
      return listaArcanosFases[i];
    }
  }
  return listaArcanosFases.last; // Se a idade for maior do que qualquer fase, retorna a última fase.
}

int encontrarArcanoMaisProximo(double faseAtual, List<double> listaArcanosFases) {
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

//5° 
int encontrarIndice(List<int> listaInteiros, List<double> listaDouble, double valorQuebrado) {
  // Verifica se o valor quebrado está na listaDouble
  if (listaDouble.contains(valorQuebrado)) {
    // Encontra o índice correspondente na listaDouble
    int indiceDouble = listaDouble.indexOf(valorQuebrado);

    // Calcula o índice na listaInteiros com base no índice na listaDouble
    int indiceInteiro = indiceDouble ~/ 2;

    // Retorna o índice na listaInteiros
    return indiceInteiro;
  } else {
    // Retorna -1 se o valor quebrado não estiver na listaDouble
    return -1;
  }
}

void main() {
  List<int> listaInteiros = [17, 74, 47, 74, 41, 13, 31, 13, 36, 61, 13, 31, 15, 54, 47, 73];
  List<double> listaDouble = [17, 5.625, 74, 11.25, 47, 16.875, 74, 22.5, 41, 28.125, 13, 33.75,
                              31, 39.375, 13, 45.0, 36, 50.625, 61, 56.25, 13, 61.875, 31, 67.5,
                              15, 73.125, 54, 78.75, 47, 84.375, 73, 90.0];
  double valorQuebrado = 90.0;

  int indiceResultante = encontrarIndice(listaInteiros, listaDouble, valorQuebrado);

  if (indiceResultante != -1) {
    print('O índice na lista de inteiros correspondente a $valorQuebrado é $indiceResultante.');
  } else {
    print('O valor quebrado $valorQuebrado não foi encontrado na lista de double.');
  }
}




