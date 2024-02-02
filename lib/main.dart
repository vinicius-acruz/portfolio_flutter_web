import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/modals/pre_cache_images.dart';
import 'package:portfolio_flutter_web/screens/whole_page.dart';
import 'package:portfolio_flutter_web/widgets/animated_progress_bubbes.dart';
import 'modals/scroll_offset.dart';
import 'dart:async'; // Import this for async operations

void main() {
  runApp(MyApp());
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
                  backgroundColor: Colors.white,
                  body: WholePage(),
                ))
              : const LoadingScreen()), // Disable loading screen when on testing mode
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double loadingProgress = 0;
  late Future<void> _loadingFuture;

  Future<void> loadImages(BuildContext context) async {
    // List of your image assets
    final List<AssetImage> images = preCacheImages;

    int totalImages = images.length;
    int imagesLoaded = 0;

    for (var image in images) {
      await precacheImage(image, context);
      await Future.delayed(const Duration(milliseconds: 100)); // Small delay
      imagesLoaded++;
      loadingProgress = (imagesLoaded / totalImages) * 100;
      setState(() {
        print('Loading progress: $loadingProgress%');
      });
    }
  }

  TweenAnimationBuilder<double> _buildCircularProgressIndicator() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: loadingProgress),
      duration: const Duration(milliseconds: 200),
      builder: (context, progress, child) {
        return AnimatedProgressBubbles(progressValue: progress);
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadingFuture = loadImages(context);
  } // loadImages is called in didChangeDependencies to ensure that it has access to the complete BuildContext.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadingFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // When the loading is done, navigate to the main page
          return const Scaffold(
            backgroundColor: AppStyles.backgroundColor,
            body: WholePage(),
          );
        } else {
          // While loading, show a loading spinner and progress percentage
          return Scaffold(
            backgroundColor: AppStyles.backgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedProgressBubbles(
                    progressValue: loadingProgress,
                  ),
                  const SizedBox(height: 20),
                  Text('${loadingProgress.toStringAsFixed(0)}% Loaded'),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
