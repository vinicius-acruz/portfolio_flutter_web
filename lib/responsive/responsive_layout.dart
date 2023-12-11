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
  static double tableImageSize = 1200.0;
  static double desktopImageSize = 920.0;

//Letters size

  static double getResponsiveSize(BuildContext context, double baseSize) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Adjust this factor based on preference
    const double scaleFactor = 0.0015;
    return screenHeight * scaleFactor * baseSize;
  }

//Desktop
  static double mainLettersSizeDesktop = 100.0;
  static double occupationLettersSizeDesktop = 50.0;
  static double normalLettersSizeDesktop = 20.0;
  static double cardTitleLettersSizeDesktop = 15.0;
  static double bottomSheetLetterSizeDesktop = 12.0;

//Tablet
  static double mainLettersSizeTablet = 35.0;
  static double occupationLettersSizeTablet = 22.0;
  static double normalLettersSizeTablet = 12.0;
  static double cardTitleLettersSizeTablet = 15.0;
  static double bottomSheetLetterSizeTablet = 24.0;

//Mobile
  static double mainLettersSizeMobile = 40.0;
  static double occupationLettersSizeMobile = 18.0;
  static double normalLettersSizeMobile = 13.0;
  static double cardTitleLettersSizeMobile = 15.0;
  static double bottomSheetLetterSizeMobile = 23.0;

  static double screenWidthSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }

  static double screenWidthHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    return screenWidth;
  }

  static double buildWidgetValue(BuildContext context,
      {required double mobileValue,
      required tabletValue,
      required desktopValue}) {
    if (screenWidthSize(context) < mobileWidthLimit) {
      return mobileValue;
    } else if (screenWidthSize(context) < tabletWidthLimit) {
      return tabletValue;
    } else {
      return desktopValue;
    }
  }

  // Create a method for setting a index for projects in same line
  static int getWidgetIndex(BuildContext context,
      {double projectSpace = 20.0,
      required int index,
      required double projectWidth}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final projectsPerLine = (screenWidth / (projectWidth + 20)).floor();
    final lineIndex = projectsPerLine == 0 ? 0 : index ~/ projectsPerLine;
    return lineIndex;
  }

  static double imageSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth > ResponsiveLayout.mobileWidthLimit
        ? (screenWidth > ResponsiveLayout.tabletWidthLimit
            ? desktopImageSize
            : tableImageSize)
        : mobileImageSize;
    return imageSize;
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
