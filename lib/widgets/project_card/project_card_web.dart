import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/modals/projects.dart';
import 'package:portfolio_flutter_web/modals/scroll_offset.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';

class ProjectCardWeb extends StatefulWidget {
  final Project project;
  final int index;
  final double secondSectionHeight;

  const ProjectCardWeb({
    super.key,
    required this.project,
    required this.index,
    required this.secondSectionHeight,
  });

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
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: ResponsiveLayout.projectCardWidthDesktop, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                color: AppStyles.backgroundColor,
              ),
              child: widget.project.orientation == ProjectOrientation.vertical
                  ? buildVerticalLayout()
                  : buildHorizontalLayout(),
            );
          });
    });
  }

  Widget buildVerticalLayout() {
    return Column(
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
                      child: Image.asset(
                        widget.project.projectAnimation,
                        fit: BoxFit.cover,
                        scale: 0.5,
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
        buildProjectInfo(),
      ],
    );
  }

  Widget buildHorizontalLayout() {
    // Existing design for horizontal projects
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
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
                      child: Image.asset(
                        widget.project.projectAnimation,
                        fit: BoxFit.cover,
                        scale: 0.5,
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
        buildProjectInfo(),
      ],
    );
  }

  Widget buildProjectInfo() {
    return Expanded(
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
                  ResponsiveLayout.cardTitleLettersSizeDesktop,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Text(
              widget.project.description,
              style: AppStyles.fontStyle(
                fontSize: ResponsiveLayout.getResponsiveSize(
                  context,
                  ResponsiveLayout.normalLettersSizeDesktop,
                ),
                color: AppStyles.lettersColor,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
