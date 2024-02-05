import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter_web/modals/scroll_offset.dart';
import 'package:portfolio_flutter_web/modals/skills.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/widgets/text_reveal.dart';
import '../../constants/style.dart';
import '../../widgets/skill_card/skill_card_mobile.dart';
import '../../widgets/skill_card/skill_card_tablet.dart';
import '../../widgets/skill_card/skill_card_web.dart';

class SecondSection extends StatefulWidget {
  final double secondSectionHeight;

  const SecondSection({super.key, required this.secondSectionHeight});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late double startRange;
  late double endRange;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 375));

    // Determine if the screen width is considered mobile

    super.initState();
  }

  // dispose the controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startRange = MediaQuery.of(context).size.height;
    endRange = 1.8 * startRange;

    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
            buildWhen: (previous, current) {
          if ((current.scrollOffsetValue >= startRange &&
                  current.scrollOffsetValue <= endRange) ||
              controller.isAnimating) {
            return true;
          } else {
            return false;
          }
        }, builder: (context, state) {
          print("Scroll Offset: ${state.scrollOffsetValue}");
          (state.scrollOffsetValue > (startRange + 100))
              ? controller.forward()
              : controller.reverse();
          return TextReveal(
            maxHeight: (ResponsiveLayout.buildWidgetValue(context,
                mobileValue: ResponsiveLayout.mainLettersSizeMobile + 10,
                tabletValue: ResponsiveLayout.mainLettersSizeTablet + 10,
                desktopValue: ResponsiveLayout.mainLettersSizeDesktop + 10)),
            controller: controller,
            child: Text(
              'MY SKILLS',
              style: AppStyles.fontStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: ResponsiveLayout.buildWidgetValue(context,
                      mobileValue: ResponsiveLayout.mainLettersSizeMobile,
                      tabletValue: ResponsiveLayout.mainLettersSizeTablet,
                      desktopValue: ResponsiveLayout.mainLettersSizeDesktop),
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
                          sectionHeight: widget.secondSectionHeight,
                        ),
                        desktopLayout: SkillCardWeb(
                            skill: skill,
                            index: skills.indexOf(skill),
                            sectionHeight: widget.secondSectionHeight),
                        tabletLayout: SkillCardTablet(
                          skill: skill,
                          index: skills.indexOf(skill),
                          sectionHeight: widget.secondSectionHeight,
                        )),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
