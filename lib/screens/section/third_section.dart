import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../modals/projects.dart';
import '../../widgets/project_card.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({Key? key}) : super(key: key);

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My skills ,',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w700,
              fontSize: 50.0,
            ),
          ),
          SizedBox(height: 20.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20.0,
            runSpacing: 20.0,
            children: projects
                .map<Widget>((project) => ProjectCard(project: project))
                .toList(),
          ),
        ],
      ),
    );
  }
}
