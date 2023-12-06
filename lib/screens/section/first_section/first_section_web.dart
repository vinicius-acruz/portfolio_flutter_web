import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Stack(
      children: [
        const Positioned.fill(
          child: SecondPageImage(),
        ),
        SizeTransition(
          sizeFactor: patternAnimation,
          axis: Axis.horizontal,
          child: SizedBox(
            height: 920,
            child: Image.asset('assets/images/listraswide.png'),
          ),
        ),
        const Positioned.fill(
          child: FirstPageImage(),
        ),

        // Page Content
        SizedBox(
          height: 920,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextReveal(
                        textOpacityAnimation: textOpacityAnimation,
                        textRevealAnimation: textRevealAnimation,
                        maxHeight: 100.0,
                        controller: controller,
                        child: Text(
                          'Hello,',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w900,
                            fontSize: 70.0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          TextReveal(
                            textOpacityAnimation: textOpacityAnimation,
                            textRevealAnimation: textRevealAnimation,
                            maxHeight: 100.0,
                            controller: controller,
                            child: Text(
                              "I'm ",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w900,
                                fontSize: 70.0,
                              ),
                            ),
                          ),
                          TextReveal(
                            textOpacityAnimation: textOpacityAnimation,
                            textRevealAnimation: textRevealAnimation,
                            maxHeight: 100.0,
                            controller: controller,
                            child: Text(
                              'Vinicius',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 70.0,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextReveal(
                        textOpacityAnimation: textOpacityAnimation,
                        textRevealAnimation: textRevealAnimation,
                        maxHeight: 35.0,
                        controller: controller,
                        child: const Text(
                          'Flutter Developer',
                          style: TextStyle(fontSize: 25.0),
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
                              maxHeight: 200.0,
                              controller: controller,
                              child: const Text(
                                'Hi, I\'m Vinicius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                                style: TextStyle(fontSize: 16.0),
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
                            fixedSize: const Size(200.0, 60.0),
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reach Me',
                                style: GoogleFonts.roboto(color: Colors.white),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Icon(
                                Icons.send,
                                color: Colors.white,
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
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
