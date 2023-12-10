import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  //Tentativa 2

  // Background color
  static const Color backgroundColor = Color.fromRGBO(232, 226, 219, 1.0);

// Normal letters and Button color
  static const Color lettersColor = Color.fromRGBO(26, 50, 99, 1.0);

// Main Letters color
  static const Color bigLettersColor = Color.fromRGBO(26, 50, 99, 1.0);

  // First section

  static const Color occupationLetterColor = Color.fromRGBO(241, 104, 33, 1.0);
  static const Color reachButtonColor = Color.fromRGBO(26, 50, 99, 1.0);
  static const Color reachButtonLettersColor =
      Color.fromRGBO(232, 226, 219, 1.0);

  //Skill cards

  //for letters and icon color
  static const Color skillLettersColor = Color.fromRGBO(26, 50, 99, 1.0);

  static const Color skillCardsColor = Color.fromRGBO(232, 226, 219, 1.0);

  static const Color skillCardsIconsColor = Color.fromRGBO(241, 104, 33, 1.0);

  static const Color skillCardsBorderColor = Color.fromRGBO(250, 185, 91, 1.0);

  // Bottom sheet - 4th section

  static const Color bottomLettersContactColor =
      Color.fromRGBO(241, 104, 33, 1.0);
  static const Color bottomLettersColor = Color.fromRGBO(232, 226, 219, 1.0);
  static const Color bottomSheetColor = Color.fromRGBO(26, 50, 99, 1.0);

  static TextStyle fontStyle({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = lettersColor,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
    );
  }
}
