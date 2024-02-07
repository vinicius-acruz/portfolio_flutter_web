import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    description:
        "I've successfully developed cross-platform applications using Flutter, harnessing its capabilities for Android, iOS, web, and desktop. With a strong command over Flutter, I bring efficiency and innovation to every project.",
    iconData: FontAwesomeIcons.mobileScreenButton,
    imagePath: 'assets/images/icons/flutter_icon.png',
  ),
  Skill(
    title: 'Firebase',
    description:
        "Utilizing Firebase, I've seamlessly integrated user authentication and real-time data storage with Firestore. Additionally, I've leveraged Firebase Functions to execute backend operations, enhancing app functionality and user engagement.",
    iconData: FontAwesomeIcons.fire,
    imagePath: 'assets/images/icons/firebase_icon.png',
  ),
  Skill(
    title: 'BloC/Provider Package',
    description:
        "Employing BloC and Provider packages, I've adeptly managed state in Flutter applications, ensuring a streamlined and efficient architecture that facilitates scalability and maintainability.",
    iconData: FontAwesomeIcons.gears,
    imagePath: 'assets/images/icons/bloc_icon.png',
  ),
  Skill(
    title: 'Version Control Tools',
    description:
        "With knowledge in Git and GitHub, I've maintained precise control over my applications, managing branches and issues to optimize the software development process for collaborative projects.",
    iconData: FontAwesomeIcons.codeBranch,
    imagePath: 'assets/images/icons/version_control_icon.png',
  ),
  Skill(
    title: 'Project Management\nTools',
    description:
        "Utilizing tools like Jira and Trello, I've efficiently executed tasks, set priorities, and met deadlines for my projects. My adeptness in project management ensures smooth progress and successful outcomes.",
    iconData: FontAwesomeIcons.listCheck,
    imagePath: 'assets/images/icons/project_icon.png',
  ),
  Skill(
    title: 'HTML/CSS/\nJavascript',
    description:
        "I possess foundational knowledge of HTML, CSS, and JavaScript, essential for web development and integrating features such as Firebase Functions into applications.",
    iconData: FontAwesomeIcons.code,
    imagePath: 'assets/images/icons/html_icon.png',
  ),
  Skill(
    title: 'OpenAI GPT Plugin',
    description:
        "Leveraging the OpenAI GPT plugin, I've implemented AI-powered features within Flutter apps, fine-tuning prompt structures and configurations to optimize functionality and user experience.",
    iconData: FontAwesomeIcons.brain,
    imagePath: 'assets/images/icons/openai_icon.png',
  ),
  Skill(
    title: 'UI/UX Design',
    description:
        "With experience in UI design using Figma, I craft visually appealing and user-friendly interfaces that enhance the overall experience of my applications, ensuring seamless navigation and interaction.",
    iconData: FontAwesomeIcons.penRuler,
    imagePath: 'assets/images/icons/ux_ui_icon.png',
  ),
  Skill(
    title: 'Flutter Flame',
    description:
        "In game development with Flutter Flame, I've created captivating 2D games with dynamic elements like collisions, object interactions, and character actions. My expertise in Flutter Flame ensures engaging gameplay experiences.",
    iconData: FontAwesomeIcons.fire,
    imagePath: 'assets/images/icons/flutter_flame_icon.png',
  ),
  Skill(
    title: 'Flutter APIs',
    description:
        "Utilizing Flutter's extensive APIs, I've integrated diverse functionalities into applications, adeptly navigating documentation to implement API features effectively and enhance app capabilities.",
    iconData: FontAwesomeIcons.mobileScreenButton,
    imagePath: 'assets/images/icons/flutter_apis_icon.png',
  ),
];
