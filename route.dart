import 'package:flutter/material.dart';
import 'package:hello_dev/home/home_page.dart';
import 'package:hello_dev/login/view/login_page.dart';
import 'package:hello_dev/signup/view/signup_page.dart';
import 'package:hello_dev/splash_screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        print('/splash');
        return MaterialPageRoute(builder: (_) => const SplashScreen(),
        );
      case '/login':
        print('/login');
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signup':
        print('/signup');
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/home':
        print('/home');
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}
