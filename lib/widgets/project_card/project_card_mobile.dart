import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../modals/projects.dart';
import '../../modals/scroll_offset.dart';
import 'package:lottie/lottie.dart';

class ProjectCardMobile extends StatefulWidget {
  final Project project;
  final int index;

  const ProjectCardMobile(
      {Key? key, required this.project, required this.index})
      : super(key: key);

  @override
  State<ProjectCardMobile> createState() => _ProjectCardMobileState();
}

class _ProjectCardMobileState extends State<ProjectCardMobile>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
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
    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   controller.forward();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final startRange = 1900 + widget.index * 600;

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
                color: Colors
                    .white, // Added a background color for better visibility
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.network(
                                  widget.project.imageUrl1,
                                  fit: BoxFit.cover,
                                  width: (projectCardWidth / 2),
                                ),
                              ),
                              Container(
                                child: Lottie.asset(
                                    'assets/images/projects/project1/project1_animation.json',
                                    fit: BoxFit.cover,
                                    width: projectCardWidth / 2),
                              ),
                              Align(
                                alignment: Alignment(
                                    widget.project.index % 2 == 1
                                        ? 1.0
                                        : -1.0, //Animation alignment
                                    1.0),
                                child: Container(
                                  width: animation.value,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        //Commented the second image, not to show for mobile
                        // Expanded(
                        //   child: Stack(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.all(1.0),
                        //         child: Image.network(
                        //           widget.project.imageUrl2,
                        //           fit: BoxFit.cover,
                        //           height: 500.0,
                        //           width: 250.0, // Adjusted width for two images
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment(
                        //             widget.project.index % 2 == 1
                        //                 ? -1.0
                        //                 : 1.0, //Animation alignment
                        //             1.0),
                        //         child: Container(
                        //           height: 500,
                        //           width: animation.value,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ), //
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.project.title,
                      style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
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
                      style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
