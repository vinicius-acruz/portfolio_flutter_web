import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
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

    // function to calculate responsive size

    return Stack(
      children: [
        // Page Content
        Container(
          height: screenHeight,
          padding: const EdgeInsets.only(left: 20.0, top: 180.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextReveal(
                textOpacityAnimation: textOpacityAnimation,
                textRevealAnimation: textRevealAnimation,
                maxHeight: ResponsiveLayout.getResponsiveSize(context, 60.0),
                controller: controller,
                child: Text(
                  'Hello,',
                  style: AppStyles.fontStyle(
                      fontWeight: FontWeight.w900,
                      fontSize:
                          ResponsiveLayout.getResponsiveSize(context, 40.0),
                      color: AppStyles.bigLettersColor),
                ),
              ),
              Row(
                children: [
                  TextReveal(
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    maxHeight:
                        ResponsiveLayout.getResponsiveSize(context, 65.0),
                    controller: controller,
                    child: Text(
                      "I'm ",
                      style: AppStyles.fontStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: ResponsiveLayout.getResponsiveSize(
                                  context, 30.0),
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
                    maxHeight:
                        ResponsiveLayout.getResponsiveSize(context, 60.0),
                    controller: controller,
                    child: Text(
                      'Vinicius',
                      style: AppStyles.fontStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: ResponsiveLayout.getResponsiveSize(
                                  context, 30.0),
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
                maxHeight: 35.0,
                controller: controller,
                child: Text(
                  'Flutter Developer',
                  style: AppStyles.fontStyle(
                    fontSize: ResponsiveLayout.getResponsiveSize(context, 18.0),
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
                    // Add your action here
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
                            fontSize: ResponsiveLayout.getResponsiveSize(
                                context, 15.0)),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon(
                        Icons.send,
                        color: AppStyles.reachButtonLettersColor,
                        size: ResponsiveLayout.getResponsiveSize(context, 18.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Flexible(
                child: TextReveal(
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  maxHeight: 20,
                  controller: controller,
                  child: Container(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Text(
                      'Hi, I\'m Vinicius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                      style: TextStyle(
                          fontSize: ResponsiveLayout.getResponsiveSize(
                              context, 15.0)),
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
        Positioned.fill(
          left: -130.0,
          child: SecondPageImage(),
        ),
        const Positioned.fill(
          left: -130.0,
          child: FirstPageImage(),
        ),
      ],
    );
  }
}
