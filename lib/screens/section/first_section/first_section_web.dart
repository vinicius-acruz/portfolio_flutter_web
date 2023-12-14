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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SecondPageImage(
              height: MediaQuery.of(context).size.height * 0.9,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
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
              height: MediaQuery.of(context).size.height * 0.9,
              child: FirstPageImage(
                height: MediaQuery.of(context).size.height * 0.9,
              )),

          //Page Content
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextReveal(
                        textOpacityAnimation: textOpacityAnimation,
                        textRevealAnimation: textRevealAnimation,
                        maxHeight: ResponsiveLayout.getResponsiveSize(context,
                            ResponsiveLayout.mainLettersSizeDesktop + 10),
                        controller: controller,
                        child: Text(
                          'Hello,',
                          style: AppStyles.fontStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: ResponsiveLayout.getResponsiveSize(
                                context,
                                ResponsiveLayout.mainLettersSizeDesktop),
                            color: AppStyles.bigLettersColor,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          TextReveal(
                            textOpacityAnimation: textOpacityAnimation,
                            textRevealAnimation: textRevealAnimation,
                            maxHeight: ResponsiveLayout.getResponsiveSize(
                                context,
                                ResponsiveLayout.mainLettersSizeDesktop + 10),
                            controller: controller,
                            child: AutoSizeText(
                              "I'm ",
                              style: AppStyles.fontStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: ResponsiveLayout.getResponsiveSize(
                                    context,
                                    ResponsiveLayout.mainLettersSizeDesktop),
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
                            maxHeight: ResponsiveLayout.getResponsiveSize(
                                context,
                                ResponsiveLayout.mainLettersSizeDesktop + 10),
                            controller: controller,
                            child: AutoSizeText(
                              'Vinicius',
                              style: AppStyles.fontStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize:
                                          ResponsiveLayout.getResponsiveSize(
                                              context,
                                              ResponsiveLayout
                                                  .mainLettersSizeDesktop),
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
                                      decorationColor:
                                          AppStyles.bigLettersColor),
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
                        maxHeight: ResponsiveLayout.getResponsiveSize(context,
                            ResponsiveLayout.occupationLettersSizeDesktop + 10),
                        controller: controller,
                        child: Text(
                          'Flutter Developer',
                          style: AppStyles.fontStyle(
                              fontSize: ResponsiveLayout.getResponsiveSize(
                                  context,
                                  ResponsiveLayout
                                      .occupationLettersSizeDesktop),
                              color: AppStyles.occupationLetterColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextReveal(
                              textOpacityAnimation: textOpacityAnimation,
                              textRevealAnimation: textRevealAnimation,
                              maxHeight: ResponsiveLayout.getResponsiveSize(
                                  context, 220.0),
                              controller: controller,
                              child: AutoSizeText(
                                'Hi, I\'m Vinicius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                                style: AppStyles.fontStyle(
                                    fontSize:
                                        ResponsiveLayout.getResponsiveSize(
                                            context,
                                            ResponsiveLayout
                                                .normalLettersSizeDesktop)),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 200.0,
                          )
                        ],
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
                                ResponsiveLayout.getResponsiveSize(
                                    context, 200.0),
                                60.0),
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
                                      context,
                                      ResponsiveLayout
                                              .cardTitleLettersSizeDesktop -
                                          5),
                                ),
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
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
