import 'package:flutter/material.dart';

// App theme configuration generated from GlideX project settings
class AppTheme {
  // Color Palette
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color scaffoldBackground = Color(0xFFFFFBFF);
  static const Color appBarBackground = Color(0xFF2196F3);
  static const Color appBarForeground = Color(0xFFFFFFFF);
  static const Color buttonBackground = Color(0xFF2196F3);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF1F1F1F);
  static const Color containerBackground = Color(0xFFFFFBFF);
  static const Color iconColor = Color(0xFF2196F3);
  static const Color bottomNavBackground = Color(0xFFFFFFFF);
  static const Color bottomNavSelected = Color(0xFF2196F3);
  static const Color bottomNavUnselected = Color(0xFF757575);

  // Typography
  static const String fontFamily = 'Roboto';
  static const double textFontSize = 14;
  static const FontWeight textFontWeight = FontWeight.w400;
  static const double buttonFontSize = 14;
  static const FontWeight buttonFontWeight = FontWeight.w500;
  static const double lineHeight = 1.5;
  static const double letterSpacing = 0;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        foregroundColor: appBarForeground,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: appBarForeground,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackground,
          foregroundColor: buttonText,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: buttonFontSize,
            fontWeight: buttonFontWeight,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          color: textColor,
          height: lineHeight,
          letterSpacing: letterSpacing,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          color: textColor,
          height: lineHeight,
          letterSpacing: letterSpacing,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bottomNavBackground,
        selectedItemColor: bottomNavSelected,
        unselectedItemColor: bottomNavUnselected,
      ),
      iconTheme: IconThemeData(
        color: iconColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackground,
          foregroundColor: buttonText,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: buttonFontSize,
            fontWeight: buttonFontWeight,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          color: Colors.white,
          height: lineHeight,
          letterSpacing: letterSpacing,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          color: Colors.white,
          height: lineHeight,
          letterSpacing: letterSpacing,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: bottomNavSelected,
        unselectedItemColor: bottomNavUnselected,
      ),
      iconTheme: IconThemeData(
        color: iconColor,
      ),
    );
  }
}
