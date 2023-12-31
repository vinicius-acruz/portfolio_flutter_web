import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import '../../constants/style.dart';
import '../../modals/projects.dart';
import '../../modals/scroll_offset.dart';
import 'package:lottie/lottie.dart';

class ProjectCardMobile extends StatefulWidget {
  final Project project;
  final int index;
  final double secondSectionHeight;

  const ProjectCardMobile(
      {super.key,
      required this.project,
      required this.index,
      required this.secondSectionHeight});

  @override
  State<ProjectCardMobile> createState() => _ProjectCardMobileState();
}

class _ProjectCardMobileState extends State<ProjectCardMobile>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  late double startRange;

  double projectCardHeight = 650.0;
  double projectCardWidth = 500.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: 500.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final startRange = widget.secondSectionHeight + 200 + widget.index * 600;

    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOffsetValue >= startRange) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      print('Card ${widget.index}: project line $startRange');
      state.scrollOffsetValue > (startRange + 100)
          ? controller.forward()
          : controller.reverse();
      return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: projectCardHeight,
              width: projectCardWidth,
              margin:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppStyles
                    .backgroundColor, // Added a background color for better visibility
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.network(
                            'assets/images/projects/project1/project1_animation.gif',
                            fit: BoxFit.cover,
                            scale: 0.5,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Image.asset(widget.project
                                  .imageUrl1); // Display placeholder image while the network image is loading
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment(
                            widget.project.index % 2 == 1
                                ? 1.0
                                : -1.0, //Animation alignment
                            1.0,
                          ),
                          child: Container(
                            width: animation.value,
                            color: AppStyles.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.project.title,
                      style: AppStyles.fontStyle(
                        fontSize: ResponsiveLayout.getResponsiveSize(context,
                            ResponsiveLayout.cardTitleLettersSizeMobile),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.project.description,
                      style: AppStyles.fontStyle(
                          fontSize: ResponsiveLayout.getResponsiveSize(context,
                              ResponsiveLayout.normalLettersSizeMobile),
                          color: AppStyles.lettersColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
