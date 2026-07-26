import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/context.dart';

/// Library card for quiz/flashcards grids — aligned with Lucy chat session cards.
class LucyAdminCard extends StatefulWidget {
  const LucyAdminCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badgeLabel,
    required this.dateLabel,
    required this.headerIcon,
    required this.openLabel,
    this.accentColor,
    this.iconColor,
    this.onTap,
    this.onDelete,
  });

  final String title;
  final String subtitle;
  final String badgeLabel;
  final String dateLabel;
  final IconData headerIcon;
  final String openLabel;
  final Color? accentColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  State<LucyAdminCard> createState() => _LucyAdminCardState();
}

class _LucyAdminCardState extends State<LucyAdminCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final l10n = context.l10n;
    final accent = widget.accentColor ?? scheme.primary;
    final iconColor = widget.iconColor ?? scheme.onPrimary;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
          border: Border.all(
            color: accent.withValues(alpha: _hovered ? 0.45 : 0.22),
          ),
          color: Color.alphaBlend(
            accent.withValues(alpha: _hovered ? 0.14 : 0.08),
            scheme.surface,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : const [],
        ),
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(
              LucyConstants.kBorderRadiusLarge,
            ),
            child: Padding(
              padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      _TypeBadge(label: widget.badgeLabel, color: accent),
                      const Spacer(),
                      if (widget.onDelete != null)
                        IconButton(
                          onPressed: widget.onDelete,
                          tooltip: l10n.quizLibraryDeleteAction,
                          visualDensity: VisualDensity.compact,
                          icon: Icon(
                            Icons.delete_outline,
                            size: 20,
                            color: scheme.onSurfaceVariant,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: scheme.surface.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: LucyConstants.kSpacingLow),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                            LucyConstants.kSpacingLow + 2,
                          ),
                          decoration: BoxDecoration(
                            color: accent,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: accent.withValues(alpha: 0.28),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.headerIcon,
                            color: iconColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: LucyConstants.kSpacingMedium),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.titleSmall?.copyWith(
                                  color: scheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              ),
                              const SizedBox(height: LucyConstants.kSpacingLow),
                              _MetaRow(
                                icon: Icons.format_list_numbered_outlined,
                                label: widget.subtitle,
                              ),
                              const SizedBox(
                                height: LucyConstants.kSpacingLow / 2,
                              ),
                              _MetaRow(
                                icon: Icons.schedule_outlined,
                                label: widget.dateLabel,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: accent.withValues(alpha: 0.18)),
                  const SizedBox(height: LucyConstants.kSpacingLow),
                  Row(
                    children: [
                      Text(
                        widget.openLabel,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: LucyConstants.kSpacingLow),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: accent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusSmall),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LucyConstants.kSpacingLow + 2,
          vertical: LucyConstants.kSpacingLow / 2,
        ),
        child: Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Row(
      children: [
        Icon(icon, size: 16, color: scheme.onSurfaceVariant),
        const SizedBox(width: LucyConstants.kSpacingLow),
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
