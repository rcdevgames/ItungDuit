import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Themes {
  static ThemeData getTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryLight,
      primaryColorDark: primary,
      primaryColorBrightness: Brightness.dark,
      accentColor: primaryLight,
      accentColorBrightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Theme.of(context).canvasColor,
        centerTitle: false,
        textTheme: GoogleFonts.robotoTextTheme().copyWith(
          headline1: GoogleFonts.roboto(textStyle: textTheme.headline1),
          headline2: GoogleFonts.roboto(textStyle: textTheme.headline2),
          headline3: GoogleFonts.roboto(textStyle: textTheme.headline3),
          headline4: GoogleFonts.roboto(textStyle: textTheme.headline4),
          headline5: GoogleFonts.roboto(textStyle: textTheme.headline5),
          headline6: GoogleFonts.roboto(textStyle: textTheme.headline6),
          subtitle1: GoogleFonts.roboto(textStyle: textTheme.subtitle1),
          subtitle2: GoogleFonts.roboto(textStyle: textTheme.subtitle2),
        ),
      ),
      textTheme: GoogleFonts.robotoTextTheme(
        textTheme,
      ).copyWith(
        headline1: GoogleFonts.roboto(textStyle: textTheme.headline1),
        headline2: GoogleFonts.roboto(textStyle: textTheme.headline2),
        headline3: GoogleFonts.roboto(textStyle: textTheme.headline3),
        headline4: GoogleFonts.roboto(textStyle: textTheme.headline4),
        headline5: GoogleFonts.roboto(textStyle: textTheme.headline5),
        headline6: GoogleFonts.roboto(textStyle: textTheme.headline6),
        subtitle1: GoogleFonts.roboto(textStyle: textTheme.subtitle1),
        subtitle2: GoogleFonts.roboto(textStyle: textTheme.subtitle2),
      ),
    );
  }
}
