import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/style.dart';
import '../../modals/projects.dart';
import '../../modals/scroll_offset.dart';

class ProjectCardWeb extends StatefulWidget {
  final Project project;
  final int index;

  const ProjectCardWeb({Key? key, required this.project, required this.index})
      : super(key: key);

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
    animation = Tween(begin: 250.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Setting the same start range for projects in the same line
    final screenWidth = MediaQuery.of(context).size.width;
    final projectsPerLine = (screenWidth / (projectCardWidth + 20))
        .floor(); // Assuming each card is 500 wide with 20 spacing
    final lineIndex = projectsPerLine == 0
        ? 0
        : widget.index ~/
            projectsPerLine; //Avoid error for screens with width below projectCardWidth+20
    final startRange = 2100 + lineIndex * 500;

    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOffsetValue >= startRange) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      print('Card ${widget.index}: project line $lineIndex');
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 500.0,
                    width: 500.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.network(
                                  widget.project.imageUrl1,
                                  fit: BoxFit.cover,
                                  height: 500.0,
                                  width: 250.0, // Adjusted width for two images
                                ),
                              ),
                              Align(
                                alignment: Alignment(
                                    widget.project.index % 2 == 1
                                        ? 1.0
                                        : -1.0, //Animation alignment
                                    1.0),
                                child: Container(
                                  height: 500,
                                  width: animation.value,
                                  color: AppStyles.backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.network(
                                  widget.project.imageUrl2,
                                  fit: BoxFit.cover,
                                  height: 500.0,
                                  width: 250.0, // Adjusted width for two images
                                ),
                              ),
                              Align(
                                alignment: Alignment(
                                    widget.project.index % 2 == 1
                                        ? -1.0
                                        : 1.0, //Animation alignment
                                    1.0),
                                child: Container(
                                  height: 500,
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
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.project.title,
                    style: AppStyles.fontStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                width: 100.0,
                                child: Image.asset(
                                  widget.project.projectIcon,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Click the icon',
                                style: AppStyles.fontStyle(
                                  fontSize: 12.0,
                                ).copyWith(
                                    shadows: [
                                      Shadow(
                                          color: Colors.black54,
                                          offset: Offset(0, -3))
                                    ],
                                    color: Colors.transparent,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    decorationColor: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100.0,
                                child: Text(
                                  widget.project.description,
                                  style: AppStyles.fontStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
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
