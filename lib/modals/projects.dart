class Project {
  final String title;
  final String description;
  final String imageUrl1;
  final String imageUrl2;
  final String projectIcon;
  final String projectAnimation;
  final int index;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.projectIcon,
    required this.projectAnimation,
    required this.index,
  });
}

List<Project> projects = [
  Project(
    title: 'Flutter App Showcase',
    description:
        'A showcase app built with Flutter to demonstrate various UI components and features. It includes animations, state management, and integration with external APIs.',
    imageUrl1: 'assets/images/projects/project1/project1_1.png',
    imageUrl2: 'assets/images/projects/project1/project1_2.png',
    projectIcon: 'assets/images/projects/project1/project1_icon.png',
    projectAnimation: 'assets/images/projects/project1/project1_animation.gif',
    index: 1,
  ),
  Project(
    title: 'Firebase Blog Platform',
    description:
        'A blog platform built with Firebase, providing features like user authentication, real-time database, and cloud functions. Users can create, edit, and delete blog posts.',
    imageUrl1: 'assets/images/projects/project1/project1_1.png',
    imageUrl2: 'assets/images/projects/project1/project1_2.png',
    projectIcon: 'assets/images/projects/project1/project1_icon.png',
    projectAnimation: 'assets/images/projects/project1/project1_animation.gif',
    index: 2,
  ),
  Project(
    title: 'Weather App with BloC',
    description:
        'A weather app built using the BloC pattern for state management. It fetches weather data from a third-party API and displays it in a user-friendly interface.',
    imageUrl1: 'assets/images/projects/project1/project1_1.png',
    imageUrl2: 'assets/images/projects/project1/project1_2.png',
    projectIcon: 'assets/images/projects/project1/project1_icon.png',
    projectAnimation: 'assets/images/projects/project1/project1_animation.gif',
    index: 3,
  ),
  Project(
    title: 'Project Title 4',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet varius urna, id pharetra erat aliquam in. Aenean hendrerit, nulla ac sagittis vulputate, purus ligula efficitur justo.',
    imageUrl1: 'assets/images/projects/project1/project1_1.png',
    imageUrl2: 'assets/images/projects/project1/project1_2.png',
    projectIcon: 'assets/images/projects/project1/project1_icon.png',
    projectAnimation: 'assets/images/projects/project1/project1_animation.gif',
    index: 4,
  ),
  Project(
    title: 'Project Title 5',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet varius urna, id pharetra erat aliquam in. Aenean hendrerit, nulla ac sagittis vulputate, purus ligula efficitur justo.',
    imageUrl1: 'assets/images/projects/project1/project1_1.png',
    imageUrl2: 'assets/images/projects/project1/project1_2.png',
    projectIcon: 'assets/images/projects/project1/project1_icon.png',
    projectAnimation: 'assets/images/projects/project1/project1_animation.gif',
    index: 5,
  ),
  // Add more projects as needed
];
