import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hello_dev/app.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
          print('${state.status.isFailure}');
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
            const Padding(padding: EdgeInsets.all(12)),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.person_2_outlined),
            labelText: 'username',
            errorText:
                state.username.displayError != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: _obscureText,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            suffixIcon: TextButton(
              onPressed: () {
                _togglePasswordVisibility();
              },
              child: Text(
                _obscureText ? 'Hide' : 'Show',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            labelText: 'password',
            errorText:
                state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        key: const Key('loginForm_createAccount_flatButton'),
        onPressed: () => navigatorKey.currentState!.pushNamed('/signup'),
        child: RichText(
          text: const TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Sign-up',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20.0, // Larger size for "Sign-up"
                  fontWeight: FontWeight.bold, // Optional: bold for emphasis
                ),
              ),
            ],
          ),
        ));
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) return 10;
                        return 5;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    animationDuration: const Duration(milliseconds: 200)),
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              );
      },
    );
  }
}
