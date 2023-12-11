import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import '../../constants/style.dart';
import '../../modals/projects.dart';
import '../../modals/scroll_offset.dart';

class ProjectCardTablet extends StatefulWidget {
  final Project project;
  final int index;

  const ProjectCardTablet(
      {super.key, required this.project, required this.index});

  @override
  State<ProjectCardTablet> createState() => _ProjectCardTabletState();
}

class _ProjectCardTabletState extends State<ProjectCardTablet>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double projectCardHeight = 1100.0;
  double projectCardWidth = 400.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: projectCardWidth, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lineIndex = ResponsiveLayout.getWidgetIndex(context,
        index: widget.index, projectWidth: projectCardWidth);

    final startRange = 2300 + lineIndex * 700;

    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOffsetValue >= startRange) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      print(
          'Card ${widget.index}: project line $lineIndex, scrolloffset: ${state.scrollOffsetValue}, ');
      state.scrollOffsetValue > (startRange + 300)
          ? controller.forward()
          : controller.reverse();
      return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: projectCardHeight,
              width: projectCardWidth,
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
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
                    flex: 2,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.network(
                            widget.project.imageUrl1,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Lottie.asset(
                            'assets/images/projects/project1/project1_animation.json',
                            fit: BoxFit.cover,
                            width: projectCardWidth / 2,
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
                    height: 8.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            widget.project.title,
                            style: AppStyles.fontStyle(
                              fontSize: ResponsiveLayout.getResponsiveSize(
                                  context,
                                  ResponsiveLayout.cardTitleLettersSizeTablet),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10.0),
                          child: Text(
                            widget.project.description,
                            style: AppStyles.fontStyle(
                              fontSize: ResponsiveLayout.getResponsiveSize(
                                  context,
                                  ResponsiveLayout.normalLettersSizeTablet),
                              fontWeight: FontWeight.w500,
                              color: AppStyles.lettersColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
