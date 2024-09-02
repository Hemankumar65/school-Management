import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherForm extends StatelessWidget {
  const TeacherForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {},
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          children: [
            _TeacherId(),
            const Padding(padding: EdgeInsets.all(12)),
            _TeacherName(),
            const Padding(padding: EdgeInsets.all(12)),
            _TeacherAddress(),
            const Padding(padding: EdgeInsets.all(12)),
            _TeacherQualification(),
            const Padding(padding: EdgeInsets.all(12)),
            _TeacherSubjectSpecification(),
            const Padding(padding: EdgeInsets.all(12)),
            _TeacherMarksStudent(),
            const Padding(padding: EdgeInsets.all(12)),
            _Submitted(),
          ],
        ),
      ),
    );
  }
}

class _TeacherId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _TeacherName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _TeacherAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _TeacherQualification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _TeacherSubjectSpecification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const TextField();
    });
  }
}

class _TeacherMarksStudent extends StatelessWidget {
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
