import 'package:flutter/material.dart';

/// Builds the light theme for the app with custom colors.
ThemeData buildLightTheme() {
  const primaryColor = Color(0xFF0066cc);
  const secondaryColor = Color(0xFFFFCC00);
  return ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    useMaterial3: true,
  );
}
