import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    double getResponsiveSize(double baseFontSize) {
      // adjust this factor based on preference
      const double scaleFactor = 0.0015;
      return screenHeight * scaleFactor * baseFontSize;
    }

    return Stack(
      children: [
        // Page Content
        Container(
          height: screenHeight,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20.0, top: 180.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextReveal(
                textOpacityAnimation: textOpacityAnimation,
                textRevealAnimation: textRevealAnimation,
                maxHeight: getResponsiveSize(60.0),
                controller: controller,
                child: Text(
                  'Hello,',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w900,
                    fontSize: getResponsiveSize(40.0),
                  ),
                ),
              ),
              Row(
                children: [
                  TextReveal(
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    maxHeight: getResponsiveSize(65.0),
                    controller: controller,
                    child: Text(
                      "I'm ",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w900,
                        fontSize: getResponsiveSize(30.0),
                      ),
                    ),
                  ),
                  TextReveal(
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    maxHeight: getResponsiveSize(60.0),
                    controller: controller,
                    child: Text(
                      'Vinicius',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w900,
                        fontSize: getResponsiveSize(30.0),
                        decoration: TextDecoration.underline,
                      ),
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
                  style: GoogleFonts.roboto(
                    fontSize: getResponsiveSize(18.0),
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
                    fixedSize:
                        Size(getResponsiveSize(170.0), getResponsiveSize(40.0)),
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
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: getResponsiveSize(15.0)),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon(
                        Icons.send,
                        color: Colors.white,
                        size: getResponsiveSize(18.0),
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
                          fontSize: getResponsiveSize(15.0),
                          color: Colors.black54),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveSize(25.0),
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
