import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/screens/section/fourth_section/fourth_section_mobile.dart';
import 'package:portfolio_flutter_web/widgets/stamp_animation.dart';
import '../../../responsive/responsive_layout.dart';
import '../../../widgets/text_reveal.dart';
import 'first_section.dart';

class FirstSectionMobile extends StatelessWidget {
  const FirstSectionMobile({
    super.key,
    required this.patternAnimation,
    required this.textOpacityAnimation,
    required this.textRevealAnimation,
    required this.controller,
    required this.buttonAnimation,
  });

  final Animation<double> patternAnimation;
  final Animation<double> textOpacityAnimation;
  final Animation<double> textRevealAnimation;
  final AnimationController controller;
  final Animation<double> buttonAnimation;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // function to calculate responsive size

    return Center(
      child: Stack(
        children: [
          Positioned.fill(
            right: ResponsiveLayout.getResponsiveSize(context, -130.0),
            child: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: SecondPageImage(
                height: screenHeight * 0.75,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 50.0,
            child: SizeTransition(
              sizeFactor: patternAnimation,
              axis: Axis.horizontal,
              child: SizedBox(
                height: ResponsiveLayout.getResponsiveSize(
                    context, ResponsiveLayout.mobileStripesSize),
                child: Image.asset(
                  'assets/images/listras_mobile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: ResponsiveLayout.getResponsiveSize(context, -130.0),
            child: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: FirstPageImage(
                height: screenHeight * 0.75,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
              top: 20,
              left: -120,
              child: SizedBox(height: 180, child: FlutterStampAnimation())),
          // Page Content
          Container(
            height: screenHeight,
            padding: const EdgeInsets.only(left: 20.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextReveal(
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  maxHeight: ResponsiveLayout.mainLettersSizeMobile + 20,
                  controller: controller,
                  child: Text(
                    'Hello,',
                    style: AppStyles.fontStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: ResponsiveLayout.mainLettersSizeMobile + 10,
                        color: AppStyles.bigLettersColor),
                  ),
                ),
                Row(
                  children: [
                    TextReveal(
                      textOpacityAnimation: textOpacityAnimation,
                      textRevealAnimation: textRevealAnimation,
                      maxHeight: ResponsiveLayout.mainLettersSizeMobile + 10,
                      controller: controller,
                      child: Text(
                        "I'm ",
                        style: AppStyles.fontStyle(
                                fontWeight: FontWeight.w900,
                                fontSize:
                                    ResponsiveLayout.mainLettersSizeMobile,
                                color: AppStyles.bigLettersColor)
                            .copyWith(
                                shadows: [
                              const Shadow(
                                  color: AppStyles.bigLettersColor,
                                  offset: Offset(0, -5))
                            ],
                                color: Colors.transparent,
                                decorationThickness: 2,
                                decorationColor: AppStyles.bigLettersColor),
                      ),
                    ),
                    TextReveal(
                      textOpacityAnimation: textOpacityAnimation,
                      textRevealAnimation: textRevealAnimation,
                      maxHeight: ResponsiveLayout.mainLettersSizeMobile + 10,
                      controller: controller,
                      child: Text(
                        'Vinícius',
                        style: AppStyles.fontStyle(
                                fontWeight: FontWeight.w900,
                                fontSize:
                                    ResponsiveLayout.mainLettersSizeMobile,
                                color: AppStyles.bigLettersColor)
                            .copyWith(
                                shadows: [
                              const Shadow(
                                  color: AppStyles.bigLettersColor,
                                  offset: Offset(0, -5))
                            ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: AppStyles.bigLettersColor),
                      ),
                    ),
                  ],
                ),
                TextReveal(
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  maxHeight: ResponsiveLayout.occupationLettersSizeMobile + 10,
                  controller: controller,
                  child: Text(
                    'Flutter Developer',
                    style: AppStyles.fontStyle(
                      fontSize: ResponsiveLayout.occupationLettersSizeMobile,
                      color: AppStyles.occupationLetterColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizeTransition(
                  sizeFactor: buttonAnimation,
                  axis: Axis.horizontal,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const FourthSectionMobile();
                        },
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context)
                              .size
                              .width, // This forces the bottom sheet to take full width
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                          ResponsiveLayout.getResponsiveSize(context, 170.0),
                          ResponsiveLayout.getResponsiveSize(context, 40.0)),
                      backgroundColor: AppStyles.reachButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reach Me',
                          style: AppStyles.fontStyle(
                              color: AppStyles.reachButtonLettersColor,
                              fontSize:
                                  ResponsiveLayout.cardTitleLettersSizeMobile -
                                      3),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.send,
                          color: AppStyles.reachButtonLettersColor,
                          size: ResponsiveLayout.getResponsiveSize(context,
                              ResponsiveLayout.cardTitleLettersSizeMobile),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Flexible(
                  child: TextReveal(
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    maxHeight: 20,
                    controller: controller,
                    child: Container(
                      child: const Text(
                        'Hi, I\'m Vinícius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                        style: TextStyle(
                            fontSize: ResponsiveLayout.normalLettersSizeMobile),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveLayout.getResponsiveSize(context, 25.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
