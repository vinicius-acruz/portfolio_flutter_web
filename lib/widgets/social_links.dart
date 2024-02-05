import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter_web/constants/my_data.dart';

class MySocialLinks extends StatelessWidget {
  const MySocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => launchURL(linkedInUrl),
          borderRadius: BorderRadius.circular(15),
          child: const FaIcon(FontAwesomeIcons.linkedin,
              size: 30.0, color: Colors.blue), // Adjust for desired ripple area
        ),
        const SizedBox(width: 60.0),
        InkWell(
          onTap: () => launchURL(githubUrl),
          borderRadius: BorderRadius.circular(15),
          child: const FaIcon(FontAwesomeIcons.github,
              size: 30.0,
              color: Colors.black), // Adjust for desired ripple area
        ),
      ],
    );
  }
}
