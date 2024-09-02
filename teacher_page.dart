// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hello_dev/selectionPage/bloc/selection_bloc.dart';
// import 'package:hello_dev/teachers/view/teacher_form.dart';
//
// class TeacherPage extends StatelessWidget {
//   const TeacherPage({super.key});
//
//   static Route<void> route() {
//     return MaterialPageRoute<void>(builder: (_) => const TeacherPage());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: BlocProvider(
//           create: (context) {
//             return SelectionBloc();
//           },
//           child: const TeacherForm(),
//         ),
//       ),
//     );
//   }
// }
