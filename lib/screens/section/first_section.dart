import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  // Define Google Fonts and default size
  final TextStyle _robotoStyle =
      GoogleFonts.roboto(fontSize: 16.0, color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image

        // Page Content
        Container(
          height: 920,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue
                      .withOpacity(0.1), // Adjust the opacity as needed
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello ,',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w900,
                          fontSize: 70.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text("I'm ",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w900,
                                fontSize: 70.0,
                              )),
                          Text(
                            'Vinicius',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w900,
                                fontSize: 70.0,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Flutter Developer',
                        style: _robotoStyle.copyWith(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Hi, I\'m Vinicius, an aspiring Flutter developer passionate about crafting seamless and engaging cross-platform applications. Eager to merge creativity with code, I strive to bring innovative solutions to life in the ever-evolving world of mobile development.',
                              style: _robotoStyle.copyWith(fontSize: 16.0),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(
                            width: 200.0,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your action here
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(200.0, 60.0),
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Reach Me',
                              style: _robotoStyle.copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red
                      .withOpacity(0.1), // Adjust the opacity as needed
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/3itens.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
