import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import '../../../constants/style.dart';
import '../../../widgets/text_reveal.dart';
import 'first_section.dart';

class FirstSectionWeb extends StatelessWidget {
  const FirstSectionWeb({
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

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          SizedBox(
            height: ResponsiveLayout.getResponsiveImage(context, 0.85),
            child: SecondPageImage(
              height: ResponsiveLayout.getResponsiveImage(context, 0.9),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.95,
            width: double.infinity,
            child: SizeTransition(
              sizeFactor: patternAnimation,
              axis: Axis.horizontal,
              axisAlignment: 1,
              child: Image.asset(
                'assets/images/listraswide.png',
                fit: BoxFit.contain,
                alignment: Alignment.topRight,
              ),
            ),
          ),
          SizedBox(
              height: ResponsiveLayout.getResponsiveImage(context, 0.85),
              child: FirstPageImage(
                height: ResponsiveLayout.getResponsiveImage(context, 0.9),
              )),

          //Page Content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                height: screenHeight * 0.8,
                child: Row(
                  crossAxisAlignment: (screenHeight > screenWidth)
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextReveal(
                                textOpacityAnimation: textOpacityAnimation,
                                textRevealAnimation: textRevealAnimation,
                                maxHeight:
                                    ResponsiveLayout.mainLettersSizeDesktop - 5,
                                controller: controller,
                                child: AutoSizeText(
                                  'Hello,',
                                  style: AppStyles.fontStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize:
                                        ResponsiveLayout.mainLettersSizeDesktop,
                                    color: AppStyles.bigLettersColor,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  TextReveal(
                                    textOpacityAnimation: textOpacityAnimation,
                                    textRevealAnimation: textRevealAnimation,
                                    maxHeight: ResponsiveLayout
                                            .mainLettersSizeDesktop -
                                        10,
                                    controller: controller,
                                    child: AutoSizeText(
                                      "I'm ",
                                      style: AppStyles.fontStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: ResponsiveLayout
                                            .mainLettersSizeDesktop,
                                        color: AppStyles.bigLettersColor,
                                      ).copyWith(
                                          shadows: [
                                            const Shadow(
                                                color:
                                                    AppStyles.bigLettersColor,
                                                offset: Offset(0, -5))
                                          ],
                                          color: Colors.transparent,
                                          decorationThickness: 2,
                                          decorationColor:
                                              AppStyles.bigLettersColor),
                                    ),
                                  ),
                                  TextReveal(
                                    textOpacityAnimation: textOpacityAnimation,
                                    textRevealAnimation: textRevealAnimation,
                                    maxHeight: ResponsiveLayout
                                            .mainLettersSizeDesktop -
                                        10,
                                    controller: controller,
                                    child: AutoSizeText(
                                      'Vinícius',
                                      style: AppStyles.fontStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: ResponsiveLayout
                                                  .mainLettersSizeDesktop,
                                              color: AppStyles.bigLettersColor)
                                          .copyWith(
                                              shadows: [
                                            const Shadow(
                                                color:
                                                    AppStyles.bigLettersColor,
                                                offset: Offset(0, -5))
                                          ],
                                              color: Colors.transparent,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                              decorationColor:
                                                  AppStyles.bigLettersColor),
                                    ),
                                  ),
                                ],
                              ),
                              TextReveal(
                                textOpacityAnimation: textOpacityAnimation,
                                textRevealAnimation: textRevealAnimation,
                                maxHeight: ResponsiveLayout
                                        .occupationLettersSizeDesktop -
                                    5,
                                controller: controller,
                                child: AutoSizeText(
                                  'Flutter Developer',
                                  style: AppStyles.fontStyle(
                                      fontSize: ResponsiveLayout
                                          .occupationLettersSizeDesktop,
                                      color: AppStyles.occupationLetterColor),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
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
                                        ResponsiveLayout.getResponsiveSize(
                                            context, 90.0),
                                        40.0),
                                    backgroundColor: AppStyles.reachButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Reach Me',
                                          style: AppStyles.fontStyle(
                                            color: AppStyles
                                                .reachButtonLettersColor,
                                            fontSize: ResponsiveLayout
                                                    .cardTitleLettersSizeDesktop -
                                                10,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        const Icon(
                                          Icons.send,
                                          color:
                                              AppStyles.reachButtonLettersColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                width: ResponsiveLayout.getResponsiveSize(
                                    context,
                                    ((screenHeight > screenWidth)
                                        ? 110.0
                                        : 135)),
                                child: TextReveal(
                                  textOpacityAnimation: textOpacityAnimation,
                                  textRevealAnimation: textRevealAnimation,
                                  maxHeight: 300.0,
                                  controller: controller,
                                  child: AutoSizeText(
                                    'Hi, I\'m Vinícius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                                    style: AppStyles.fontStyle(
                                        fontSize: ResponsiveLayout
                                                .normalLettersSizeDesktop -
                                            5),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
