import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedProgressBubbles extends StatelessWidget {
  final double size;
  final int particlesNumber;
  final double particleSize;
  final Color particleColor;
  final Color progressColor;
  final Color progressBackgroundColor;
  final Color backgroundColor;
  final Duration animationDuration;
  final Duration particleAnimationDuration;
  final double progressValue;
  final double progressStrokeWidth;
  final bool displayPercentage;

  const AnimatedProgressBubbles({
    super.key,
    this.size = 500.0,
    this.particlesNumber = 6,
    this.particleSize = 100.0,
    this.particleColor = Colors.blue,
    this.progressColor = Colors.blue,
    this.progressBackgroundColor = Colors.grey,
    this.backgroundColor = Colors.transparent,
    this.animationDuration = const Duration(seconds: 5),
    this.particleAnimationDuration = const Duration(milliseconds: 1700),
    this.progressStrokeWidth = 30.0,
    this.displayPercentage = false,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progressValue),
            duration: const Duration(
                milliseconds:
                    200), // adjust here to change the speed that the animation will follow progress
            builder: (context, progress, child) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularProgressIndicatorCustom(
                  progressColor: progressColor,
                  progressBackgroundColor: progressBackgroundColor,
                  progressValue: progress,
                  progressStrokeWidth: progressStrokeWidth,
                  displayPercentage: displayPercentage,
                ),
              );
            },
          ),
          MovingCircle(
            ellipseWidth: size * 0.6,
            ellipseHeight: size * 0.3,
            particleSize: particleSize,
            particlesNumber: particlesNumber,
            particleColor: particleColor,
            particleAnimationDuration: particleAnimationDuration,
          ),
        ],
      ),
    );
  }
}

class CircularProgressIndicatorCustom extends StatelessWidget {
  final Color progressColor;
  final Color progressBackgroundColor;
  final double progressValue; // Value from 0 to 100
  final bool displayPercentage;
  final double progressStrokeWidth;

  const CircularProgressIndicatorCustom({
    super.key,
    this.progressColor = Colors.blue,
    this.progressBackgroundColor = Colors.grey,
    required this.progressValue, // Required value
    this.displayPercentage = false,
    this.progressStrokeWidth = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircularProgressPainter(
        progress: progressValue / 100, // Convert to a fraction
        progressColor: progressColor,
        progressBackgroundColor: progressBackgroundColor,
        strokeWidth: progressStrokeWidth,
      ),
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: displayPercentage
              ? Text(
                  '${progressValue.round()}%', // Display the percentage
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : SizedBox(),
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color progressBackgroundColor;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    this.progressColor = Colors.blue,
    this.progressBackgroundColor = Colors.grey,
    this.strokeWidth = 30.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - strokeWidth / 2;
    double backgroundRadius = radius + strokeWidth / 2;

    Paint backgroundPaint = Paint()
      ..color = progressBackgroundColor.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, backgroundRadius, backgroundPaint);

    double angle = 2 * math.pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, angle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LottieLikeAnimation extends StatefulWidget {
  final double particleSize;
  final Color color;
  final Duration animationDuration;

  const LottieLikeAnimation({
    super.key,
    this.particleSize = 100,
    this.color = Colors.blue,
    this.animationDuration = const Duration(milliseconds: 1700),
  });

  @override
  _LottieLikeAnimationState createState() => _LottieLikeAnimationState();
}

class _LottieLikeAnimationState extends State<LottieLikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              height: widget.particleSize,
              width: widget.particleSize,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MovingCircle extends StatefulWidget {
  final double ellipseWidth;
  final double ellipseHeight;
  final double particleSize;
  final Color particleColor;
  final Offset offset;
  final int particlesNumber;
  final Duration particleAnimationDuration;

  const MovingCircle({
    super.key,
    this.ellipseWidth = 500,
    this.ellipseHeight = 200,
    this.particleSize = 100,
    this.particleColor = Colors.blue,
    this.offset = const Offset(0, 0),
    this.particlesNumber = 6,
    this.particleAnimationDuration = const Duration(milliseconds: 1700),
  });

  @override
  _MovingCircleState createState() => _MovingCircleState();
}

class _MovingCircleState extends State<MovingCircle>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Path> _paths = [];
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.particlesNumber; i++) {
      int incrementA = 20;
      int incrementB = 40;
      double ellipseWidth = i.isEven
          ? widget.ellipseWidth - i * incrementA
          : -widget.ellipseWidth + i * incrementB;
      double ellipseHeight = i.isEven
          ? widget.ellipseHeight + i * incrementA
          : -widget.ellipseHeight - i * incrementB;

      Path path = Path()
        ..addOval(Rect.fromCenter(
            center: widget.offset, width: ellipseWidth, height: ellipseHeight));
      _paths.add(path);

      final duration = const Duration(seconds: 4);
      AnimationController controller = AnimationController(
        duration: duration,
        vsync: this,
      );

      double startProgress = _random.nextDouble();
      controller.value = startProgress;
      controller.repeat();

      _controllers.add(controller);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(widget.particlesNumber, (index) {
        return AnimatedBuilder(
          animation: _controllers[index],
          builder: (context, child) {
            PathMetric pathMetric = _paths[index].computeMetrics().first;
            double progress = (_controllers[index].value + 1.0) % 1.0;
            Offset position = pathMetric
                .getTangentForOffset(pathMetric.length * progress)!
                .position;

            return Transform.translate(
              offset: position,
              child: LottieLikeAnimation(
                particleSize: widget.particleSize,
                color: widget.particleColor,
                animationDuration: widget.particleAnimationDuration,
              ),
            );
          },
        );
      }),
    );
  }
}
