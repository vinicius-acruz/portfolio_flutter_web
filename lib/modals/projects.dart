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

  Project({
    required this.title,
    required this.description,
    required this.imageUrl1,
    required this.projectAnimation,
    required this.index,
    this.orientation = ProjectOrientation.vertical, // Default value
    this.projectUrl = '', // Default value
    this.viewMoreMessage = 'View on GitHub',
  });
}

List<Project> projects = [
  Project(
      title: 'Caption Fetcher',
      description:
          'Utilizes OpenAI\'s GPT technology for AI-powered summarization of YouTube videos. Features secure Firebase registration, profile management, image uploads, an in-app coin system, and meticulous user history tracking. Data storage and backend operations are managed through Firebase Firestore and Functions.',
      imageUrl1: 'assets/images/projects/project1/caption_fetcher_image.png',
      projectAnimation:
          'assets/images/projects/project1/caption_fetcher_frame.gif',
      index: 1,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://caption-fetcher-1cb2d.web.app',
      viewMoreMessage: 'Check Live Demo'),

  Project(
      title: 'Chat.Me',
      description:
          'An advanced messaging application leveraging Flutter and Firebase for user registration, secure authentication, and profile customization. Offers a smooth messaging experience with direct and group chats, contact lists, and real-time notifications. Employs Firebase\'s real-time database for efficient message delivery.',
      imageUrl1: 'assets/images/projects/project2/chat_me_image.png',
      projectAnimation: 'assets/images/projects/project2/chat_me_frame.gif',
      index: 2,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/chat_me.git'),

  Project(
      title: '2Do App',
      description:
          'A comprehensive task management tool developed with Flutter, emphasizing voice-controlled task input and Provider for state management. Offers task prioritization, due dates, reminders, and a sleek UI for a seamless task management experience. Integrates speech recognition for hands-free usage.',
      imageUrl1: 'assets/images/projects/project3/2do_image.png',
      projectAnimation: 'assets/images/projects/project3/2do_frame.gif',
      index: 3,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/todo_app.git'),

  Project(
      title: 'Clima App',
      description:
          'A sleek, real-time weather app using Flutter and the OpenWeather API for precise weather forecasts. Features include location-based weather, city search, and detailed weather conditions. Designed with a user-friendly interface and animated weather changes for an engaging user experience.',
      imageUrl1: 'assets/images/projects/project4/clima_image.png',
      projectAnimation: 'assets/images/projects/project4/clima_frame.gif',
      index: 4,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/clima_app.git'),

  Project(
      title: 'Pixel Adventure',
      description:
          'Pixel Adventure is a 2D platformer game developed using Flutter and the Flame game engine. Navigate through interactive environments, picking multiple characters, collecting fruits, avoiding traps and defeating enemies like the Angry Chicken. Pixel Adventure offers a visually rich and engaging experience.',
      imageUrl1: 'assets/images/projects/project5/pixel_adventure_image.png',
      projectAnimation:
          'assets/images/projects/project5/pixel_adventure_frame.gif',
      index: 5,
      orientation: ProjectOrientation.horizontal,
      projectUrl: 'https://github.com/vinicius-acruz/pixel_adventure.git'),

  Project(
      title: 'Bakery Website (Whimsical Bites)',
      description:
          'A visually appealing bakery website showcasing products through a responsive and interactive design, developed with Flutter. Utilizes BlocX for fluid scroll animations and advanced features for dynamic content presentation, offering users a delightful browsing experience.',
      imageUrl1: 'assets/images/projects/project6/bakery_website_frame.gif',
      projectAnimation:
          'assets/images/projects/project6/bakery_website_frame.gif',
      index: 6,
      orientation: ProjectOrientation.ipadHorizontal,
      projectUrl: 'https://github.com/vinicius-acruz/bakery_website.git'),
  // Add more projects as needed
];
