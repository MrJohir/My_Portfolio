import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constants/app_colors.dart';

/// Responsive helper widget
/// Provides different layouts based on screen size
class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 1100) {
      return desktop ?? tablet ?? mobile;
    } else if (size.width >= 650) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}

/// Responsive padding helper
class ResponsivePadding {
  static EdgeInsets horizontal(BuildContext context) {
    if (ResponsiveWidget.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 100);
    } else if (ResponsiveWidget.isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40);
    } else {
      return const EdgeInsets.symmetric(horizontal: 16);
    }
  }

  static EdgeInsets all(BuildContext context) {
    if (ResponsiveWidget.isDesktop(context)) {
      return const EdgeInsets.all(60);
    } else if (ResponsiveWidget.isTablet(context)) {
      return const EdgeInsets.all(32);
    } else {
      return const EdgeInsets.all(16);
    }
  }

  static EdgeInsets vertical(BuildContext context) {
    if (ResponsiveWidget.isDesktop(context)) {
      return const EdgeInsets.symmetric(vertical: 60);
    } else if (ResponsiveWidget.isTablet(context)) {
      return const EdgeInsets.symmetric(vertical: 40);
    } else {
      return const EdgeInsets.symmetric(vertical: 24);
    }
  }
}

/// Loading indicator widget
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    );
  }
}
