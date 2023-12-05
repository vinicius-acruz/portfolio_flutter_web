import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modals/projects.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650.0,
      width: 500.0,
      margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white, // Added a background color for better visibility
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
                          project.imageUrl1,
                          fit: BoxFit.cover,
                          height: 500.0,
                          width: 500.0, // Adjusted width for two images
                        ),
                      ),
                      Align(
                        alignment:
                            Alignment(project.index % 2 == 1 ? 1.0 : -1.0, 1.0),
                        child: Container(
                          height: 500,
                          width: 20.0,
                          color: Colors.blue,
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
                          project.imageUrl2,
                          fit: BoxFit.cover,
                          height: 500.0,
                          width: 500.0, // Adjusted width for two images
                        ),
                      ),
                      Align(
                        alignment:
                            Alignment(project.index % 2 == 1 ? -1.0 : 1.0, 1.0),
                        child: Container(
                          height: 500,
                          width: 20.0,
                          color: Colors.blue,
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
              project.title,
              style: GoogleFonts.quicksand(
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
              project.description,
              style: GoogleFonts.quicksand(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
