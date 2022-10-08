import 'package:flutter/material.dart';

class AppTheme{

  static Color primaryColor = Colors.orangeAccent;
  static get ligthTheme{
    return ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(
         border: OutlineInputBorder( borderRadius: BorderRadius.circular(12)),
         focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor,width: 1.5),
          borderRadius: BorderRadius.circular(12)
        ),
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