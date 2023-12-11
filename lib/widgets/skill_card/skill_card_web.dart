import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/modals/scroll_offset.dart';
import '../../constants/style.dart';
import '../../modals/skills.dart';

class SkillCardWeb extends StatefulWidget {
  final Skill skill;
  final int index;

  const SkillCardWeb({super.key, required this.skill, required this.index});

  @override
  State<SkillCardWeb> createState() => _SkillCardWebState();
}

class _SkillCardWebState extends State<SkillCardWeb> {
  bool animateCard = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final startRange = 1100 + widget.index * 50;
    final endRange = 2200 + widget.index * 50; // Adjust the range as needed

    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      // Return true if the current scroll offset is within the calculated range
      return (current.scrollOffsetValue >= startRange &&
          current.scrollOffsetValue <= endRange);
    }, builder: (context, state) {
      print("skillcard: ${state.scrollOffsetValue}");
      return AnimatedCrossFade(
        crossFadeState: (state.scrollOffsetValue >= (startRange + 100) &&
                state.scrollOffsetValue <= (endRange - 100))
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 400),
        alignment: Alignment.center,
        firstCurve: Curves.easeOut,
        secondCurve: Curves.easeOut,
        firstChild: Container(
          height: 260.0,
          width: 400.0,
          margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
        ),
        secondChild: Container(
          height: 260.0,
          width: 400.0,
          margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppStyles.skillCardsColor,
            borderRadius: BorderRadius.circular(20.0),
            //border: Border.all(color: Colors.blue, width: 2.0),
            boxShadow: [
              BoxShadow(
                color: AppStyles.skillCardsBorderColor.withOpacity(1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.skill.iconData,
                  size: 40.0,
                  color: AppStyles.skillCardsIconsColor,
                ),
                const SizedBox(height: 15.0),
                Text(
                  widget.skill.title,
                  style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppStyles.skillLettersColor,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.skill.description,
                  style: GoogleFonts.quicksand(
                    fontSize: 14.0,
                    color: AppStyles.skillLettersColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
