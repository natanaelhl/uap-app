Map<String, double> processarLista(double valorDouble, List<String> listaNumeros) {

  double acumulador = 0.0;
  Map<String, double> resultado = {};

  List<dynamic> arcanosTable = [];

  for (String numero in listaNumeros) {
    acumulador += valorDouble;
    arcanosTable.add(numero);
    arcanosTable.add(acumulador);
  }

  print(arcanosTable);
  return resultado;
}


