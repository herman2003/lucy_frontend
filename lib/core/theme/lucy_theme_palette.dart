import 'package:flutter/material.dart';

import 'lucy_colors.dart';
import 'lucy_interface_style.dart';
import 'lucy_theme_extensions.dart';

/// Resolved palette for a brightness + [LucyInterfaceStyle] pair.
@immutable
class LucyResolvedThemePalette {
  const LucyResolvedThemePalette({
    required this.primarySeed,
    required this.secondarySeed,
    required this.tertiarySeed,
    required this.scaffoldBackground,
    required this.extension,
  });

  final Color primarySeed;
  final Color secondarySeed;
  final Color tertiarySeed;
  final Color scaffoldBackground;
  final LucyThemeExtension extension;
}

/// Maps design combinations to seeds and [LucyThemeExtension].
abstract final class LucyThemePalette {
  static LucyResolvedThemePalette resolve({
    required Brightness brightness,
    required LucyInterfaceStyle style,
  }) {
    final isDark = brightness == Brightness.dark;
    return switch (style) {
      LucyInterfaceStyle.academic => _academic(isDark),
      LucyInterfaceStyle.premiumDark => _premiumDark(isDark),
      LucyInterfaceStyle.motivant => _motivant(isDark),
    };
  }

  static LucyResolvedThemePalette _academic(bool isDark) {
    if (isDark) {
      return LucyResolvedThemePalette(
        primarySeed: LucyColors.primaryDarkMode,
        secondarySeed: LucyColors.colorSchemeSecondaryDarkSeed,
        tertiarySeed: LucyColors.colorSchemeTertiaryDarkSeed,
        scaffoldBackground: LucyColors.scaffoldAcademicDark,
        extension: LucyThemeExtension(
          scaffoldBackground: LucyColors.scaffoldAcademicDark,
          surfaceSecondary: LucyColors.surface2AcademicDark,
          border: LucyColors.borderDark,
          muted: LucyColors.mutedDark,
          faint: const Color(0xFF6B7591),
          railBackground: const Color(0xFF161B29),
          railForeground: const Color(0xFF7A85A0),
          lucyBubbleBackground: const Color(0xFF1A2030),
          tealChipBackground: LucyColors.tealChipBgDark,
          tealChipForeground: LucyColors.tealChipTextDark,
          chipBackground: const Color(0xFF243154),
          chipForeground: const Color(0xFFA9C0F0),
          lucyAvatarGradient: LucyColors.lucyAvatarGradient,
          motivantAccentSurface: const Color(0xFF2A2418),
        ),
      );
    }
    return LucyResolvedThemePalette(
      primarySeed: LucyColors.primary,
      secondarySeed: LucyColors.colorSchemeSecondaryLightSeed,
      tertiarySeed: LucyColors.colorSchemeTertiaryLightSeed,
      scaffoldBackground: LucyColors.scaffoldAcademicLight,
      extension: const LucyThemeExtension(
        scaffoldBackground: LucyColors.scaffoldAcademicLight,
        surfaceSecondary: LucyColors.surfaceElevatedLight,
        border: LucyColors.borderLight,
        muted: LucyColors.mutedLight,
        faint: LucyColors.faintLight,
        railBackground: LucyColors.rail,
        railForeground: LucyColors.railText,
        lucyBubbleBackground: Colors.white,
        tealChipBackground: LucyColors.tealChipBgLight,
        tealChipForeground: LucyColors.tealChipTextLight,
        chipBackground: LucyColors.chipBgLight,
        chipForeground: LucyColors.chipTextLight,
        lucyAvatarGradient: LucyColors.lucyAvatarGradient,
        motivantAccentSurface: LucyColors.motivantAccentSurface,
      ),
    );
  }

  static LucyResolvedThemePalette _premiumDark(bool isDark) {
    if (isDark) {
      return _academic(true).copyWithExtension(
        scaffoldBackground: LucyColors.scaffoldAcademicDark,
        lucyAvatarGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6F9BF0), Color(0xFF2E4C8A)],
        ),
      );
    }
    return LucyResolvedThemePalette(
      primarySeed: const Color(0xFF3559A0),
      secondarySeed: LucyColors.colorSchemeSecondaryLightSeed,
      tertiarySeed: LucyColors.colorSchemeTertiaryLightSeed,
      scaffoldBackground: LucyColors.scaffoldPremiumLight,
      extension: LucyThemeExtension(
        scaffoldBackground: LucyColors.scaffoldPremiumLight,
        surfaceSecondary: const Color(0xFFF3F6FC),
        border: const Color(0xFFD5DEEA),
        muted: const Color(0xFF6B7385),
        faint: const Color(0xFF9AA1B2),
        railBackground: LucyColors.rail,
        railForeground: LucyColors.railText,
        lucyBubbleBackground: Colors.white,
        tealChipBackground: LucyColors.tealChipBgLight,
        tealChipForeground: LucyColors.tealChipTextLight,
        chipBackground: const Color(0xFFE3E9F5),
        chipForeground: const Color(0xFF2E4C8A),
        lucyAvatarGradient: LucyColors.lucyAvatarGradient,
        motivantAccentSurface: LucyColors.motivantAccentSurface,
      ),
    );
  }

  static LucyResolvedThemePalette _motivant(bool isDark) {
    if (isDark) {
      return _academic(true).copyWithExtension(
        scaffoldBackground: const Color(0xFF14110D),
        surfaceSecondary: const Color(0xFF1E1914),
        motivantAccentSurface: const Color(0xFF3D2E1A),
      );
    }
    return LucyResolvedThemePalette(
      primarySeed: LucyColors.primary,
      secondarySeed: LucyColors.colorSchemeSecondaryLightSeed,
      tertiarySeed: LucyColors.colorSchemeTertiaryLightSeed,
      scaffoldBackground: LucyColors.scaffoldMotivantLight,
      extension: const LucyThemeExtension(
        scaffoldBackground: LucyColors.scaffoldMotivantLight,
        surfaceSecondary: Color(0xFFFFF9F0),
        border: Color(0xFFE8D9C4),
        muted: Color(0xFF8A7560),
        faint: Color(0xFFA3907A),
        railBackground: LucyColors.rail,
        railForeground: LucyColors.railText,
        lucyBubbleBackground: Colors.white,
        tealChipBackground: LucyColors.tealChipBgLight,
        tealChipForeground: LucyColors.tealChipTextLight,
        chipBackground: Color(0xFFFBEEDD),
        chipForeground: Color(0xFFB26C1E),
        lucyAvatarGradient: LucyColors.lucyAvatarGradient,
        motivantAccentSurface: LucyColors.motivantAccentSurface,
      ),
    );
  }
}

extension on LucyResolvedThemePalette {
  LucyResolvedThemePalette copyWithExtension({
    Color? scaffoldBackground,
    Color? surfaceSecondary,
    Color? motivantAccentSurface,
    LinearGradient? lucyAvatarGradient,
  }) {
    return LucyResolvedThemePalette(
      primarySeed: primarySeed,
      secondarySeed: secondarySeed,
      tertiarySeed: tertiarySeed,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      extension: extension.copyWith(
        scaffoldBackground: scaffoldBackground,
        surfaceSecondary: surfaceSecondary,
        motivantAccentSurface: motivantAccentSurface,
        lucyAvatarGradient: lucyAvatarGradient,
      ),
    );
  }
}
