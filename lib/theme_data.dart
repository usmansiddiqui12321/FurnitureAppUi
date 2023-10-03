import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.blue, // Change the app bar color
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),

      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: Colors.white, // App bar text color
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black, // Default text color
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.grey, // Secondary text color
        fontSize: 14,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue, // Default button color
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.indigo,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.indigo, // Change the app bar color
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        // textTheme: TextTheme(
        //   headline6: TextStyle(
        //     color: Colors.white, // App bar text color
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white, // Default text color
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: Colors.grey, // Secondary text color
          fontSize: 14,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.indigo, // Default button color
        textTheme: ButtonTextTheme.primary,
      ));
}
