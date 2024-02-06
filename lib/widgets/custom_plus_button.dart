import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter_web/constants/my_data.dart';
import 'package:portfolio_flutter_web/constants/style.dart';
import 'package:portfolio_flutter_web/responsive/responsive_layout.dart';

class CustomPlusButton extends StatelessWidget {
  final String projectUrl;
  final String viewMoreMessage;

  const CustomPlusButton({
    super.key,
    required this.projectUrl,
    this.viewMoreMessage = 'View on GitHub',
  });

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context)
            .size
            .width, // This forces the bottom sheet to take full width
      ),
      builder: (BuildContext context) {
        return Container(
          height: 200,

          // give it rounded edges
          decoration: const BoxDecoration(
            color: AppStyles.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () => launchURL(projectUrl),
                    icon: viewMoreMessage == 'View on GitHub'
                        ? const FaIcon(FontAwesomeIcons.github)
                        : const FaIcon(FontAwesomeIcons.upRightFromSquare),
                    label: Text(
                      viewMoreMessage == 'View on GitHub'
                          ? "View on GitHub"
                          : "Check Live Demo",
                      style: TextStyle(
                          fontSize: ResponsiveLayout.buildWidgetValue(context,
                              mobileValue:
                                  ResponsiveLayout.normalLettersSizeMobile,
                              tabletValue:
                                  ResponsiveLayout.normalLettersSizeTablet,
                              desktopValue:
                                  ResponsiveLayout.normalLettersSizeDesktop)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.reachButtonColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showModalBottomSheet(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(85, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.plus,
              size: 20.0,
              color: AppStyles.lettersColor,
            ),
          ],
        ),
      ),
    );
  }
}
