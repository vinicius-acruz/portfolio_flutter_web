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
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenHeight > screenWidth) {
      const double scaleFactor = 0.0015;
      return screenHeight * scaleFactor * baseSize;
    } else {
      const double scaleFactor = 0.0013;
      return screenWidth * scaleFactor * baseSize;
    }
    // Adjust this factor based on preference
  }

  static double getResponsiveCard(BuildContext context, double cardSize) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // Adjust this factor based on preference
    if (screenHeight > screenWidth) {
      const double scaleFactor = 0.0006;
      return screenHeight * scaleFactor * cardSize;
    } else {
      const double scaleFactor = 0.0005;
      return screenWidth * scaleFactor * cardSize;
    }
  }

  static double getResponsiveImage(BuildContext context, double scaleFactor) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenHeight > screenWidth) {
      return screenHeight * scaleFactor;
    } else {
      return screenWidth * scaleFactor;
    }
  }

//Desktop
  static const double mainLettersSizeDesktop = 75.0;
  static const double occupationLettersSizeDesktop = 32.0;
  static const double normalLettersSizeDesktop = 20.0;
  static const double cardTitleLettersSizeDesktop = 25.0;
  static const double bottomSheetLetterSizeDesktop = 40.0;

//Tablet
  static const double mainLettersSizeTablet = 75.0;
  static const double occupationLettersSizeTablet = 32.0;
  static const double normalLettersSizeTablet = 18.0;
  static const double cardTitleLettersSizeTablet = 23.0;
  static const double bottomSheetLetterSizeTablet = 37.0;

//Mobile
  static const double mainLettersSizeMobile = 45.0;
  static const double occupationLettersSizeMobile = 25.0;
  static const double normalLettersSizeMobile = 16.0;
  static const double cardTitleLettersSizeMobile = 20.0;
  static const double bottomSheetLetterSizeMobile = 23.0;

// Second section skill card sizes

//Mobile
  static const double firstChildHeightMobile = 50.0;
  static const double firstChildWidthMobile = 30.0;
  static const double secondChildHeightMobile = 180.0;
  static const double secondChildWidthMobile = 140.0;
  static const double expandedContainerHeightMobile = 350.0;
  static const double expandedContainerWidthMobile = 180.0;

//Tablet
  static const double firstChildHeightTablet = 50.0;
  static const double firstChildWidthTablet = 30.0;
  static const double secondChildHeightTablet = 280.0;
  static const double secondChildWidthTablet = 180.0;
  static const double expandedContainerHeightTablet = 480.0;
  static const double expandedContainerWidthTablet = 180.0;

//Desktop
  static const double childHeightDesktop = 350.0;
  static const double childWidthDesktop = 400.0;

  // Wrap widget spacing:

  static const double wrapSpacing = 20.0;
  static const double wrapRunSpacing = 20.0;

  // Third section project card sizes

//Mobile

  static const double projectCardHeightMobile = 600.0;
  static const double projectCardWidthMobile = 500.0;

  //Tablet

  static const double projectCardHeightTablet = 680.0;
  static const double projectCardWidthTablet = 450.0;

  //Desktop

  static const double projectCardHeightDesktop = 750.0;
  static const double projectCardWidthDesktop = 500.0;

// Create method to calculate second section height
  static double secondSectionHeight(BuildContext context,
      {double projectSpace = wrapSpacing,
      required int skillsLength,
      required double projectWidth}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final textRevealHeight = ResponsiveLayout.buildWidgetValue(context,
        mobileValue: ResponsiveLayout.mainLettersSizeMobile + 10,
        tabletValue: ResponsiveLayout.mainLettersSizeTablet + 10,
        desktopValue: ResponsiveLayout.mainLettersSizeDesktop + 10);
    final projectsPerLine = (screenWidth / (projectWidth + 5 + projectSpace))
        .floor(); //5 is the margin of the skill  card
    final totalLine = (skillsLength / projectsPerLine).ceil();
    // print(
    //     'screen width: $screenWidth, total  line: $totalLine, skills length: $skillsLength  skill  width total: ${projectWidth + 50 + projectSpace} per line: $projectsPerLine');

    final sectionHeight = textRevealHeight +
        (totalLine *
            buildWidgetValue(context,
                mobileValue: secondChildHeightMobile,
                tabletValue: secondChildHeightTablet,
                desktopValue: childHeightDesktop)) +
        screenHeight +
        100; // 100 represents vertical margins in the sections
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
    int projectsPerLine = (screenWidth / (projectWidth + projectSpace)).floor();
    if (projectsPerLine == 0) {
      projectsPerLine = 1;
    }
    final lineIndex = index ~/ projectsPerLine;
    // print('projects per line: $projectsPerLine, line index: $lineIndex');
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
