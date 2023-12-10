import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/modals/scroll_offset.dart';
import 'package:portfolio_flutter_web/modals/skills.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/widgets/text_reveal.dart';
import '../../constants/style.dart';
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
  late bool isMobile;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 375));

    // Determine if the screen width is considered mobile

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width < 500;

    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
            buildWhen: (previous, current) {
          if ((current.scrollOffsetValue >= 900 &&
                  current.scrollOffsetValue <= 1300) ||
              controller.isAnimating) {
            return true;
          } else {
            return false;
          }
        }, builder: (context, state) {
          print("Scroll Offset: ${state.scrollOffsetValue}");
          (state.scrollOffsetValue > (isMobile ? 950 : 1100))
              ? controller.forward()
              : controller.reverse();
          return TextReveal(
            maxHeight: ResponsiveLayout.getResponsiveSize(context, 70.0),
            controller: controller,
            child: Text(
              'My skills,',
              style: AppStyles.fontStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ResponsiveLayout.getResponsiveSize(context, 40.0),
                  color: AppStyles.bigLettersColor),
            ),
          );
        }),
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
                        mobileLayout: SkillCardMobile(
                          skill: skill,
                          index: skills.indexOf(skill),
                        ),
                        desktopLayout: SkillCardWeb(
                            skill: skill, index: skills.indexOf(skill)),
                        tabletLayout: SkillCardWeb(
                            skill: skill, index: skills.indexOf(skill))),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
