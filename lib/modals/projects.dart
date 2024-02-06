enum ProjectOrientation { vertical, horizontal, ipadHorizontal }

class Project {
  final String title;
  final String description;
  final String imageUrl1;
  final String projectAnimation;
  final int index;
  final ProjectOrientation orientation;
  final String projectUrl;
  final String viewMoreMessage;

  Project(
      {required this.title,
      required this.description,
      required this.imageUrl1,
      required this.projectAnimation,
      required this.index,
      this.orientation = ProjectOrientation.vertical, // Default value
      this.projectUrl = '', // Default value
      this.viewMoreMessage = 'View on GitHub'});
}

List<Project> projects = [
  Project(
      title: 'Caption Fetcher',
      description:
          'Utilizes OpenAI\'s GPT technology for AI-powered summarization of YouTube videos. Features secure Firebase registration, profile management, image uploads, an in-app coin system, and meticulous user history tracking. Data storage and backend operations are managed through Firebase Firestore and Functions.',
      imageUrl1: 'assets/images/projects/project1/project1_1.png',
      projectAnimation:
          'assets/images/projects/project1/caption_fetcher_frame.gif',
      index: 1,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://caption-fetcher-1cb2d.web.app',
      viewMoreMessage: 'Check Live Demo'),

  Project(
      title: 'Chat.Me',
      description:
          'A feature-rich messaging app developed with Flutter and Firebase, offering user registration, secure authentication, profile customization, and direct messaging. Integrates Firebase\'s backend services for a smooth and interactive messaging experience.',
      imageUrl1: 'assets/images/projects/project2/chat_me_image.png',
      projectAnimation: 'assets/images/projects/project2/chat_me_frame.gif',
      index: 2,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/chat_me.git'),
  Project(
      title: '2Do App',
      description:
          'An intuitive task management application using Flutter and Provider for state management. Enables efficient task organization with priorities, due dates, reminders, and voice-controlled task entry, ensuring a seamless user experience.',
      imageUrl1: 'assets/images/projects/project3/2do_image.png',
      projectAnimation: 'assets/images/projects/project3/2do_frame.gif',
      index: 3,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/todo_app.git'),
  Project(
      title: 'Clima App',
      description:
          'A real-time weather forecasting app developed in Flutter. Utilizes the openweather API for location-based weather and city searches, providing detailed forecasts including temperature, humidity, wind speed, and more in a sleek, user-friendly design',
      imageUrl1: 'assets/images/projects/project4/clima_image.png',
      projectAnimation: 'assets/images/projects/project4/clima_frame.gif',
      index: 4,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/clima_app.git'),
  Project(
      title: 'Pixel Adventure',
      description:
          'A 2D platformer game in Flutter using the Flame engine. Features interactive environments, multiple characters, fruit collection, traps, and enemies like the Angry Chicken. Offers customizable controls, animation effects, and an engaging visual experience.',
      imageUrl1: 'assets/images/projects/project5/pixel_adventure_image.png',
      projectAnimation:
          'assets/images/projects/project5/pixel_adventure_frame.gif',
      index: 5,
      orientation: ProjectOrientation.horizontal,
      projectUrl: 'https://github.com/vinicius-acruz/pixel_adventure.git'),
  Project(
      title: 'Bakery Website (Whimsical Bites)',
      description:
          'A visually stunning bakery website developed with Flutter. Showcases bakery items in a well-structured layout, utilizing BlocX for smooth scroll animations. Integrates advanced Flutter features for dynamic content interaction and a superior user experience.',
      imageUrl1: 'assets/images/projects/project6/bakery_website_frame.gif',
      projectAnimation:
          'assets/images/projects/project6/bakery_website_frame.gif',
      index: 6,
      orientation: ProjectOrientation.ipadHorizontal,
      projectUrl: 'https://github.com/vinicius-acruz/bakery_website.git'),
  // Add more projects as needed
];
