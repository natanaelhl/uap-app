import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('3 tabela arcanos ...', (tester) async {
    Map<String, double> processarLista(double valorDouble, List<String> listaNumeros) {

  double acumulador = 0.0;
  Map<String, double> resultado = {};

  for (String numero in listaNumeros) {
    acumulador += valorDouble;
    resultado[numero] = acumulador;
  }


  return resultado;
}

  });
}