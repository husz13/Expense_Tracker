import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 14, 83, 186)); //rgb(17, 106, 123)
final darkKColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,

    ///primary: const Color.fromARGB(255, 51, 29, 44), //rgb(51, 29, 44)
    seedColor: Color.fromARGB(255, 5, 7, 109)); //rgb(63, 46, 62)

void main() {
  runApp(
    MaterialApp(
      darkTheme: darkTheme,
      theme: mainTheme,
      home: const Expenses(),
    ),
  );
}

ThemeData mainTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: kColorScheme.secondaryContainer,
    useMaterial3: true,
    cardTheme: const CardTheme().copyWith(
      color: const Color.fromARGB(255, 205, 194, 174),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
        actionsIconTheme: const IconThemeData().copyWith(color: Colors.white),
        backgroundColor: kColorScheme.onBackground,
        foregroundColor: kColorScheme.primaryContainer),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer)),
    textTheme: const TextTheme().copyWith(
        bodyMedium: GoogleFonts.lato(color: Colors.black),
        titleLarge: GoogleFonts.roboto(
            fontSize: 16, color: kColorScheme.onSecondaryContainer)),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 157, 106, 58),
    ));

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColorDark: darkKColorScheme.onPrimaryContainer,
  useMaterial3: true,
  colorScheme: darkKColorScheme,
  cardTheme: const CardTheme().copyWith(
      color: darkKColorScheme.onSecondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
  appBarTheme: const AppBarTheme().copyWith(
      actionsIconTheme: const IconThemeData()
          .copyWith(color: const Color.fromARGB(255, 1, 1, 1)),
      backgroundColor: darkKColorScheme.primary,
      foregroundColor: darkKColorScheme.primaryContainer),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: darkKColorScheme.secondaryContainer,
          foregroundColor: Colors.white)),
  textTheme: const TextTheme().copyWith(
      titleSmall: GoogleFonts.lato(color: Colors.white),
      bodyMedium: GoogleFonts.lato(color: Colors.black),
      titleLarge: GoogleFonts.roboto(
          fontSize: 16, color: darkKColorScheme.inverseSurface)),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 157, 106, 58),
  ),
);
