import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/widgets/project_card/project_card_mobile.dart';
import 'package:portfolio_flutter_web/widgets/project_card/project_card_tablet.dart';
import 'package:portfolio_flutter_web/widgets/text_reveal.dart';
import '../../../constants/style.dart';
import '../../../modals/projects.dart';
import '../../../modals/scroll_offset.dart';
import '../../../widgets/project_card/project_card_web.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdSection extends StatefulWidget {
  final double secondSectionHeight;

  const ThirdSection({super.key, required this.secondSectionHeight});

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
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

  @override
  Widget build(BuildContext context) {
    startRange = widget.secondSectionHeight;
    endRange = startRange + 300;

    return BlocBuilder<DisplayOffset, ScrollOffset>(
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
      (state.scrollOffsetValue > startRange + 100)
          ? controller.forward()
          : controller.reverse();
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextReveal(
              maxHeight: ResponsiveLayout.getResponsiveSize(
                  context,
                  (ResponsiveLayout.buildWidgetValue(context,
                      mobileValue: ResponsiveLayout.mainLettersSizeMobile + 10,
                      tabletValue: ResponsiveLayout.mainLettersSizeTablet + 10,
                      desktopValue:
                          ResponsiveLayout.mainLettersSizeDesktop + 10))),
              controller: controller,
              child: Text(
                'MY PROJECTS',
                style: AppStyles.fontStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: ResponsiveLayout.getResponsiveSize(
                        context,
                        (ResponsiveLayout.buildWidgetValue(context,
                            mobileValue: ResponsiveLayout.mainLettersSizeMobile,
                            tabletValue: ResponsiveLayout.mainLettersSizeTablet,
                            desktopValue:
                                ResponsiveLayout.mainLettersSizeDesktop - 5))),
                    color: AppStyles.bigLettersColor),
              ),
            ),
            const SizedBox(height: 20.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 30.0,
              runSpacing: 20.0,
              children: projects
                  .map<Widget>((project) => ResponsiveLayout(
                      mobileLayout: ProjectCardMobile(
                        project: project,
                        index: projects.indexOf(project),
                        secondSectionHeight: widget.secondSectionHeight,
                      ),
                      desktopLayout: ProjectCardWeb(
                        project: project,
                        index: projects.indexOf(project),
                        secondSectionHeight: widget.secondSectionHeight,
                      ),
                      tabletLayout: ProjectCardTablet(
                        project: project,
                        index: projects.indexOf(project),
                        secondSectionHeight: widget.secondSectionHeight,
                      )))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}
