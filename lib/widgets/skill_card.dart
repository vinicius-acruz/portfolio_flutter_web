import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/skills.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
      width: 400.0,
      margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            skill.iconData,
            size: 40.0,
            color: Colors.indigo,
          ),
          SizedBox(height: 15.0),
          Text(
            skill.title,
            style: GoogleFonts.quicksand(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            skill.description,
            style: GoogleFonts.quicksand(
              fontSize: 14.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
