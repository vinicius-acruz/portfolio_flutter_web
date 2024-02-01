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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => DisplayOffset(ScrollOffset(scrollOffsetValue: 0)),
          child: const LoadingScreen()), // Change to LoadingScreen
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  double loadingProgress = 0;
  late Future<void> _loadingFuture;
  late AnimationController _animationController;

  Future<void> loadImages(BuildContext context) async {
    final List<AssetImage> images = preCacheImages;
    int totalImages = images.length;
    int imagesLoaded = 0;

    for (var image in images) {
      await precacheImage(image, context).then((_) {
        imagesLoaded++;
        double newProgress = (imagesLoaded / totalImages);

        _animationController.animateTo(
          newProgress,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      });
    }
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
          .then((_) => Future.delayed(Duration(milliseconds: 100))),
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
