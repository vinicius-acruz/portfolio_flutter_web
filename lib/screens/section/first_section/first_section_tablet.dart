import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
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
    return Stack(
      children: [
        Positioned.fill(
          left: -ResponsiveLayout.ScreenWidthSize(context) * 0.35,
          child: const SecondPageImage(),
        ),
        // SizeTransition(
        //   sizeFactor: patternAnimation,
        //   axis: Axis.horizontal,
        //   child: SizedBox(
        //     height: 1100,
        //     child: Image.asset(
        //       'assets/images/listraswide.png',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Positioned.fill(
          left: -ResponsiveLayout.ScreenWidthSize(context) * 0.35,
          child: const FirstPageImage(),
        ),

        // Page Content
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                TextReveal(
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  maxHeight: ResponsiveLayout.getResponsiveSize(context, 55.0),
                  controller: controller,
                  child: Text(
                    'Hello,',
                    style: AppStyles.fontStyle(
                      fontWeight: FontWeight.w900,
                      fontSize:
                          ResponsiveLayout.getResponsiveSize(context, 45.0),
                      color: AppStyles.bigLettersColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    TextReveal(
                      textOpacityAnimation: textOpacityAnimation,
                      textRevealAnimation: textRevealAnimation,
                      maxHeight:
                          ResponsiveLayout.getResponsiveSize(context, 55.0),
                      controller: controller,
                      child: Text(
                        "I'm ",
                        style: AppStyles.fontStyle(
                          fontWeight: FontWeight.w900,
                          fontSize:
                              ResponsiveLayout.getResponsiveSize(context, 45.0),
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
                      maxHeight:
                          ResponsiveLayout.getResponsiveSize(context, 55.0),
                      controller: controller,
                      child: Text(
                        'Vinicius',
                        style: AppStyles.fontStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: ResponsiveLayout.getResponsiveSize(
                                    context, 45.0),
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
                const SizedBox(
                  height: 10.0,
                ),
                TextReveal(
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  maxHeight: ResponsiveLayout.getResponsiveSize(context, 32.0),
                  controller: controller,
                  child: Text(
                    'Flutter Developer',
                    style: AppStyles.fontStyle(
                        fontSize:
                            ResponsiveLayout.getResponsiveSize(context, 22.0),
                        color: AppStyles.occupationLetterColor),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
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
                          ResponsiveLayout.getResponsiveSize(context, 180.0),
                          80.0),
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
                                  context, 18.0)),
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
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextReveal(
                          textOpacityAnimation: textOpacityAnimation,
                          textRevealAnimation: textRevealAnimation,
                          maxHeight: double.infinity,
                          controller: controller,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              'Hi, I\'m Vinicius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                              style: AppStyles.fontStyle(fontSize: 33.0),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.53,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
