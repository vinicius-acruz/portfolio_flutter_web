import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

const String linkedInUrl = 'https://www.linkedin.com/in/vinicius-acruz/';
const String githubUrl = 'https://github.com/vinicius-acruz';

void launchURL(String url) async {
  Uri uri = Uri.parse(url); // Convert the String to a Uri
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
