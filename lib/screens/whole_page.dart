import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/screens/section/first_section/first_section.dart';
import 'package:portfolio_flutter_web/screens/section/fourth_section.dart';
import 'package:portfolio_flutter_web/screens/section/second_section.dart';
import 'package:portfolio_flutter_web/screens/section/third_section/third_section.dart';

class WholePage extends StatefulWidget {
  const WholePage({super.key});

  @override
  State<WholePage> createState() => _WholePageState();
}

class _WholePageState extends State<WholePage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          FirstSection(),
          SizedBox(
            height: 10.0,
          ),
          //SecondSection(),
          SizedBox(
            height: 10.0,
          ),
          //ThirdSection(),
          SizedBox(
            height: 10.0,
          ),
          //FourthSection(),
        ],
      ),
    );
  }
}
