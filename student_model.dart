import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserBase {
  String get id;
  String get name;
}

class Student implements UserBase {
  @override
  String id;
  @override
  String name;
  String houseNo;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  List<String> subjects;

  Student(
      {required this.id,
      required this.name,
      required this.houseNo,
      required this.addressLine1,
      required this.addressLine2,
      required this.city,
      required this.state,
      required this.subjects});

  factory Student.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Student(
      id: doc.id,
      name: data['name'] ?? '',
      houseNo: data['houseNo'] ?? '',
      addressLine1: data['addressLine1'] ?? '',
      addressLine2: data['addressLine2'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      subjects: List<String>.from(data['subjects'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "houseNo": houseNo,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "city": city,
      "state": state,
      "subjects": subjects,
    };
  }
}

class Teacher implements UserBase {
  @override
  String id;
  @override
  String name;
  String address;
  String qualification;
  String subjectSpecification;
  List<String> marksStudent;
  Teacher(
      {required this.id,
      required this.name,
      required this.address,
      required this.qualification,
      required this.subjectSpecification,
      required this.marksStudent});

  factory Teacher.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map data = documentSnapshot.data() as Map<String, dynamic>;
    return Teacher(
      id: documentSnapshot.id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      qualification: data['qualification'] ?? '',
      subjectSpecification: data['subjectSpecification'] ?? '',
      marksStudent: List<String>.from(data['marksStudent'] ?? []),
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "address": address,
      "qualification": qualification,
      "subjectSpecification": subjectSpecification,
      "marksStudent": marksStudent,
    };
  }
}
