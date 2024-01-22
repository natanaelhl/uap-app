void main() {
  String dataNascimento = '1960-11-01';

  String listaNumerica = '17474131361315473';
  List<double> listaArcanosFases = [
    17, 5.625, 74, 11.25, 47, 16.875, 74, 22.5, 41, 28.125, 13, 33.75,
    31, 39.375, 13, 45.0, 36, 50.625, 61, 56.25, 13, 61.875, 31, 67.5,
    15, 73.125, 54, 78.75, 47, 84.375, 73, 90.0
  ];

  int idade = calcularIdade(dataNascimento);
  double faseAtual = calcularFaseAtual(idade, listaArcanosFases);
  int arcanoAtual = encontrarArcanoMaisProximo(faseAtual, listaArcanosFases);

  // print('Idade: $idade anos');
  // print('Fase Atual: $faseAtual');
  // print('Arcano Atual: $arcanoAtual');
}

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
