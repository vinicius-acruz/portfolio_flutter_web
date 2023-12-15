import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Skill {
  String title;
  String description;
  IconData iconData;

  Skill({
    required this.title,
    required this.description,
    required this.iconData,
  });
}

List<Skill> skills = [
  Skill(
    title: 'Flutter',
    description:
        'Flutter is a framework for building natively compiled applications for mobile, web, and desktop. It offers a rich widget set and hot-reload feature, enabling rapid development and a consistent user experience across platforms.',
    iconData: FontAwesomeIcons.mobileScreenButton,
  ),
  Skill(
    title: 'Firebase',
    description:
        'Firebase is a platform for building and scaling web and mobile applications. It provides real-time databases, authentication, hosting, and cloud functions, enhancing functionality, performance, and user engagement.',
    iconData: FontAwesomeIcons.fire,
  ),
  Skill(
    title: 'BloC/Provider\nPackage',
    description:
        'BloC pattern and Provider package are state management solutions for Flutter. They organize and manage data flow, ensuring a clean and efficient architecture for scalable applications.',
    iconData: FontAwesomeIcons.gears,
  ),
  Skill(
    title: 'HTML/CSS/Javascript',
    description:
        'HTML, CSS, and JavaScript are foundational for web development. HTML structures content, CSS styles it, and JavaScript adds interactivity, essential for creating responsive and visually appealing web applications.',
    iconData: FontAwesomeIcons.code,
  ),
  Skill(
    title: 'Version\nControl\nTools',
    description:
        'Version control tools like Git are crucial for collaborative software development. They enable multiple developers to work simultaneously, track changes, and ensure a seamless and organized development process.',
    iconData: FontAwesomeIcons.codeBranch,
  ),
  Skill(
    title: 'Project\nManagement\nTools',
    description:
        'Project management tools like Jira, Trello, or Asana streamline development, enhance collaboration, and ensure timely project delivery. They help plan, track progress, and communicate efficiently for successful project outcomes.',
    iconData: FontAwesomeIcons.listCheck,
  ),
];
