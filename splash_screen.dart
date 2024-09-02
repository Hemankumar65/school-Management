import 'package:flutter/material.dart';

import '../assets/widgets/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/image/splash.png'),
          ),
          color: kContainerColor),
    );
  }
}
