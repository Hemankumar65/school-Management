import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentForm extends StatelessWidget {
  const StudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {},
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          children: [
            _StudentId(),
            const Padding(padding: EdgeInsets.all(12)),
            _StudentName(),
            const Padding(padding: EdgeInsets.all(12)),
            _StudentAddress(),
            const Padding(padding: EdgeInsets.all(12)),
            _StudentQualification(),
            const Padding(padding: EdgeInsets.all(12)),
            _StudentSubjectSpecification(),
            const Padding(padding: EdgeInsets.all(12)),
            _StudentMarksStudent(),
            const Padding(padding: EdgeInsets.all(12)),
            _Submitted(),
          ],
        ),
      ),
    );
  }
}

class _StudentId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _StudentName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _StudentAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _StudentQualification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _StudentSubjectSpecification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _StudentMarksStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _Submitted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}
