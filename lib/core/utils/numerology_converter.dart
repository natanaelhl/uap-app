class NumerologyConverter {
  static Map<String, int> letterToNumberMap = {
    'A': 1, 'J': 1, 'S': 1,
    'B': 2, 'K': 2, 'T': 2,
    'C': 3, 'L': 3, 'U': 3,
    'D': 4, 'M': 4, 'V': 4,
    'E': 5, 'N': 5, 'W': 5,
    'F': 6, 'O': 6, 'X': 6,
    'G': 7, 'P': 7, 'Y': 7,
    'H': 8, 'Q': 8, 'Z': 8,
    'I': 9, 'R': 9
  };

  static String convertNameToNumbers(String fullName) {
    String numberString = '';

    for (String letter in fullName.toUpperCase().split('')) {
      if (letterToNumberMap.containsKey(letter)) {
        numberString += letterToNumberMap[letter]!.toString();
      }
    }

    return numberString;
  }
}
