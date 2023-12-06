import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/modals/skills.dart';
import 'package:portfolio_flutter_web/widgets/text_reveal.dart';

import '../../widgets/skill_card.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({Key? key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 375));
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextReveal(
          maxHeight: 70.0,
          controller: controller,
          child: Text(
            'My skills ,',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 50.0,
            ),
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
