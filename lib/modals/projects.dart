import 'package:portfolio_flutter_web/modals/descriptions.dart';

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
      description: captionFetcherDescription,
      imageUrl1: 'assets/images/projects/project1/caption_fetcher_image.png',
      projectAnimation:
          'assets/images/projects/project1/caption_fetcher_frame.gif',
      index: 1,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://caption-fetcher-1cb2d.web.app',
      viewMoreMessage: 'Check Live Demo'),

  Project(
      title: 'Chat.Me',
      description: chatMeDescription,
      imageUrl1: 'assets/images/projects/project2/chat_me_image.png',
      projectAnimation: 'assets/images/projects/project2/chat_me_frame.gif',
      index: 2,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/chat_me.git'),

  Project(
      title: '2Do App',
      description: twoDoAppDescription,
      imageUrl1: 'assets/images/projects/project3/2do_image.png',
      projectAnimation: 'assets/images/projects/project3/2do_frame.gif',
      index: 3,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/todo_app.git'),

  Project(
      title: 'Clima App',
      description: climaAppDescription,
      imageUrl1: 'assets/images/projects/project4/clima_image.png',
      projectAnimation: 'assets/images/projects/project4/clima_frame.gif',
      index: 4,
      orientation: ProjectOrientation.vertical,
      projectUrl: 'https://github.com/vinicius-acruz/clima_app.git'),

  Project(
      title: 'Pixel Adventure',
      description: pixelAdventureDescription,
      imageUrl1: 'assets/images/projects/project5/pixel_adventure_image.png',
      projectAnimation:
          'assets/images/projects/project5/pixel_adventure_frame.gif',
      index: 5,
      orientation: ProjectOrientation.horizontal,
      projectUrl: 'https://github.com/vinicius-acruz/pixel_adventure.git'),

  Project(
      title: 'Bakery Website (Whimsical Bites)',
      description: bakeryWebsiteDescription,
      imageUrl1: 'assets/images/projects/project6/bakery_website_frame.gif',
      projectAnimation:
          'assets/images/projects/project6/bakery_website_frame.gif',
      index: 6,
      orientation: ProjectOrientation.ipadHorizontal,
      projectUrl: 'https://github.com/vinicius-acruz/bakery_website.git'),
  // Add more projects as needed
];
