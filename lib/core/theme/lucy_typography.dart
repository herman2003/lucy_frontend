import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography stack from the Lucy design system (google_fonts).
abstract final class LucyTypography {
  static TextTheme apply(TextTheme base, Brightness brightness) {
    final ink = brightness == Brightness.dark
        ? const Color(0xFFE6E9F2)
        : const Color(0xFF1B2336);
    final muted = brightness == Brightness.dark
        ? const Color(0xFF98A1B6)
        : const Color(0xFF8A8270);

    final hanken = GoogleFonts.hankenGroteskTextTheme(
      base,
    ).apply(bodyColor: ink, displayColor: ink);

    return hanken.copyWith(
      headlineLarge: _editorial(hanken.headlineLarge, 26, FontWeight.w600, ink),
      headlineMedium: _editorial(
        hanken.headlineMedium,
        22,
        FontWeight.w600,
        ink,
      ),
      headlineSmall: _editorial(hanken.headlineSmall, 20, FontWeight.w600, ink),
      titleLarge: _editorial(hanken.titleLarge, 20, FontWeight.w600, ink),
      titleMedium: GoogleFonts.hankenGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ink,
      ),
      titleSmall: GoogleFonts.hankenGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ink,
      ),
      bodyLarge: GoogleFonts.hankenGrotesk(
        fontSize: 14.5,
        fontWeight: FontWeight.w400,
        color: ink,
        height: 1.45,
      ),
      bodyMedium: GoogleFonts.hankenGrotesk(
        fontSize: 13.5,
        fontWeight: FontWeight.w400,
        color: ink,
        height: 1.45,
      ),
      bodySmall: GoogleFonts.hankenGrotesk(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: muted,
      ),
      labelLarge: GoogleFonts.hankenGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ink,
      ),
      labelMedium: GoogleFonts.jetBrainsMono(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: muted,
      ),
      labelSmall: GoogleFonts.hankenGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        color: muted,
      ),
    );
  }

  static TextStyle brandMark({double size = 22, Color color = Colors.white}) {
    return GoogleFonts.bricolageGrotesque(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle editorialQuote({
    required double fontSize,
    required Color color,
  }) {
    return GoogleFonts.newsreader(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: color,
      height: 1.5,
    );
  }

  static TextStyle _editorial(
    TextStyle? base,
    double size,
    FontWeight weight,
    Color color,
  ) {
    return GoogleFonts.newsreader(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: -0.2,
      height: 1.2,
    );
  }
}
