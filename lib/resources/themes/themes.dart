import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        primaryColor: const Color(0xff0165FC),
        primaryColorLight: const Color(0xffFFFFFF),
        primaryColorDark: const Color(0xff000000),
        disabledColor: Colors.grey,
        colorScheme: const ColorScheme.light(error: Color(0xffFE0000)),
        textTheme: TextTheme(
            headlineSmall: GoogleFonts.rubik(fontWeight: FontWeight.w500),
            bodyMedium: GoogleFonts.poppins(),
            titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0165FC),
                minimumSize: const Size(double.maxFinite, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)))),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        
        navigationBarTheme:
            const NavigationBarThemeData(backgroundColor: Colors.blueAccent));
  }
}
