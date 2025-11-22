import 'package:flutter/material.dart';

/// Application-wide color constants
/// Following Material Design 3 principles for modern UI
class AppColors {
  AppColors._();

  // Primary Colors - Modern vibrant blue-purple palette
  static const Color primary = Color(0xFF6C5CE7);
  static const Color primaryDark = Color(0xFF5F3DC4);
  static const Color primaryLight = Color(0xFF9775FA);

  // Accent Colors - Complementary cyan-pink
  static const Color accent = Color(0xFF00D9FF);
  static const Color accentDark = Color(0xFF00B8D4);
  static const Color accentPink = Color(0xFFFF006E);

  // Background Colors - Dark modern theme
  static const Color background = Color(0xFF0F0F1E);
  static const Color surface = Color(0xFF1A1A2E);
  static const Color cardBackground = Color(0xFF16213E);

  // Text Colors - High contrast for dark theme
  static const Color textPrimary = Color(0xFFE7E9EA);
  static const Color textSecondary = Color(0xFFB4B7BB);
  static const Color textHint = Color(0xFF71767B);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Divider & Border
  static const Color divider = Color(0xFF2F3336);
  static const Color border = Color(0xFF2F3336);

  // Status Colors
  static const Color success = Color(0xFF00F5A0);
  static const Color error = Color(0xFFFF006E);
  static const Color warning = Color(0xFFFFC300);
  static const Color info = Color(0xFF00D9FF);

  // Modern Gradient Palettes
  // Hero Section Gradient - Purple to Cyan
  static const List<Color> heroGradient = [
    Color(0xFF6C5CE7),
    Color(0xFF00D9FF),
  ];

  // About Section Gradient - Pink to Orange
  static const List<Color> aboutGradient = [
    Color(0xFFFF006E),
    Color(0xFFFFBE0B),
  ];

  // Skills Section Gradient - Blue to Purple
  static const List<Color> skillsGradient = [
    Color(0xFF4E54C8),
    Color(0xFF8F94FB),
  ];

  // Projects Section Gradient - Teal to Lime
  static const List<Color> projectsGradient = [
    Color(0xFF00D9FF),
    Color(0xFF00F5A0),
  ];

  // Contact Section Gradient - Purple to Pink
  static const List<Color> contactGradient = [
    Color(0xFF9775FA),
    Color(0xFFFF006E),
  ];

  // Card Hover Gradient - Gold to Pink
  static const List<Color> cardHoverGradient = [
    Color(0xFFFFBE0B),
    Color(0xFFFF006E),
  ];

  // Button Gradient - Purple to Cyan
  static const List<Color> buttonGradient = [
    Color(0xFF6C5CE7),
    Color(0xFF00D9FF),
  ];

  // Background Animated Gradient
  static const List<Color> backgroundGradient = [
    Color(0xFF0F0F1E),
    Color(0xFF1A1A2E),
    Color(0xFF16213E),
  ];

  // Legacy gradient support
  static const Color gradientStart = Color(0xFF6C5CE7);
  static const Color gradientEnd = Color(0xFF00D9FF);

  // Shadow
  static const Color shadow = Color(0x33000000);
  static const Color glowShadow = Color(0x4D6C5CE7);

  // Shimmer Colors
  static const Color shimmerBase = Color(0xFF1A1A2E);
  static const Color shimmerHighlight = Color(0xFF2F3336);

  // Dark Mode Colors (for future enhancement)
  static const Color darkBackground = Color(0xFF0A0A0F);
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkTextPrimary = Color(0xFFE7E9EA);

  /// Create a linear gradient from a color list
  static LinearGradient createGradient(
    List<Color> colors, {
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    return LinearGradient(colors: colors, begin: begin, end: end);
  }
}
