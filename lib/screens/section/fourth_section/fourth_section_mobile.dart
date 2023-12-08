import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FourthSectionMobile extends StatelessWidget {
  const FourthSectionMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0), // Rounded edges
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contact me",
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Got a project?',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                ),
              ),
              Text(
                'Let\'s talk!',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20.0),
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
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.all(10.0),
            child: Row(
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
