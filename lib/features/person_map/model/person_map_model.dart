class PersonMapModel {
  final String name;
  final String dataNasc;
  final int arcanoAtual;
  List<int> listNumbers;
  final double faseAtual;
  final int indiceResultante1;
  final int indiceResultante2;
  final List<List<int>> trianglelist;

  PersonMapModel(
      {required this.name,
      required this.dataNasc,
      required this.arcanoAtual,
      required this.listNumbers,
      required this.faseAtual,
      required this.indiceResultante1,
      required this.indiceResultante2,
      required this.trianglelist});
}
