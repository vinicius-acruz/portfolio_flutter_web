import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modals/projects.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: 250.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            height: 650.0,
            width: 500.0,
            margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors
                  .white, // Added a background color for better visibility
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
                                  widget.project.index % 2 == 1 ? 1.0 : -1.0,
                                  1.0),
                              child: Container(
                                height: 500,
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
                                  widget.project.index % 2 == 1 ? -1.0 : 1.0,
                                  1.0),
                              child: Container(
                                height: 500,
                                width: animation.value,
                                color: Colors.white,
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
  }
}
