import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/modals/pre_cache_images.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
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
      0.4; // 40% of the animation running based on duration
  final double finalAnimationFraction =
      0.2; // 20% of the animation running based on duration

  Future<void> loadImages(BuildContext context) async {
    int totalImages = preCacheImages.length;
    int imagesLoaded = 0;

    // Start with the initial animation
    _animationController.animateTo(
      initialAnimationFraction,
      duration: const Duration(
          milliseconds: 2300), // Duration for the initialAnimationFraction
      curve: Curves.easeOut,
    );

// Start loading GIFs in the background without waiting for them to finish
    for (var gif in preCacheImagesGif) {
      precacheImage(gif, context); // Not using await here
    }

    // Then, load static images and wait for each to finish before proceeding
    for (var image in preCacheImages) {
      await precacheImage(
          image, getContext()); // Using await to ensure completion
      await Future.delayed(const Duration(milliseconds: 100)); // Small delay
      imagesLoaded++;
      double newProgress = (imagesLoaded / totalImages);

      if (newProgress > initialAnimationFraction &&
          newProgress <= (1 - finalAnimationFraction)) {
        // Only use the progress to animate if the newProgress is greater than the initialAnimationFraction
        _animationController.animateTo(
          newProgress,
          duration: const Duration(
              milliseconds: 800), // Adjust duration as needed for smoothness
          curve: Curves.easeOut,
        );
      } else if (newProgress > (1 - finalAnimationFraction)) {
        // Start the final animation phase based on fixed duration
        await _animationController.animateTo(
          1.0,
          duration: const Duration(
              milliseconds:
                  1000), // Calculate duration based on remaining fraction
          curve: Curves.easeOut,
        );
        break; // Exit the loop as the final animation has been triggered
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
          .then((_) => Future.delayed(const Duration(milliseconds: 100))),
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
                  SizedBox(
                    height: ResponsiveLayout.buildWidgetValue(context,
                        mobileValue: 200, tabletValue: 300, desktopValue: 300),
                    child: Lottie.asset(
                      'assets/images/loading_animation.json', // Path to your Lottie file
                      controller: _animationController,
                      frameRate: FrameRate.max,
                      repeat: false,
                      reverse: false,
                      // ... other Lottie parameters
                    ),
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
