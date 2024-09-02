// import 'package:cloud_firestore/cloud_firestore.dart';
//
// abstract class UserBase {
//   String get id;
//   String get name;
// }
//
// class Teacher implements UserBase {
//   @override
//   String id;
//   @override
//   String name;
//   String address;
//   String qualification;
//   String subjectSpecification;
//   List<String> marksStudent;
//   Teacher(
//       {required this.id,
//       required this.name,
//       required this.address,
//       required this.qualification,
//       required this.subjectSpecification,
//       required this.marksStudent});
//
//   factory Teacher.fromFirestore(DocumentSnapshot documentSnapshot) {
//     Map data = documentSnapshot.data() as Map<String, dynamic>;
//     return Teacher(
//       id: documentSnapshot.id,
//       name: data['name'] ?? '',
//       address: data['address'] ?? '',
//       qualification: data['qualification'] ?? '',
//       subjectSpecification: data['subjectSpecification'] ?? '',
//       marksStudent: List<String>.from(data['marksStudent'] ?? []),
//     );
//   }
//   Map<String, dynamic> toFirestore() {
//     return {
//       "name": name,
//       "address": address,
//       "qualification": qualification,
//       "subjectSpecification": subjectSpecification,
//       "marksStudent": marksStudent,
//     };
//   }
// }
