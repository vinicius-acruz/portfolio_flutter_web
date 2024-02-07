import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/screens/section/fourth_section/fourth_section_tablet.dart';
import 'package:portfolio_flutter_web/widgets/stamp_animation.dart';
import '../../../constants/style.dart';
import '../../../widgets/text_reveal.dart';
import 'first_section.dart';

class FirstSectionTablet extends StatelessWidget {
  const FirstSectionTablet({
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            right: ResponsiveLayout.getResponsiveSize(context, -75.0),
            child: SecondPageImage(
              height: ResponsiveLayout.getResponsiveImage(context, 0.85),
            ),
          ),
          // Positioned.fill(
          //   right: ResponsiveLayout.getResponsiveSize(context, -10.0),
          //   child: SizeTransition(
          //     sizeFactor: patternAnimation,
          //     axis: Axis.horizontal,
          //     child: Image.asset(
          //       'images/listraswide.png',
          //       fit: BoxFit.contain,
          //       height: ResponsiveLayout.getResponsiveImage(context, 0.65),
          //     ),
          //   ),
          // ),
          Positioned.fill(
            right: ResponsiveLayout.getResponsiveSize(context, -75.0),
            child: FirstPageImage(
                height: ResponsiveLayout.getResponsiveImage(context, 0.85)),
          ),
          const Positioned(
              top: 20,
              left: -100,
              child: SizedBox(height: 200, child: FlutterStampAnimation())),
          // Page Content
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 25.0),
            child: FittedBox(
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  TextReveal(
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    maxHeight: ResponsiveLayout.mainLettersSizeTablet + 30,
                    controller: controller,
                    child: Text(
                      'Hello,',
                      style: AppStyles.fontStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: ResponsiveLayout.mainLettersSizeTablet + 20,
                        color: AppStyles.bigLettersColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextReveal(
                        textOpacityAnimation: textOpacityAnimation,
                        textRevealAnimation: textRevealAnimation,
                        maxHeight: ResponsiveLayout.mainLettersSizeTablet + 10,
                        controller: controller,
                        child: Text(
                          "I'm ",
                          style: AppStyles.fontStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: ResponsiveLayout.mainLettersSizeTablet,
                            color: AppStyles.bigLettersColor,
                          ).copyWith(
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
                        maxHeight: ResponsiveLayout.mainLettersSizeTablet + 10,
                        controller: controller,
                        child: Text(
                          'Vinícius',
                          style: AppStyles.fontStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                      ResponsiveLayout.mainLettersSizeTablet,
                                  color: AppStyles.bigLettersColor)
                              .copyWith(
                                  shadows: [
                                const Shadow(
                                    color: AppStyles.bigLettersColor,
                                    offset: Offset(0, -5))
                              ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: AppStyles.bigLettersColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveLayout.getResponsiveSize(context, 10.0),
                  ),
                  TextReveal(
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    maxHeight:
                        ResponsiveLayout.occupationLettersSizeTablet + 10,
                    controller: controller,
                    child: Text(
                      'Flutter Developer',
                      style: AppStyles.fontStyle(
                          fontSize:
                              ResponsiveLayout.occupationLettersSizeTablet,
                          color: AppStyles.occupationLetterColor),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveLayout.getResponsiveSize(context, 10.0),
                  ),
                  SizeTransition(
                    sizeFactor: buttonAnimation,
                    axis: Axis.horizontal,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const FourthSectionTablet();
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
                        fixedSize: Size(180.0, 45),
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
                                fontSize: ResponsiveLayout
                                        .cardTitleLettersSizeTablet -
                                    5),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Icon(
                            Icons.send,
                            color: AppStyles.reachButtonLettersColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:
                            ResponsiveLayout.getResponsiveSize(context, 300.0),
                        child: TextReveal(
                          textOpacityAnimation: textOpacityAnimation,
                          textRevealAnimation: textRevealAnimation,
                          maxHeight: double.infinity,
                          controller: controller,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Hi, I\'m Vinícius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                              style: AppStyles.fontStyle(
                                  fontSize:
                                      ResponsiveLayout.normalLettersSizeTablet),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
