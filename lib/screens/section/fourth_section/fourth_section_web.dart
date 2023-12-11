import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/style.dart';

class FourthSectionWeb extends StatelessWidget {
  const FourthSectionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: AppStyles.bottomSheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ), // Rounded edges
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Contact me",
                      style: AppStyles.fontStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: AppStyles.bottomLettersContactColor,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Got a project?',
                      style: AppStyles.fontStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        color: AppStyles.bottomLettersColor,
                      ),
                    ),
                    Text(
                      'Let\'s talk!',
                      style: AppStyles.fontStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        color: AppStyles.bottomLettersColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.envelopeCircleCheck,
                            size: 30.0, color: Colors.red),
                        SizedBox(width: 20.0),
                        Text(
                          "vinicius.a.cruz1@gmail.com",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppStyles.bottomLettersColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10.0),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
