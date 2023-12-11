import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';

import '../../constants/style.dart';
import '../../modals/scroll_offset.dart';
import '../../modals/skills.dart';

class SkillCardMobile extends StatefulWidget {
  final Skill skill;
  final int index;

  const SkillCardMobile({super.key, required this.skill, required this.index});

  @override
  State<SkillCardMobile> createState() => _SkillCardMobileState();
}

class _SkillCardMobileState extends State<SkillCardMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    super.initState();
  }

  double getResponsiveCard(BuildContext context, double cardSize) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Adjust this factor based on preference
    const double scaleFactor = 0.0006;
    return screenHeight * scaleFactor * cardSize;
  }

  @override
  Widget build(BuildContext context) {
    final startRange = 950 + widget.index * 100;
    final endRange = 2000 + widget.index * 100; // Adjust the range as needed

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
          color: AppStyles.backgroundColor,
          height: getResponsiveCard(context, 400),
          width: getResponsiveCard(context, 280),
          margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
        ),
        secondChild: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpanded
              ? getResponsiveCard(context, 800)
              : getResponsiveCard(context, 500),
          width: _isExpanded
              ? getResponsiveCard(context, 420)
              : getResponsiveCard(context, 300),
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppStyles.skillCardsColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: AppStyles.skillCardsBorderColor.withOpacity(1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SizedBox(
            height: _isExpanded
                ? getResponsiveCard(context, 800)
                : getResponsiveCard(context, 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.skill.iconData,
                  size: _isExpanded
                      ? ResponsiveLayout.getResponsiveSize(context, 25)
                      : ResponsiveLayout.getResponsiveSize(context, 40),
                  color: AppStyles.skillCardsIconsColor,
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.skill.title,
                  style: AppStyles.fontStyle(
                    fontSize: ResponsiveLayout.getResponsiveSize(
                        context, ResponsiveLayout.cardTitleLettersSizeMobile),
                    fontWeight: FontWeight.bold,
                    color: AppStyles.skillLettersColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 1.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                      if (_isExpanded) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    });
                  },
                  child: Text(
                    _isExpanded ? 'View less' : 'View more',
                    style: AppStyles.fontStyle(
                            fontSize: ResponsiveLayout.getResponsiveSize(
                                context,
                                ResponsiveLayout.normalLettersSizeMobile - 3))
                        .copyWith(
                            shadows: [
                          const Shadow(
                              color: AppStyles.skillLettersColor,
                              offset: Offset(0, -5))
                        ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            decorationColor: AppStyles.skillLettersColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (_isExpanded) // Additional details can be added here
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.skill.description,
                        style: AppStyles.fontStyle(
                            fontSize: ResponsiveLayout.getResponsiveSize(
                                context,
                                ResponsiveLayout.normalLettersSizeMobile),
                            color: AppStyles.skillLettersColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
