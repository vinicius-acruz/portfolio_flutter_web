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
    title: 'Caption Fetcher',
    description:
        'A showcase app built with Flutter to demonstrate various UI components and features. It includes animations, state management, and integration with external APIs.',
    imageUrl1: 'images/projects/project1/project1_1.png',
    imageUrl2: 'images/projects/project1/project1_2.png',
    projectIcon: 'images/projects/project1/project1_icon.png',
    projectAnimation: 'images/projects/project1/caption_fetcher_frame.gif',
    index: 1,
  ),
  Project(
    title: 'Chat.Me',
    description:
        'Chat.Me is an advanced messaging application developed using Flutter and Firebase. Originally created as part of The Complete Flutter Development Bootcamp, by Dr. Angela Yu and App Brewery.',
    imageUrl1: 'images/projects/project2/chat_me_image.png',
    imageUrl2: 'images/projects/project1/project1_2.png',
    projectIcon: 'images/projects/project1/project1_icon.png',
    projectAnimation: 'images/projects/project2/chat_me_frame.gif',
    index: 2,
  ),
  Project(
    title: '2Do App',
    description:
        'A weather app built using the BloC pattern for state management. It fetches weather data from a third-party API and displays it in a user-friendly interface.',
    imageUrl1: 'images/projects/project3/2do_image.png',
    imageUrl2: 'images/projects/project1/project1_2.png',
    projectIcon: 'images/projects/project1/project1_icon.png',
    projectAnimation: 'images/projects/project3/2do_frame.gif',
    index: 3,
  ),
  Project(
    title: 'Clima',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet varius urna, id pharetra erat aliquam in. Aenean hendrerit, nulla ac sagittis vulputate, purus ligula efficitur justo.',
    imageUrl1: 'images/projects/project4/clima_image.png',
    imageUrl2: 'images/projects/project1/project1_2.png',
    projectIcon: 'images/projects/project1/project1_icon.png',
    projectAnimation: 'images/projects/project4/clima_frame.gif',
    index: 4,
    // ),
    // Project(
    //   title: 'Project Title 5',
    //   description:
    //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet varius urna, id pharetra erat aliquam in. Aenean hendrerit, nulla ac sagittis vulputate, purus ligula efficitur justo.',
    //   imageUrl1: 'images/projects/project1/project1_1.png',
    //   imageUrl2: 'images/projects/project1/project1_2.png',
    //   projectIcon: 'images/projects/project1/project1_icon.png',
    //   projectAnimation: 'images/projects/project1/project1_animation.gif',
    //   index: 5,
  ),
  // Add more projects as needed
];
