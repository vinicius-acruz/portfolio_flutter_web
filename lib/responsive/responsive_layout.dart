import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.desktopLayout,
    required this.tabletLayout,
  });

  static int mobileWidthLimit = 500;
  static int tabletWidthLimit = 1100;

  static double getResponsiveSize(BuildContext context, double baseSize) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Adjust this factor based on preference
    const double scaleFactor = 0.0015;
    return screenHeight * scaleFactor * baseSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileLayout;
      } else if (constraints.maxWidth < 1100) {
        return tabletLayout;
      } else {
        return desktopLayout;
      }
    });
  }
}
