import 'package:flutter/material.dart';

/// Semantic colors not covered by [ColorScheme] alone (design system).
@immutable
class LucyThemeExtension extends ThemeExtension<LucyThemeExtension> {
  const LucyThemeExtension({
    required this.scaffoldBackground,
    required this.surfaceSecondary,
    required this.border,
    required this.muted,
    required this.faint,
    required this.railBackground,
    required this.railForeground,
    required this.lucyBubbleBackground,
    required this.tealChipBackground,
    required this.tealChipForeground,
    required this.chipBackground,
    required this.chipForeground,
    required this.lucyAvatarGradient,
    required this.motivantAccentSurface,
  });

  final Color scaffoldBackground;
  final Color surfaceSecondary;
  final Color border;
  final Color muted;
  final Color faint;
  final Color railBackground;
  final Color railForeground;
  final Color lucyBubbleBackground;
  final Color tealChipBackground;
  final Color tealChipForeground;
  final Color chipBackground;
  final Color chipForeground;
  final LinearGradient lucyAvatarGradient;
  final Color motivantAccentSurface;

  @override
  LucyThemeExtension copyWith({
    Color? scaffoldBackground,
    Color? surfaceSecondary,
    Color? border,
    Color? muted,
    Color? faint,
    Color? railBackground,
    Color? railForeground,
    Color? lucyBubbleBackground,
    Color? tealChipBackground,
    Color? tealChipForeground,
    Color? chipBackground,
    Color? chipForeground,
    LinearGradient? lucyAvatarGradient,
    Color? motivantAccentSurface,
  }) {
    return LucyThemeExtension(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      border: border ?? this.border,
      muted: muted ?? this.muted,
      faint: faint ?? this.faint,
      railBackground: railBackground ?? this.railBackground,
      railForeground: railForeground ?? this.railForeground,
      lucyBubbleBackground: lucyBubbleBackground ?? this.lucyBubbleBackground,
      tealChipBackground: tealChipBackground ?? this.tealChipBackground,
      tealChipForeground: tealChipForeground ?? this.tealChipForeground,
      chipBackground: chipBackground ?? this.chipBackground,
      chipForeground: chipForeground ?? this.chipForeground,
      lucyAvatarGradient: lucyAvatarGradient ?? this.lucyAvatarGradient,
      motivantAccentSurface:
          motivantAccentSurface ?? this.motivantAccentSurface,
    );
  }

  @override
  LucyThemeExtension lerp(
    covariant ThemeExtension<LucyThemeExtension>? other,
    double t,
  ) {
    if (other is! LucyThemeExtension) {
      return this;
    }
    return LucyThemeExtension(
      scaffoldBackground: Color.lerp(
        scaffoldBackground,
        other.scaffoldBackground,
        t,
      )!,
      surfaceSecondary: Color.lerp(
        surfaceSecondary,
        other.surfaceSecondary,
        t,
      )!,
      border: Color.lerp(border, other.border, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      faint: Color.lerp(faint, other.faint, t)!,
      railBackground: Color.lerp(railBackground, other.railBackground, t)!,
      railForeground: Color.lerp(railForeground, other.railForeground, t)!,
      lucyBubbleBackground: Color.lerp(
        lucyBubbleBackground,
        other.lucyBubbleBackground,
        t,
      )!,
      tealChipBackground: Color.lerp(
        tealChipBackground,
        other.tealChipBackground,
        t,
      )!,
      tealChipForeground: Color.lerp(
        tealChipForeground,
        other.tealChipForeground,
        t,
      )!,
      chipBackground: Color.lerp(chipBackground, other.chipBackground, t)!,
      chipForeground: Color.lerp(chipForeground, other.chipForeground, t)!,
      lucyAvatarGradient: lucyAvatarGradient,
      motivantAccentSurface: Color.lerp(
        motivantAccentSurface,
        other.motivantAccentSurface,
        t,
      )!,
    );
  }
}

extension LucyThemeExtensionContext on BuildContext {
  LucyThemeExtension get lucyTheme =>
      Theme.of(this).extension<LucyThemeExtension>()!;
}
