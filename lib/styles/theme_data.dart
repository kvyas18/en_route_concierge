import 'package:flutter/material.dart';
import 'package:en_route_concierge/styles/colors.dart';

final TextStyle basicTextStyle = TextStyle(
  fontFamily: "SFUIDisplay",
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
);

final TextTheme textTheme = TextTheme(
  bodyMedium: basicTextStyle,
  bodyLarge: basicTextStyle.merge(TextStyle(fontSize: 14.0)),
  titleLarge: basicTextStyle.merge(
    TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30.0,
    ),
  ),
  titleSmall: basicTextStyle.merge(
    TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
    ),
  ),
);

class ThemeScheme {
  static dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: dbackgroundColor,
      primaryColor: dprimaryColor,
      hintColor: dsecondaryColor,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
      ),
    );
  }

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lbackgroundColor,
      primaryColor: lprimaryColor,
      hintColor: lsecondaryColor,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: dbasicDarkColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
      ),
    );
  }
}
