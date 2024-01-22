import 'package:uap_app/2_list_arcanos.dart';
import 'package:uap_app/3_tabela_arcanos.dart';
import 'package:uap_app/widgets/retorna_arcano_widget.dart';

double calcularDivisao(String numeros) {
  // Identificar o comprimento e subtrair 1
  int comprimento = numeros.length - 1;

  // Calcular a divisão de 90 pelo comprimento
  double resultado = 90 / comprimento;

  // Retornar o resultado
  return resultado;
}

void main() {
  String numeros = '17474131361315473';
  double resultado = calcularDivisao(numeros);
  // List<String> arcanos = calcularArcanosNumerologicos(numeros);

  // List<double> arcanosTable = processarLista(resultado, arcanos);
  // print('O resultado da divisão é: $resultado');
  // print('a lista de arcanos é: $arcanos' );
  // print('a tabela de arcanos é $arcanosTable');

  RetornaArcanoWidget.build(numeros, '1960-11-01');
}
