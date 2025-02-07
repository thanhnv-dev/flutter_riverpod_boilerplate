import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final display = Display();
  static final headline = Headline();
  static final title = Title();
  static final label = Label();
  static final body = Body();
  static final custom = Custom();
}

class Display {
  final TextStyle large = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 57,
    letterSpacing: -0.25,
  );
  final TextStyle medium = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 45,
  );
  final TextStyle small = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 36,
  );
}

class Headline {
  final TextStyle large = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 32,
  );
  final TextStyle medium = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 28,
  );
  final TextStyle small = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 24,
  );
}

class Title {
  final TextStyle large = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 22,
  );
  final TextStyle medium = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0.15,
  );
  final TextStyle small = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.1,
  );
}

class Label {
  final TextStyle large = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.1,
  );
  final TextStyle medium = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.5,
  );
  final TextStyle small = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    letterSpacing: 0.5,
  );
}

class Body {
  final TextStyle large = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.5,
  );
  final TextStyle medium = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.25,
  );
  final TextStyle small = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.4,
  );
}

class Custom {
  final TextStyle titleLogo = GoogleFonts.roboto(
    fontWeight: FontWeight.w900,
    fontSize: 30,
  );

  final TextStyle bold20 = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
}
