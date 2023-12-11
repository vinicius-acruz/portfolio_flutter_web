import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/widgets/project_card/project_card_mobile.dart';
import 'package:portfolio_flutter_web/widgets/text_reveal.dart';
import '../../../constants/style.dart';
import '../../../modals/projects.dart';
import '../../../modals/scroll_offset.dart';
import '../../../widgets/project_card/project_card_web.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({Key? key}) : super(key: key);

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
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
    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if ((current.scrollOffsetValue >= 1900 &&
              current.scrollOffsetValue <= 2300) ||
          controller.isAnimating) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      print("Scroll Offset: ${state.scrollOffsetValue}");
      (state.scrollOffsetValue > 2000)
          ? controller.forward()
          : controller.reverse();
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextReveal(
              maxHeight: ResponsiveLayout.getResponsiveSize(context, 70.0),
              controller: controller,
              child: Text(
                'MY PROJECTS',
                style: AppStyles.fontStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: ResponsiveLayout.getResponsiveSize(context, 40.0),
                  color: AppStyles.bigLettersColor,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20.0,
              runSpacing: 20.0,
              children: projects
                  .map<Widget>((project) => ResponsiveLayout(
                      mobileLayout: ProjectCardMobile(
                        project: project,
                        index: projects.indexOf(project),
                      ),
                      desktopLayout: ProjectCardWeb(
                        project: project,
                        index: projects.indexOf(project),
                      ),
                      tabletLayout: ProjectCardWeb(
                        project: project,
                        index: projects.indexOf(project),
                      )))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}
