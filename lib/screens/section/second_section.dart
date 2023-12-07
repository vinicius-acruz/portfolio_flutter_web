import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/modals/skills.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/widgets/text_reveal.dart';
import '../../widgets/skill_card/skill_card_mobile.dart';
import '../../widgets/skill_card/skill_card_web.dart';

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
          maxHeight: ResponsiveLayout.getResponsiveSize(context, 70.0),
          controller: controller,
          child: Text(
            'My skills,',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: ResponsiveLayout.getResponsiveSize(context, 50.0),
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
                  .map<Widget>(
                    (skill) => ResponsiveLayout(
                        mobileLayout: SkillCardMobile(skill: skill),
                        desktopLayout: SkillCardWeb(skill: skill),
                        tabletLayout: SkillCardWeb(skill: skill)),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
