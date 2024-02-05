import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/modals/pre_cache_images.dart';
import 'package:portfolio_flutter_web/screens/whole_page.dart';
import 'modals/scroll_offset.dart';
import 'dart:async'; // Import this for async operations

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool debugOn = false; // Set to true to disable loading screen

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinícius\' Portfolio',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => DisplayOffset(ScrollOffset(scrollOffsetValue: 0)),
          child: debugOn
              ? (const Scaffold(
                  backgroundColor: AppStyles.backgroundColor,
                  body: WholePage(),
                ))
              : const LoadingScreen()), // Disable loading screen when on testing mode
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  double loadingProgress = 0;
  late Future<void> _loadingFuture;
  late AnimationController _animationController;
  final double initialAnimationFraction =
      0.35; // 35% of the animation running based on duration
  bool initialAnimationCompleted = false;

  Future<void> loadImages(BuildContext context) async {
    final List<AssetImage> images = preCacheImages;
    int totalImages = images.length;
    int imagesLoaded = 0;

    // Start with the initial animation
    _animationController.animateTo(
      initialAnimationFraction,
      duration: const Duration(
          milliseconds: 1500), // Duration for the initialAnimationFraction
      curve: Curves.easeOut,
    );

    for (var image in images) {
      await precacheImage(image, getContext());
      await Future.delayed(const Duration(milliseconds: 100)); // Small delay
      imagesLoaded++;
      double newProgress =
          (imagesLoaded / totalImages) * (1 - initialAnimationFraction) +
              initialAnimationFraction;

      if (newProgress > initialAnimationFraction) {
        // Only use the progress to animate if the newProgress is greater than the initialAnimationFraction
        _animationController.animateTo(
          newProgress,
          duration: const Duration(
              milliseconds: 400), // Adjust duration as needed for smoothness
          curve: Curves.easeOut,
        );
      }
    }
  }

  // create a method to get context
  BuildContext getContext() {
    return context;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadingFuture = loadImages(context);
  } // loadImages is called in didChangeDependencies to ensure that it has access to the complete BuildContext.

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadingFuture
          .then((_) => Future.delayed(const Duration(milliseconds: 200))),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: WholePage(),
          );
        } else {
          return Scaffold(
            backgroundColor: AppStyles.backgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/loading_animation.json', // Path to your Lottie file
                    controller: _animationController,
                    frameRate: FrameRate.max,
                    repeat: false,
                    reverse: false,
                    // ... other Lottie parameters
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
