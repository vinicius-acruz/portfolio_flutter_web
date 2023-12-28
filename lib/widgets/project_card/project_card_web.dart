import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import '../../constants/style.dart';
import '../../modals/projects.dart';
import '../../modals/scroll_offset.dart';

class ProjectCardWeb extends StatefulWidget {
  final Project project;
  final int index;
  final double secondSectionHeight;

  const ProjectCardWeb(
      {super.key,
      required this.project,
      required this.index,
      required this.secondSectionHeight});

  @override
  State<ProjectCardWeb> createState() => _ProjectCardWebState();
}

class _ProjectCardWebState extends State<ProjectCardWeb>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double projectCardHeight = 680.0;
  double projectCardWidth = 500.0;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: ResponsiveLayout.projectCardWidthDesktop, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//call the responsive layout method to get the index of projects in same line
    final lineIndex = ResponsiveLayout.getWidgetIndex(context,
        index: widget.index,
        projectWidth: ResponsiveLayout.getResponsiveCard(
            context, ResponsiveLayout.projectCardWidthDesktop));

    final startRange =
        widget.secondSectionHeight + 150 + lineIndex * projectCardHeight;

    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOffsetValue >= startRange) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      print('Card ${widget.index}: project line $lineIndex ');
      state.scrollOffsetValue > (startRange + 100)
          ? controller.forward()
          : controller.reverse();
      return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: ResponsiveLayout.getResponsiveCard(
                  context, ResponsiveLayout.projectCardHeightDesktop),
              width: ResponsiveLayout.getResponsiveCard(
                  context, ResponsiveLayout.projectCardWidthDesktop),
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppStyles
                      .backgroundColor), // Added a background color for better visibility),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.asset(
                                  widget.project.imageUrl1,
                                ),
                              ),
                              Align(
                                alignment: Alignment(
                                    widget.project.index % 2 == 1
                                        ? 1.0
                                        : -1.0, //Animation alignment
                                    1.0),
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
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.network(
                                  widget.project.projectAnimation,
                                  fit: BoxFit.cover,
                                  scale: 0.5,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
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
                      ],
                    ),
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
                                  ResponsiveLayout.cardTitleLettersSizeDesktop),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          child: Text(
                            widget.project.description,
                            style: AppStyles.fontStyle(
                              fontSize: ResponsiveLayout.getResponsiveSize(
                                  context,
                                  ResponsiveLayout.normalLettersSizeDesktop),
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
