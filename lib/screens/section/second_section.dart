import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/modals/skills.dart';

import '../../widgets/skill_card.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({Key? key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'My skills ,',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            fontSize: 50.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20.0,
              runSpacing: 20.0,
              children: skills
                  .map<Widget>((skill) => SkillCard(
                        skill: skill,
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
