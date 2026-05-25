import 'package:flutter/material.dart';

/// Responsive breakpoints for auth layouts (AfroSchool pattern).
extension BuildContextResponsive on BuildContext {
  static const double kDesktopBreakpoint = 900;

  bool get isDesktop => MediaQuery.sizeOf(this).width >= kDesktopBreakpoint;

  bool get isMobile => !isDesktop;
}
