//DEFINICIÓN DE TEMA POR DEFECTO
import 'package:flutter/material.dart';

class DefaultTheme {
  //COLORS
  static const Color primaryColor = Color(0xFFE6B30C);
  static const Color secoundColor = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFFFFD700);
  static const Color textColor = Color(0xFF333333);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFCCCCCC);

  //FONTS FAMILY
  static const String primaryFontFamily = 'Poppins';

  //FONT SIZES
  static const double defaultFontSize = 16.0;
  static const double heading1Size = 24.0;
  static const double heading2Size = 20.0;
  static const double heading3Size = 18.0;
  static const double heading4Size = 16.0;
  static const double smallTextSize = 14.0;

  //FONT WEIGHT
  static const FontWeight defaultFontWeight = FontWeight.normal;
  static const FontWeight boldFontWeight = FontWeight.bold;

  //FONTS SPACES
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double borderRadius = 8.0;
  static const double borderRadiusButton = 20.0;

  //INPUT STYLE
  static const double borderRadiusField = 20.0;
  static const double borderRadiusWidth = 2.0;

  //ICONS SIZE
  static const double defaultIconSize = 24.0;
  static const double smallIconSize = 18.0;

  // SHADOW
  static const BoxShadow defaultBoxShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 4.0,
    offset: Offset(0, 2),
  );

  // FONT STYLE
  final TextStyle heading1Style = const TextStyle(
    fontSize: heading1Size,
    fontWeight: boldFontWeight,
    color: textColor,
    fontFamily: primaryFontFamily,
  );

  final TextStyle heading2Style = const TextStyle(
    fontSize: heading2Size,
    fontWeight: boldFontWeight,
    color: textColor,
    fontFamily: primaryFontFamily,
  );

  final TextStyle heading3Style = const TextStyle(
    fontSize: heading3Size,
    fontWeight: boldFontWeight,
    color: textColor,
    fontFamily: primaryFontFamily,
  );

  final TextStyle heading4Style = const TextStyle(
    fontSize: heading4Size,
    fontWeight: boldFontWeight,
    color: textColor,
    fontFamily: primaryFontFamily,
  );

  TextStyle smallTextStyle = const TextStyle(
    fontSize: smallTextSize,
    fontWeight: defaultFontWeight,
    color: textColor,
    fontFamily: primaryFontFamily,
  );

  //BUTTONS
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: primaryColor,
    textStyle: const TextStyle(fontSize: defaultFontSize),
    padding:
        const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 12.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusButton),
    ),
  );

  static ButtonStyle secondaryButtonStyle(Color backgroundColorButton) {
    return OutlinedButton.styleFrom(
      elevation: 0,
      backgroundColor: backgroundColorButton,
      disabledForegroundColor: primaryColor.withOpacity(0.38),
      textStyle: const TextStyle(fontSize: defaultFontSize),
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: 12.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusButton),
          side: const BorderSide(
            width: 2,
            color: primaryColor,
          )),
    );
  }

  static final ThemeData setThemeDefault = ThemeData(
    useMaterial3: false,
    colorScheme: const ColorScheme(
      background: primaryColor,
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: secoundColor,
      secondary: secoundColor,
      onSecondary: secoundColor,
      error: secoundColor,
      onError: primaryColor,
      onBackground: primaryColor,
      surface: primaryColor,
      onSurface: primaryColor,
    ),
    textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: primaryFontFamily),
        displayMedium: TextStyle(fontFamily: primaryFontFamily)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
