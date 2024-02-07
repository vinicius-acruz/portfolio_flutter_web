import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter_web/modals/descriptions.dart';

class Skill {
  String title;
  String description;
  IconData? iconData;
  String? imagePath;

  Skill({
    required this.title,
    required this.description,
    this.iconData,
    this.imagePath,
  });
}

List<Skill> skills = [
  Skill(
    title: 'Flutter',
    description: flutterDescription,
    iconData: FontAwesomeIcons.mobileScreenButton,
    imagePath: 'assets/images/icons/flutter_icon.png',
  ),
  Skill(
    title: 'Firebase',
    description: firebaseDescription,
    iconData: FontAwesomeIcons.fire,
    imagePath: 'assets/images/icons/firebase_icon.png',
  ),
  Skill(
    title: 'BloC/Provider Package',
    description: blocProviderDescription,
    iconData: FontAwesomeIcons.gears,
    imagePath: 'assets/images/icons/bloc_icon.png',
  ),
  Skill(
    title: 'Version Control Tools',
    description: versionControlDescription,
    iconData: FontAwesomeIcons.codeBranch,
    imagePath: 'assets/images/icons/version_control_icon.png',
  ),
  Skill(
    title: 'Project Management\nTools',
    description: projectManagementDescription,
    iconData: FontAwesomeIcons.listCheck,
    imagePath: 'assets/images/icons/project_icon.png',
  ),
  Skill(
    title: 'HTML/CSS/\nJavascript',
    description: htmlCssJavascriptDescription,
    iconData: FontAwesomeIcons.code,
    imagePath: 'assets/images/icons/html_icon.png',
  ),
  Skill(
    title: 'OpenAI GPT Plugin',
    description: openAIDescription,
    iconData: FontAwesomeIcons.brain,
    imagePath: 'assets/images/icons/openai_icon.png',
  ),
  Skill(
    title: 'UI/UX Design',
    description: uiUxDesignDescription,
    iconData: FontAwesomeIcons.penRuler,
    imagePath: 'assets/images/icons/ux_ui_icon.png',
  ),
  Skill(
    title: 'Flutter Flame',
    description: flutterFlameDescription,
    iconData: FontAwesomeIcons.fire,
    imagePath: 'assets/images/icons/flutter_flame_icon.png',
  ),
  Skill(
    title: 'Flutter APIs',
    description: flutterApisDescription,
    iconData: FontAwesomeIcons.mobileScreenButton,
    imagePath: 'assets/images/icons/flutter_apis_icon.png',
  ),
];
