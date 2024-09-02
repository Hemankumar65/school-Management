import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_dev/repository/authentication_repository/auth_repository.dart';
import 'package:hello_dev/signup/bloc/signup_bloc.dart';
import 'package:hello_dev/signup/view/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: const Text('Sign Up')),
        body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/image/background1.png'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: BlocProvider(
                  create: (context) {
                    return SignUpBloc(
                      authenticationRepository:
                          RepositoryProvider.of<AuthenticationRepository>(
                              context),
                    );
                  },
                  child: const SignUpForm()),
            ),
          ),
        ),
      ),
    );
  }
}
