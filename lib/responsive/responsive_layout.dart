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

  // stripes pattern
  static double mobileStripesSize = 400.0;
  static double tableStripesSize = 500.0;
  static double desktopStripesSize = 920.0;

//Letters size

  static double getResponsiveSize(BuildContext context, double baseSize) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Adjust this factor based on preference
    const double scaleFactor = 0.0015;
    return screenHeight * scaleFactor * baseSize;
  }

  static double getResponsiveCard(BuildContext context, double cardSize) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Adjust this factor based on preference
    const double scaleFactor = 0.0006;
    return screenHeight * scaleFactor * cardSize;
  }

//Desktop
  static const double mainLettersSizeDesktop = 70.0;
  static const double occupationLettersSizeDesktop = 26.0;
  static const double normalLettersSizeDesktop = 16.0;
  static const double cardTitleLettersSizeDesktop = 24.0;
  static const double bottomSheetLetterSizeDesktop = 12.0;

//Tablet
  static const double mainLettersSizeTablet = 35.0;
  static const double occupationLettersSizeTablet = 22.0;
  static const double normalLettersSizeTablet = 12.0;
  static const double cardTitleLettersSizeTablet = 15.0;
  static const double bottomSheetLetterSizeTablet = 24.0;

//Mobile
  static const double mainLettersSizeMobile = 40.0;
  static const double occupationLettersSizeMobile = 18.0;
  static const double normalLettersSizeMobile = 13.0;
  static const double cardTitleLettersSizeMobile = 15.0;
  static const double bottomSheetLetterSizeMobile = 23.0;

// Second section skill card sizes

//Mobile
  static const double firstChildHeightMobile = 400.0;
  static const double firstChildWidthMobile = 280.0;
  static const double secondChildHeightMobile = 500.0;
  static const double secondChildWidthMobile = 300.0;
  static const double expandedContainerHeightMobile = 800.0;
  static const double expandedContainerWidthMobile = 420.0;

//Tablet
  static const double firstChildHeightTablet = 400.0;
  static const double firstChildWidthTablet = 280.0;
  static const double secondChildHeightTablet = 450.0;
  static const double secondChildWidthTablet = 300.0;
  static const double expandedContainerHeightTablet = 800.0;
  static const double expandedContainerWidthTablet = 500.0;

//Desktop
  static const double childHeightDesktop = 260.0;
  static const double childWidthDesktop = 400.0;

  // Wrap widget spacing:

  static const double wrapSpacing = 20.0;
  static const double wrapRunSpacing = 20.0;

// Create method to calculate second section height
  static double secondSectionHeight(BuildContext context,
      {double projectSpace = wrapSpacing,
      required int skillsLength,
      required double projectWidth}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final textRevealHeight = ResponsiveLayout.getResponsiveSize(
        context,
        (ResponsiveLayout.buildWidgetValue(context,
            mobileValue: ResponsiveLayout.mainLettersSizeMobile + 10,
            tabletValue: ResponsiveLayout.mainLettersSizeTablet + 10,
            desktopValue: ResponsiveLayout.mainLettersSizeDesktop + 10)));
    final projectsPerLine =
        (screenWidth / (projectWidth + projectSpace)).floor();
    final totalLine = skillsLength ~/ projectsPerLine;
    final sectionHeight = textRevealHeight +
        (totalLine *
            getResponsiveCard(
                context,
                buildWidgetValue(context,
                    mobileValue: secondChildHeightMobile,
                    tabletValue: secondChildHeightTablet,
                    desktopValue: childHeightDesktop))) +
        screenHeight +
        120; // 120 represents vertical margins in the sections
    return sectionHeight;
  }

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
      {double projectSpace = wrapSpacing,
      required int index,
      required double projectWidth}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final projectsPerLine =
        (screenWidth / (projectWidth + projectSpace)).floor();
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
