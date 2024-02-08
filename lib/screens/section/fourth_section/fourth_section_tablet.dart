import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';
import 'package:portfolio_flutter_web/widgets/social_links.dart';
import 'package:auto_size_text/auto_size_text.dart'; // Import AutoSizeText

import '../../../constants/style.dart';

class FourthSectionTablet extends StatelessWidget {
  const FourthSectionTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: AppStyles.bottomSheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Contact me",
                      style: AppStyles.fontStyle(
                        fontSize:
                            ResponsiveLayout.bottomSheetLetterSizeTablet - 5,
                        fontWeight: FontWeight.w500,
                        color: AppStyles.bottomLettersContactColor,
                      ),
                      minFontSize: 10, // Minimum font size
                      stepGranularity: 1, // Font size step for resizing
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10.0),
                    AutoSizeText(
                      'Got a project?',
                      style: AppStyles.fontStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveLayout.bottomSheetLetterSizeTablet,
                        color: AppStyles.bottomLettersColor,
                      ),
                      minFontSize: 10,
                      stepGranularity: 1,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Let\'s talk!',
                      style: AppStyles.fontStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveLayout.bottomSheetLetterSizeTablet,
                        color: AppStyles.bottomLettersColor,
                      ),
                      minFontSize: 10,
                      stepGranularity: 1,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(FontAwesomeIcons.envelopeCircleCheck,
                            size: 30.0, color: Colors.red),
                        const SizedBox(width: 20.0),
                        Expanded(
                          // Wrap the text with Expanded
                          child: AutoSizeText(
                            "vinicius.a.cruz1@gmail.com",
                            textAlign: TextAlign.start,
                            style: AppStyles.fontStyle(
                              fontSize:
                                  ResponsiveLayout.normalLettersSizeTablet,
                              fontWeight: FontWeight.w500,
                              color: AppStyles.bottomLettersColor,
                            ),
                            minFontSize: 10,
                            stepGranularity: 1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(5.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MySocialLinks(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
