import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';

import '../../../constants/style.dart';

class FourthSectionMobile extends StatelessWidget {
  const FourthSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      //margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: AppStyles.bottomSheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ), // Rounded edges
      ),
      //padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contact me",
                style: AppStyles.fontStyle(
                  fontSize: ResponsiveLayout.bottomSheetLetterSizeMobile,
                  fontWeight: FontWeight.w500,
                  color: AppStyles.bottomLettersContactColor,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'Got a project?',
                style: AppStyles.fontStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveLayout.bottomSheetLetterSizeMobile,
                  color: AppStyles.bottomLettersColor,
                ),
              ),
              Text(
                'Let\'s talk!',
                style: AppStyles.fontStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveLayout.bottomSheetLetterSizeMobile,
                  color: AppStyles.bottomLettersColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.envelopeCircleCheck,
                  size: 30.0, color: Colors.red),
              SizedBox(width: 20.0),
              Text(
                "vinicius.a.cruz1@gmail.com",
                style: TextStyle(
                  fontSize: ResponsiveLayout.normalLettersSizeMobile,
                  fontWeight: FontWeight.bold,
                  color: AppStyles.bottomLettersColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0)),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.linkedin,
                    size: 30.0, color: Colors.blue),
                SizedBox(
                  width: 60.0,
                ),
                FaIcon(FontAwesomeIcons.github,
                    size: 30.0, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
