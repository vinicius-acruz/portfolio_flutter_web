import 'package:flutter/material.dart';

import '../modals/scroll_offset.dart';

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

  //profile image

  static double mobileImageSize = 550.0;
  static double tableImageSize = 1500.0;
  static double desktopImageSize = 920.0;

  static double ScreenWidthSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }

  static double ScreenWidthHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    return screenWidth;
  }

  static double buildWidgetValue(BuildContext context,
      {required double mobileValue,
      required tabletValue,
      required desktopValue}) {
    if (ScreenWidthSize(context) < mobileWidthLimit) {
      return mobileValue;
    } else if (ScreenWidthSize(context) < tabletWidthLimit) {
      return tabletValue;
    } else {
      return desktopValue;
    }
  }

  static double ImageSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth > ResponsiveLayout.mobileWidthLimit
        ? (screenWidth > ResponsiveLayout.tabletWidthLimit
            ? desktopImageSize
            : tableImageSize)
        : mobileImageSize;
    return imageSize;
  }

  static double getResponsiveSize(BuildContext context, double baseSize) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Adjust this factor based on preference
    const double scaleFactor = 0.0015;
    return screenHeight * scaleFactor * baseSize;
  }

  static bool buildWhenSecondSection(BuildContext context, ScrollOffset current,
      AnimationController controller) {
    double startRange;
    double endRange;

    startRange = buildWidgetValue(context,
        mobileValue: 900, tabletValue: 1000, desktopValue: 1100);
    endRange = buildWidgetValue(context,
        mobileValue: 1300, tabletValue: 1400, desktopValue: 1500);

    if ((current.scrollOffsetValue >= startRange &&
            current.scrollOffsetValue <= endRange) ||
        controller.isAnimating) {
      return true;
    } else {
      return false;
    }
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
