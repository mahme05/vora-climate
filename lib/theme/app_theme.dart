import 'package:flutter/material.dart';

class VoraColors {
  VoraColors._();

  static const background = Color(0xFF0B1326);
  static const surface = Color(0xFF0B1326);
  static const surfaceContainerLow = Color(0xFF131B2E);
  static const surfaceContainer = Color(0xFF171F33);
  static const surfaceContainerHigh = Color(0xFF222A3D);
  static const surfaceContainerHighest = Color(0xFF2D3449);
  static const surfaceDim = Color(0xFF060E20);
  static const surfaceBright = Color(0xFF31394D);

  static const onSurface = Color(0xFFDAE2FD);
  static const onSurfaceVariant = Color(0xFFBEC9C0);
  static const outline = Color(0xFF89938B);
  static const outlineVariant = Color(0xFF3F4942);

  static const primary = Color(0xFF86D7AC);
  static const onPrimary = Color(0xFF003823);
  static const primaryContainer = Color(0xFF006341);
  static const onPrimaryContainer = Color(0xFF8CDCB1);

  static const secondary = Color(0xFF73DB9A);
  static const secondaryContainer = Color(0xFF00834B);

  static const tertiary = Color(0xFFFFB690);
  static const tertiaryContainer = Color(0xFF903D00);
  static const onTertiaryContainer = Color(0xFFFFBD9B);

  static const error = Color(0xFFFFB4AB);
  static const errorContainer = Color(0xFF93000A);
}

class VoraTheme {
  VoraTheme._();

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: VoraColors.background,
        colorScheme: const ColorScheme.dark(
          primary: VoraColors.primary,
          onPrimary: VoraColors.onPrimary,
          primaryContainer: VoraColors.primaryContainer,
          onPrimaryContainer: VoraColors.onPrimaryContainer,
          secondary: VoraColors.secondary,
          secondaryContainer: VoraColors.secondaryContainer,
          tertiary: VoraColors.tertiary,
          tertiaryContainer: VoraColors.tertiaryContainer,
          surface: VoraColors.surface,
          onSurface: VoraColors.onSurface,
          onSurfaceVariant: VoraColors.onSurfaceVariant,
          error: VoraColors.error,
          errorContainer: VoraColors.errorContainer,
          outline: VoraColors.outline,
          outlineVariant: VoraColors.outlineVariant,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: VoraColors.onSurface,
            letterSpacing: -0.02 * 48,
            height: 1.1,
          ),
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: VoraColors.onSurface,
            height: 1.2,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: VoraColors.onSurface,
            height: 1.3,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: VoraColors.onSurface,
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: VoraColors.onSurface,
            height: 1.5,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: VoraColors.onSurface,
            letterSpacing: 0.01 * 14,
            height: 1.4,
          ),
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: VoraColors.onSurfaceVariant,
            letterSpacing: 0.05 * 12,
            height: 1.4,
          ),
        ),
      );
}
