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


