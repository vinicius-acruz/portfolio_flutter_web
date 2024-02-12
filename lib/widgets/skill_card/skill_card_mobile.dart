import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';

import '../../constants/style.dart';
import '../../modals/scroll_offset.dart';
import '../../modals/skills.dart';

class SkillCardMobile extends StatefulWidget {
  final Skill skill;
  final int index;
  final double sectionHeight;
  final bool useImage;

  const SkillCardMobile(
      {super.key,
      required this.skill,
      required this.index,
      required this.sectionHeight,
      this.useImage = true});

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

  @override
  Widget build(BuildContext context) {
    double skillWidth = ResponsiveLayout.secondChildWidthMobile + 10;
    double skillHeight = ResponsiveLayout.secondChildHeightMobile + 10;

    final lineIndex = ResponsiveLayout.getWidgetIndex(context,
        index: widget.index, projectWidth: skillWidth);
    print('skill ${widget.index}, line index: $lineIndex');

    final startRange =
        MediaQuery.of(context).size.height + 100 + lineIndex * skillHeight;

    //final startRange = MediaQuery.of(context).size.height;
    final endRange = 1.5 * widget.sectionHeight +
        widget.index * 150; //  constants to adjust the range as needed

    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      // Return true if the current scroll offset is within the calculated range
      return (current.scrollOffsetValue >= startRange &&
          current.scrollOffsetValue <= endRange);
    }, builder: (context, state) {
      if (state.scrollOffsetValue >= (endRange - 200) &&
          state.scrollOffsetValue <= (endRange)) {
        _isExpanded = false;
      }
      return AnimatedCrossFade(
        crossFadeState: (state.scrollOffsetValue >= (startRange + 50))
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 400),
        alignment: Alignment.center,
        firstCurve: Curves.easeOut,
        secondCurve: Curves.easeOut,
        firstChild: Container(
          color: AppStyles.backgroundColor,
          height: ResponsiveLayout.firstChildHeightMobile,
          width: ResponsiveLayout.firstChildWidthMobile,
          margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
        ),
        secondChild: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpanded
              ? ResponsiveLayout.expandedContainerHeightMobile
              : ResponsiveLayout.secondChildHeightMobile,
          width: _isExpanded
              ? ResponsiveLayout.expandedContainerWidthMobile
              : ResponsiveLayout.secondChildWidthMobile,
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
          child: GestureDetector(
            onTap: () => setState(() {
              _isExpanded = !_isExpanded;
              if (_isExpanded) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            }),
            child: SizedBox(
              height: _isExpanded
                  ? ResponsiveLayout.expandedContainerHeightMobile
                  : ResponsiveLayout.secondChildHeightMobile,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.useImage
                      ? Image.asset(
                          widget.skill.imagePath!,
                          height: _isExpanded ? 25 : 40,
                        )
                      : Icon(
                          widget.skill.iconData,
                          size: _isExpanded ? 25 : 40,
                          color: AppStyles.skillCardsIconsColor,
                        ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.skill.title,
                    style: AppStyles.fontStyle(
                      fontSize: ResponsiveLayout.cardTitleLettersSizeMobile - 4,
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
                              fontSize:
                                  ResponsiveLayout.normalLettersSizeMobile - 3)
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
                              fontSize:
                                  ResponsiveLayout.normalLettersSizeMobile - 2,
                              color: AppStyles.skillLettersColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
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
