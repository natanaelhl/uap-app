class DateFormatter {
  static String convertDateFormat(String originalDate) {
    // Divide a string de data original em componentes [dia, mês, ano]
    List<String> parts = originalDate.split('/');
    if (parts.length != 3) {
      throw const FormatException('Formato de data inválido');
    }
    // Reorganiza os componentes para o formato 'aaaa-mm-dd'
    String formattedDate = '${parts[2]}-${parts[1]}-${parts[0]}';
    return formattedDate;
  }
}
