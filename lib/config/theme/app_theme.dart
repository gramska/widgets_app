import 'package:flutter/material.dart';

const colorList = <Color>[
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.deepPurple,
    Colors.orange,
    Colors.pink,
    Colors.pinkAccent
  ];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
    }): assert(selectedColor >= 0,'El color debe mayor o igual a 0'),
    assert(selectedColor < colorList.length,'El color debe ser menor a ${colorList.length}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode? Brightness.dark:Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    // colorScheme: ColorScheme.fromSeed(
    //     seedColor: colorList[selectedColor],
    //     brightness: isDarkMode? Brightness.dark:Brightness.light,
    //   ),
    appBarTheme: const AppBarTheme(
      centerTitle: false, // en Android viene no viene centrado por default
    ),
  );
}
 