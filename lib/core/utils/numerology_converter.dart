class NumerologyConverter {
  static Map<String, int> letterToNumberMap = {
    'a': 1,
    'b': 2,
    'c': 3,
    'd': 4,
    'e': 5,
    'f': 8,
    'g': 3,
    'h': 5,
    'i': 1,
    'j': 1,
    'k': 2,
    'l': 3,
    'm': 4,
    'n': 5,
    'o': 7,
    'p': 8,
    'q': 1,
    'r': 2,
    's': 3,
    't': 4,
    'u': 6,
    'v': 6,
    'w': 6,
    'x': 6,
    'y': 1,
    'z': 7,
  };

  static String convertNameToNumbers(String fullName) {
    String numberString = '';

    for (String letter in fullName.toLowerCase().split('')) {
      if (letterToNumberMap.containsKey(letter)) {
        numberString += letterToNumberMap[letter]!.toString();
      }
    }

    return numberString;
  }

  static int reduceNumberNumerologically(int number) {
    while (number >= 10) {
      number = (number % 10) + (number ~/ 10);
    }
    return number;
  }

  static int updateListWithBirthDateNumerology(String birthDate) {
    int dayOfBirth = int.parse(birthDate.split('-')[2]);

    return dayOfBirth;
  }

  static int extractAndReduceMonth(String birthDateString) {
    DateTime birthDate = DateTime.parse(birthDateString);
    int month = birthDate.month;

    reduceNumberNumerologically(month);

    return reduceNumberNumerologically(month);
  }

  static int calculateNumerology(String birthDateString) {
    DateTime birthDate = DateTime.parse(birthDateString);
    int day = birthDate.day;
    int month = birthDate.month;

    int reducedDay = reduceNumberNumerologically(day);
    int reducedMonth = reduceNumberNumerologically(month);

    int numerologyValue =
        reduceNumberNumerologically(reducedDay + reducedMonth);
    return numerologyValue;
  }
}
