import 'dart:ui';

enum AppColors {
  color1,
  color2,
  color3,
  color4,
  color5,
  color6,
}

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.color1:
        return const Color.fromRGBO(255, 255, 255, 1);
      case AppColors.color2:
        return const Color.fromRGBO(0, 0, 0, 1);
      case AppColors.color3:
        return const Color.fromRGBO(74, 74, 74, 1);
      case AppColors.color4:
        return const Color.fromRGBO(238, 242, 234, 1);
      case AppColors.color5:
        return const Color.fromRGBO(172, 220, 174, 1);
      case AppColors.color6:
        return const Color(0xFF76B947);
    }
  }
}
