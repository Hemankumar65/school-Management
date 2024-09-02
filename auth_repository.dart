import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../students/studentModel/student_model.dart';
import '../user_repository/user_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final StreamController<AuthenticationStatus> _controller =
      StreamController<AuthenticationStatus>();
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final UserRepository userRepository;

  AuthenticationRepository(this.userRepository,
      {FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = userRepository.firestore {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        _controller.add(AuthenticationStatus.unauthenticated);
      } else {
        _controller.add(AuthenticationStatus.authenticated);
      }
    });
  }

  Stream<AuthenticationStatus> get status => _controller.stream;

// SignUp  Method
  Future<void> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> additionalData,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(userCredential.user?.email).set({
        'email': email,
        ...additionalData,
      });
      print('Sign up successful: ${userCredential.user?.email}');
    } on FirebaseAuthException catch (e) {
      print('Failed to sign up with Email & Password: ${e.message}');
    }
  }

// Login Method
  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      print('Login successful: $username');
    } on FirebaseAuthException catch (e) {
      print('Failed to sign in with Email & Password: ${e.message}');
    }
  }

//Logout Method
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    _controller.add(AuthenticationStatus.unauthenticated);
    print('User logged out');
  }

//  Fetch User Data
  Future<DocumentSnapshot<Map<String, dynamic>>> fetchUserData() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      print('Fetching data for user: ${user.email}');
      try {
        return await _firestore.collection('users').doc(user.email).get();
      } catch (e) {
        print('Error fetching user data: $e');
        throw Exception('Error fetching user data');
      }
    } else {
      print('No user is currently logged in.');
      throw Exception('No user is currently logged in.');
    }
  }

  //Student
  Future<Student> fetchStudentData(String email) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(email).get();
      return Student.fromFirestore(userDoc);
    } catch (e) {
      throw Exception('Error getting student data: $e');
    }
  }

//Teacher
  Future<Teacher> fetchTeacherData(String email) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(email).get();
      return Teacher.fromFirestore(userDoc);
    } catch (e) {
      throw Exception("Error getting teacher data: $e");
    }
  }

  void dispose() => _controller.close();

  getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    print('Current user: ${user?.email}');
    return user;
  }
}
