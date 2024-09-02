import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hello_dev/signup/bloc/signup_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? _selectedRole;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _ConfirmedPassword(),
            const Padding(padding: EdgeInsets.all(12)),
            _RoleSelection(
              selectedRole: _selectedRole,
              onChanged: (String? value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ),
            const Padding(padding: EdgeInsets.all(12)),
            if (_selectedRole == 'student') _StudentForm(),
            if (_selectedRole == 'teacher') _TeacherForm(),
            const Padding(padding: EdgeInsets.all(12)),
            _SubmittedButton(),
          ],
        ),
      ),
    );
  }
}

class _StudentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text('Student Information Collection Form',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.italic)),
          const Padding(padding: EdgeInsets.all(12)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('General Information',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Padding(padding: EdgeInsets.all(12)),
          _OnName(),
          const Padding(padding: EdgeInsets.all(12)),
          _HouseNo(),
          const Padding(padding: EdgeInsets.all(12)),
          _Address1(),
          const Padding(padding: EdgeInsets.all(12)),
          _Address2(),
          const Padding(padding: EdgeInsets.all(12)),
          _City(),
          const Padding(padding: EdgeInsets.all(12)),
          _State(),
          const Padding(padding: EdgeInsets.all(12)),
          _Subject(),
        ],
      ),
    );
  }
}

class _TeacherForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          _OnName(),
          const Padding(padding: EdgeInsets.all(12)),
          _Address1(),
          const Padding(padding: EdgeInsets.all(12)),
          _Address2(),
          const Padding(padding: EdgeInsets.all(12)),
          _OnQualification(),
          const Padding(padding: EdgeInsets.all(12)),
          _OnSubjectSpecification(),
          const Padding(padding: EdgeInsets.all(12)),
          _OnMarksStudent(),
          //  _SubmittedButton(),
        ],
      ),
    );
  }
}

class _RoleSelection extends StatelessWidget {
  final String? selectedRole;
  final ValueChanged<String?> onChanged;

  const _RoleSelection({Key? key, this.selectedRole, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<String>(
          value: 'student',
          groupValue: selectedRole,
          onChanged: onChanged,
        ),
        const Text('Student'),
        Radio<String>(
          value: 'teacher',
          groupValue: selectedRole,
          onChanged: onChanged,
        ),
        const Text('Teacher'),
      ],
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (username) =>
                context.read<SignUpBloc>().add(SignUpUserNameChanged(username)),
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.person_2_outlined),
              labelText: 'username',
              errorText: state.username.displayError != null
                  ? 'invalid username'
                  : null,
            ),
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) => context
                .read<SignUpBloc>()
                .add(SignUpUserPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.password_outlined),
              labelText: 'password',
              errorText: state.password.displayError != null
                  ? 'invalid password'
                  : null,
            ),
          );
        });
  }
}

class _ConfirmedPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextField(
        key: const Key('signUpForm_confirmedPassword_textField'),
        onChanged: (confirmedPassword) => context
            .read<SignUpBloc>()
            .add(SignUpUserPasswordConfirmed(confirmedPassword)),
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.password_outlined),
            labelText: 'confirmedPassword',
            errorText: state.confirmedPassword.displayError != null
                ? 'password dose not match'
                : null),
      );
    });
  }
}

class _SubmittedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return state.status.isInProgress
          ? const CircularProgressIndicator()
          : ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              key: const Key('signUpForm_continue_raisedButton'),
              onPressed: state.isValid
                  ? () {
                      context.read<SignUpBloc>().add(const SignUpSubmitted());
                    }
                  : null,
              child: const Text('Submitted',
                  style: TextStyle(color: Colors.white)),
            );
    });

  }
}

// STUDENTS FORM //

class _OnName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_name_textField'),
            decoration: const InputDecoration(
              hintText: 'name:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedName(value));
            },
          );
        });
  }
}

class _HouseNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.houseNo != current.houseNo,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_houseNo_textField'),
            decoration: const InputDecoration(
              hintText: 'house no.:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedHouseNo(value));
            },
          );
        });
  }
}

class _Address1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) =>
            previous.addressLine1 != current.addressLine1,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_addressLine1_textField'),
            decoration: const InputDecoration(
              hintText: 'addressLine1:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedAddressLine1(value));
            },
          );
        });
  }
}

class _Address2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) =>
            previous.addressLine2 != current.addressLine2,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_addressLine2_textField'),
            decoration: const InputDecoration(
              hintText: 'addressLine2:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedAddressLine2(value));
            },
          );
        });
  }
}

class _City extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.city != current.city,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_city_textField'),
            decoration: const InputDecoration(
              hintText: 'city:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedCity(value));
            },
          );
        });
  }
}

class _State extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.state != current.state,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_state_textField'),
            decoration: const InputDecoration(
              hintText: 'state:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedState(value));
            },
          );
        });
  }
}

class _Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.subject != current.subject,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_subject_textField'),
            decoration: const InputDecoration(
              hintText: 'subject:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedSubject(value));
            },
          );
        });
  }
}

class _OnQualification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) =>
            previous.qualification != current.qualification,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_qualification_textField'),
            decoration: const InputDecoration(
              hintText: 'qualification:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedQualification(value));
            },
          );
        });
  }
}

class _OnSubjectSpecification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) =>
            previous.subjectSpecification != current.subjectSpecification,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_subjectSpecification_textField'),
            decoration: const InputDecoration(
              hintText: 'subject specification:',
            ),
            onChanged: (value) {
              context
                  .read<SignUpBloc>()
                  .add(OnChangedSubjectSpecification(value));
            },
          );
        });
  }
}

class _OnMarksStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.marks != current.marks,
        builder: (context, state) {
          return TextField(
            key: const Key('signUpForm_marks_textField'),
            decoration: const InputDecoration(
              hintText: 'marks student:',
            ),
            onChanged: (value) {
              context.read<SignUpBloc>().add(OnChangedMarks(value));
            },
          );
        });
  }
}
