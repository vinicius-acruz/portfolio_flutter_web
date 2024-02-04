enum ProjectOrientation { vertical, horizontal, ipadHorizontal }

class Project {
  final String title;
  final String description;
  final String imageUrl1;
  final String projectAnimation;
  final int index;
  final ProjectOrientation orientation; // New field

  Project({
    required this.title,
    required this.description,
    required this.imageUrl1,
    required this.projectAnimation,
    required this.index,
    this.orientation = ProjectOrientation.vertical, // Default value
  });
}

List<Project> projects = [
  Project(
    title: 'Caption Fetcher',
    description:
        'A showcase app built with Flutter to demonstrate various UI components and features. It includes animations, state management, and integration with external APIs.',
    imageUrl1: 'assets/images/projects/project1/project1_1.png',
    projectAnimation:
        'assets/images/projects/project1/caption_fetcher_frame.gif',
    index: 1,
    orientation: ProjectOrientation.vertical,
  ),

  Project(
    title: 'Chat.Me',
    description:
        'Chat.Me is an advanced messaging application developed using Flutter and Firebase. Originally created as part of The Complete Flutter Development Bootcamp, by Dr. Angela Yu and App Brewery.',
    imageUrl1: 'assets/images/projects/project2/chat_me_image.png',
    projectAnimation: 'assets/images/projects/project2/chat_me_frame.gif',
    index: 2,
    orientation: ProjectOrientation.vertical,
  ),
  Project(
    title: '2Do App',
    description:
        'A weather app built using the BloC pattern for state management. It fetches weather data from a third-party API and displays it in a user-friendly interface.',
    imageUrl1: 'assets/images/projects/project3/2do_image.png',
    projectAnimation: 'assets/images/projects/project3/2do_frame.gif',
    index: 3,
    orientation: ProjectOrientation.vertical,
  ),
  Project(
    title: 'Clima',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet varius urna, id pharetra erat aliquam in. Aenean hendrerit, nulla ac sagittis vulputate, purus ligula efficitur justo.',
    imageUrl1: 'assets/images/projects/project4/clima_image.png',
    projectAnimation: 'assets/images/projects/project4/clima_frame.gif',
    index: 4,
    orientation: ProjectOrientation.vertical,
  ),
  Project(
    title: 'Pixel Adventure',
    description:
        'A fun and addictive game built using the Flame game engine. It features stunning graphics, smooth animations, and challenging gameplay. Test your skills!',
    imageUrl1: 'assets/images/projects/project5/pixel_adventure_image.png',
    projectAnimation:
        'assets/images/projects/project5/pixel_adventure_frame.gif',
    index: 5,
    orientation: ProjectOrientation.horizontal,
  ),
  Project(
    title: 'Bakery Website',
    description:
        'A fun and addictive game built using the Flame game engine. It features stunning graphics, smooth animations, and challenging gameplay. Test your skills!',
    imageUrl1: 'assets/images/projects/project6/bakery_website_frame.gif',
    projectAnimation:
        'assets/images/projects/project6/bakery_website_frame.gif',
    index: 6,
    orientation: ProjectOrientation.ipadHorizontal,
  ),
  // Add more projects as needed
];
