import 'package:healo_app/src/util/theme/widget_theme/text_field_theme.dart';
import 'package:healo_app/src/util/theme/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'elevate_button_theme.dart';
import 'outlined_button_theme.dart';


class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButton.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    //scaffoldBackgroundColor: Colors.cyanAccent
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButton.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
     // scaffoldBackgroundColor: Colors.cyanAccent
  );
}
