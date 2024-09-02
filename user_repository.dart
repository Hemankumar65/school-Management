import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../students/studentModel/student_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore;
  UserRepository({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserType> getUser(String email) async {
    final doc = await _firestore.collection('users').doc(email).get();
    final data = doc.data()!;
    return UserType.values
        .firstWhere((e) => e.toString() == 'UserType.${data['type']}');
  }

  FirebaseFirestore get firestore => _firestore;



  Future<Student> getStudentData(String email) async {
    final doc = await _firestore.collection('students').doc(email).get();
    return Student.fromFirestore(doc);
  }

  Future<Teacher> getTeacherData(String email) async {
    final doc = await _firestore.collection('teachers').doc(email).get();
    return Teacher.fromFirestore(doc);
  }
}

enum UserType { student, teacher }
