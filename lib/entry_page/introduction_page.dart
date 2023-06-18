import 'package:cash_jon/entry_page/SignIn_Page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class intro_page extends StatelessWidget {
  intro_page({super.key});

  final List<PageViewModel> intro_screen = [
    PageViewModel(
      title: 'Welcome to Cash-Jon',
      body: 'Cash-Jon',
      decoration: PageDecoration(
        pageColor: Colors.white,
      ),
    ),
    PageViewModel(
      title: 'Welcome to Cash-Jon',
      body: 'Body',
      decoration: PageDecoration(
        pageColor: Colors.white,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: intro_screen,
      onDone: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => login_page(),
            ));
      },
      onSkip: () {},
      showSkipButton: false,
      showDoneButton: false,
      skip: const Text('Skip'),
      done: const Text('Done'),
    );
  }
}
