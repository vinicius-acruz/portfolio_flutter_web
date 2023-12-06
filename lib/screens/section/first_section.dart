import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_reveal.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> buttonAnimation;
  late Animation<double> patternAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 375),
    );

    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));

    buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 1, curve: Curves.easeOut)));

    patternAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 1, curve: Curves.easeOut)));

    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      controller.forward();
    });
  }

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
          child: Container(
            height: 920,
            child: Image.asset('assets/images/listras.png'),
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
                        child: Text(
                          'Hello ,',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w900,
                            fontSize: 70.0,
                          ),
                        ),
                        textOpacityAnimation: textOpacityAnimation,
                        textRevealAnimation: textRevealAnimation,
                        maxHeight: 100.0,
                        controller: controller,
                      ),
                      Row(
                        children: [
                          TextReveal(
                            child: Text(
                              "I'm ",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w900,
                                fontSize: 70.0,
                              ),
                            ),
                            textOpacityAnimation: textOpacityAnimation,
                            textRevealAnimation: textRevealAnimation,
                            maxHeight: 100.0,
                            controller: controller,
                          ),
                          TextReveal(
                            child: Text(
                              'Vinicius',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 70.0,
                                  decoration: TextDecoration.underline),
                            ),
                            textOpacityAnimation: textOpacityAnimation,
                            textRevealAnimation: textRevealAnimation,
                            maxHeight: 100.0,
                            controller: controller,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextReveal(
                        child: Text(
                          'Flutter Developer',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        textOpacityAnimation: textOpacityAnimation,
                        textRevealAnimation: textRevealAnimation,
                        maxHeight: 35.0,
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextReveal(
                              child: Text(
                                'Hi, I\'m Vinicius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              textOpacityAnimation: textOpacityAnimation,
                              textRevealAnimation: textRevealAnimation,
                              maxHeight: 200.0,
                              controller: controller,
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reach Me',
                                style: TextStyle(color: Colors.white),
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

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({Key? key}) : super(key: key);

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 920.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/vini.png'),
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            if (_controller.isDismissed) {
              _controller.forward();
            }
          });
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    height: 920.0,
                    width: double.infinity,
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: _animation.value,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  )
                ],
              );
            },
            child: child,
          );
        } else {
          // Display a loading indicator or placeholder while the image is loading.
          return Center(child: Container());
        }
      },
    );
  }
}

class SecondPageImage extends StatefulWidget {
  const SecondPageImage({Key? key}) : super(key: key);

  @override
  State<SecondPageImage> createState() => _SecondPageImageState();
}

class _SecondPageImageState extends State<SecondPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 920.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/fundo1.png'),
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            if (_controller.isDismissed) {
              _controller.forward();
            }
          });
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    height: 920.0,
                    width: double.infinity,
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: _animation.value,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  )
                ],
              );
            },
            child: child,
          );
        } else {
          // Display a loading indicator or placeholder while the image is loading.
          return Center(child: Container());
        }
      },
    );
  }
}
