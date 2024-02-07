import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/screens/section/first_section/first_section.dart';
import 'package:portfolio_flutter_web/screens/section/fourth_section/fourth_section_mobile.dart';
import 'package:portfolio_flutter_web/screens/section/fourth_section/fourth_section_tablet.dart';
import 'package:portfolio_flutter_web/screens/section/fourth_section/fourth_section_web.dart';
import 'package:portfolio_flutter_web/screens/section/second_section.dart';
import 'package:portfolio_flutter_web/screens/section/third_section/third_section.dart';
import 'package:portfolio_flutter_web/modals/skills.dart';
import '../modals/scroll_offset.dart';

class WholePage extends StatefulWidget {
  const WholePage({super.key});

  @override
  State<WholePage> createState() => _WholePageState();
}

class _WholePageState extends State<WholePage> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();

    super.initState();

    controller.addListener(() {
      // Calculate section heights

      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    double secondSectionHeight = ResponsiveLayout.secondSectionHeight(context,
        skillsLength: skills.length,
        projectWidth: ResponsiveLayout.buildWidgetValue(context,
            mobileValue: ResponsiveLayout.secondChildWidthMobile,
            tabletValue: ResponsiveLayout.secondChildWidthTablet,
            desktopValue: ResponsiveLayout.childWidthDesktop));
    // print(
    //     ' Whole page: second section height: $secondSectionHeight + ${MediaQuery.of(context).size.height}');

    return Container(
      color: AppStyles.backgroundColor,
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            const FirstSection(),
            const SizedBox(
              height: 10.0,
            ),
            SecondSection(
              secondSectionHeight: secondSectionHeight,
            ),
            const SizedBox(
              height: 10.0,
            ),
            ThirdSection(
              secondSectionHeight: secondSectionHeight,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const ResponsiveLayout(
                mobileLayout: FourthSectionMobile(),
                desktopLayout: FourthSectionWeb(),
                tabletLayout: FourthSectionTablet()),
          ],
        ),
      ),
    );
  }
}
