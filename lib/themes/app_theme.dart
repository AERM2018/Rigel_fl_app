import 'package:flutter/material.dart';

class AppTheme{

  static Color primaryColor = const Color.fromRGBO(255, 152, 89, 1);
  static Color primaryColorLighter = Color.fromARGB(251, 238, 202, 134);
  static Color secondaryColor = Colors.black87;
  static Color thirdColor = Colors.white70;
  static Color disable = Colors.grey.shade400;
  static Color disableDark = Colors.grey;
  static TextStyle h1b = TextStyle(fontSize: 20, color: secondaryColor);
  static TextStyle h2b = TextStyle(fontSize: 18, color: secondaryColor);
  static TextStyle h3b = TextStyle(fontSize: 16, color: secondaryColor);
  static TextStyle h4b = TextStyle(fontSize: 14, color: secondaryColor);
  static TextStyle h1w = TextStyle(fontSize: 20, color: thirdColor);
  static TextStyle h2w = TextStyle(fontSize: 18, color: thirdColor);
  static TextStyle h3w = TextStyle(fontSize: 16, color: thirdColor);
  static TextStyle h4w = TextStyle(fontSize: 14, color: thirdColor);
  static TextStyle h1boldb = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryColor);
  static TextStyle h2boldb = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryColor);
  static TextStyle h3boldb = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: secondaryColor);
  static TextStyle h4boldb = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: secondaryColor);
  static TextStyle h1boldw = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:thirdColor);
  static TextStyle h2boldw = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:thirdColor);
  static TextStyle h3boldw = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:thirdColor);
  static TextStyle h4boldw = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color:thirdColor);

  static get ligthTheme{
    return ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.apply(fontFamily: "Roboto"),
      primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: "Roboto"),
      inputDecorationTheme: InputDecorationTheme(
         border: OutlineInputBorder( borderRadius: BorderRadius.circular(12)),
         focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor,width: 2.2),
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(color: AppTheme.secondaryColor)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(double.infinity, 38),
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          )
        )
      )
    );
  }
}