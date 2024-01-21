List<String> calcularArcanosNumerologicos(String numeros) {
  List<String> arcanos = [];

  for (int i = 0; i < numeros.length - 1; i++) {
    String arcano = numeros.substring(i, i + 2);
    arcanos.add(arcano);
  }

  return arcanos;
}


