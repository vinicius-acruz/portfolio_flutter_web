import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/screens/section/first_section/first_section_tablet.dart';
import 'first_section_mobile.dart';
import 'first_section_web.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

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
      duration: const Duration(milliseconds: 2000),
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

    patternAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 1, curve: Curves.easeOut)));

    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  // dispose the controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: FirstSectionMobile(
          patternAnimation: patternAnimation,
          textOpacityAnimation: textOpacityAnimation,
          textRevealAnimation: textRevealAnimation,
          controller: controller,
          buttonAnimation: buttonAnimation),
      tabletLayout: FirstSectionTablet(
          patternAnimation: patternAnimation,
          textOpacityAnimation: textOpacityAnimation,
          textRevealAnimation: textRevealAnimation,
          controller: controller,
          buttonAnimation: buttonAnimation),
      desktopLayout: FirstSectionWeb(
          patternAnimation: patternAnimation,
          textOpacityAnimation: textOpacityAnimation,
          textRevealAnimation: textRevealAnimation,
          controller: controller,
          buttonAnimation: buttonAnimation),
    );
  }
}

class FirstPageImage extends StatefulWidget {
  final double height;

  const FirstPageImage({super.key, required this.height});

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
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 1500, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    super.initState();
  }

  // dispose the controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('assets/images/vini.png'),
      fit: BoxFit.contain,
      alignment: Alignment.topRight,
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
                    height: widget.height,
                    width: double.infinity,
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: _animation.value,
                      width: double.infinity,
                      color: AppStyles.backgroundColor,
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
  final double height;
  const SecondPageImage({super.key, required this.height});

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
    _animation = Tween<double>(begin: 1500, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    super.initState();
  }

  // dispose the controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('images/fundo1.png'),
      fit: BoxFit.fitHeight,
      alignment: Alignment.topRight,
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
                    height: widget.height,
                    width: double.infinity,
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: _animation.value,
                      width: double.infinity,
                      color: AppStyles.backgroundColor,
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
