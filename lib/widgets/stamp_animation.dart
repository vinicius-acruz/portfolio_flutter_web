import 'dart:ui';
// import dart math
import 'dart:math' as math;
import 'package:flutter/material.dart';

class FlutterStampAnimation extends StatefulWidget {
  const FlutterStampAnimation({Key? key}) : super(key: key);

  @override
  _FlutterStampAnimationState createState() => _FlutterStampAnimationState();
}

class _FlutterStampAnimationState extends State<FlutterStampAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Path _path;
  late Animation<Offset> _pathAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: -math.pi / 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _path = createEllipticalPath();
    _pathAnimation = Tween<Offset>(
      begin: Offset(0.5, 1.0),
      end: Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  Path createEllipticalPath() {
    Path path = Path();
    // Adjust the center and radius here
    Offset ellipseCenter =
        Offset(-100, 0); // Change these values to move the ellipse
    double radius = 200;
    Rect rect = Rect.fromCircle(center: ellipseCenter, radius: radius);
    path.addOval(rect);
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate the offset along the path
        PathMetrics pathMetrics = _path.computeMetrics();
        PathMetric pathMetric = pathMetrics.first;
        Tangent? tangent = pathMetric
            .getTangentForOffset(pathMetric.length * _pathAnimation.value.dx);

        return Transform(
          transform: Matrix4.identity()
            ..translate(tangent!.position.dx, tangent.position.dy)
            ..rotateZ(_rotationAnimation.value) // Apply rotation
            ..scale(_scaleAnimation.value),
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: Image.asset('assets/images/flutter_seal.png'),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
