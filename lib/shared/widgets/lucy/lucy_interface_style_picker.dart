import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/localization/l10n/app_localizations.dart';
import '../../../core/theme/lucy_interface_style.dart';
import '../../../core/theme/lucy_theme_palette.dart';

/// Grid of three interface-style preview cards (Settings).
class LucyInterfaceStylePicker extends StatelessWidget {
  const LucyInterfaceStylePicker({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final LucyInterfaceStyle selected;
  final ValueChanged<LucyInterfaceStyle> onSelected;

  static const _styles = [
    LucyInterfaceStyle.academic,
    LucyInterfaceStyle.premiumDark,
    LucyInterfaceStyle.motivant,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return LayoutBuilder(
      builder: (context, constraints) {
        final useRow = constraints.maxWidth >= 520;
        final cards = _styles
            .map(
              (style) => _StylePreviewCard(
                style: style,
                selected: selected == style,
                title: _title(l10n, style),
                description: _description(l10n, style),
                onTap: () => onSelected(style),
              ),
            )
            .toList();

        if (useRow) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < cards.length; i++) ...[
                if (i > 0) const SizedBox(width: LucySpacing.spaceMd),
                Expanded(child: cards[i]),
              ],
            ],
          );
        }

        return Column(
          children: [
            for (var i = 0; i < cards.length; i++) ...[
              if (i > 0) const SizedBox(height: LucySpacing.spaceMd),
              cards[i],
            ],
          ],
        );
      },
    );
  }

  String _title(AppLocalizations l10n, LucyInterfaceStyle style) =>
      switch (style) {
        LucyInterfaceStyle.academic => l10n.interfaceStyleAcademic,
        LucyInterfaceStyle.premiumDark => l10n.interfaceStylePremiumDark,
        LucyInterfaceStyle.motivant => l10n.interfaceStyleMotivant,
      };

  String _description(AppLocalizations l10n, LucyInterfaceStyle style) =>
      switch (style) {
        LucyInterfaceStyle.academic => l10n.interfaceStyleAcademicDescription,
        LucyInterfaceStyle.premiumDark =>
          l10n.interfaceStylePremiumDarkDescription,
        LucyInterfaceStyle.motivant => l10n.interfaceStyleMotivantDescription,
      };
}

class _StylePreviewCard extends StatelessWidget {
  const _StylePreviewCard({
    required this.style,
    required this.selected,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final LucyInterfaceStyle style;
  final bool selected;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final palette = LucyThemePalette.resolve(
      brightness: Brightness.light,
      style: style,
    );
    final previewDecoration = _previewDecoration(style, palette);

    return Material(
      color: scheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
        side: BorderSide(
          color: selected ? scheme.primary : palette.extension.border,
          width: selected ? 2 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(LucySpacing.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 1.35,
                child: DecoratedBox(
                  decoration: previewDecoration,
                  child: Center(
                    child: Text(
                      'Aa',
                      style: _previewAaStyle(style, palette.primarySeed),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: LucySpacing.spaceSm),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleSmall?.copyWith(
                  color: scheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: LucySpacing.spaceXs),
              Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _previewDecoration(
    LucyInterfaceStyle style,
    LucyResolvedThemePalette palette,
  ) {
    return switch (style) {
      LucyInterfaceStyle.academic => BoxDecoration(
          color: palette.scaffoldBackground,
          borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
          border: Border.all(color: palette.extension.border),
        ),
      LucyInterfaceStyle.premiumDark => BoxDecoration(
          borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
          gradient: palette.extension.lucyAvatarGradient,
          boxShadow: [
            BoxShadow(
              color: palette.primarySeed.withValues(alpha: 0.35),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        ),
      LucyInterfaceStyle.motivant => BoxDecoration(
          borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              palette.scaffoldBackground,
              palette.extension.motivantAccentSurface,
            ],
          ),
          border: Border.all(color: palette.extension.border),
        ),
    };
  }

  TextStyle _previewAaStyle(LucyInterfaceStyle style, Color ink) {
    return switch (style) {
      LucyInterfaceStyle.academic => GoogleFonts.newsreader(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: ink,
        ),
      LucyInterfaceStyle.premiumDark => GoogleFonts.hankenGrotesk(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      LucyInterfaceStyle.motivant => GoogleFonts.newsreader(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: ink,
          fontStyle: FontStyle.italic,
        ),
    };
  }
}
