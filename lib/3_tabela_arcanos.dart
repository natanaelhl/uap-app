Map<String, double> processarLista(double valorDouble, List<String> listaNumeros) {

  double acumulador = 0.0;
  Map<String, double> resultado = {};

  for (String numero in listaNumeros) {
    acumulador += valorDouble;
    resultado[numero] = acumulador;
  }

  return resultado;
}


