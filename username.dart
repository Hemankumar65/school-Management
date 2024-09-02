import 'package:formz/formz.dart';

enum UsernameValidationError { empty }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    return null;
  }
}

enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    return null;
  }
}

// HouseNo Validator
enum HouseNoValidationError { empty }

class HouseNo extends FormzInput<String, HouseNoValidationError> {
  const HouseNo.pure() : super.pure('');
  const HouseNo.dirty([super.value = '']) : super.dirty();

  @override
  HouseNoValidationError? validator(String value) {
    if (value.isEmpty) return HouseNoValidationError.empty;
    return null;
  }
}

// AddressLine1 Validator
enum AddressLine1ValidationError { empty }

class AddressLine1 extends FormzInput<String, AddressLine1ValidationError> {
  const AddressLine1.pure() : super.pure('');
  const AddressLine1.dirty([super.value = '']) : super.dirty();

  @override
  AddressLine1ValidationError? validator(String value) {
    if (value.isEmpty) return AddressLine1ValidationError.empty;
    return null;
  }
}

// AddressLine2 Validator
enum AddressLine2ValidationError { empty }

class AddressLine2 extends FormzInput<String, AddressLine2ValidationError> {
  const AddressLine2.pure() : super.pure('');
  const AddressLine2.dirty([super.value = '']) : super.dirty();

  @override
  AddressLine2ValidationError? validator(String value) {
    if (value.isEmpty) return AddressLine2ValidationError.empty;
    return null;
  }
}

// City Validator
enum CityValidationError { empty }

class City extends FormzInput<String, CityValidationError> {
  const City.pure() : super.pure('');
  const City.dirty([super.value = '']) : super.dirty();

  @override
  CityValidationError? validator(String value) {
    if (value.isEmpty) return CityValidationError.empty;
    return null;
  }
}

enum StateValidationError { empty }

class State extends FormzInput<String, StateValidationError> {
  const State.pure() : super.pure('');
  const State.dirty([super.value = '']) : super.dirty();

  @override
  StateValidationError? validator(String value) {
    if (value.isEmpty) return StateValidationError.empty;
    return null;
  }
}

enum SubjectValidationError { empty }

class Subject extends FormzInput<String, SubjectValidationError> {
  const Subject.pure() : super.pure('');
  const Subject.dirty([super.value = '']) : super.dirty();

  @override
  SubjectValidationError? validator(String value) {
    if (value.isEmpty) return SubjectValidationError.empty;
    return null;
  }
}

enum QualificationValidationError { empty }

class Qualification extends FormzInput<String, QualificationValidationError> {
  const Qualification.pure() : super.pure('');
  const Qualification.dirty([super.value = '']) : super.dirty();

  @override
  QualificationValidationError? validator(String value) {
    if (value.isEmpty) return QualificationValidationError.empty;
    return null;
  }
}

enum SubjectSpecificationValidationError { empty }

class SubjectSpecification
    extends FormzInput<String, SubjectSpecificationValidationError> {
  const SubjectSpecification.pure() : super.pure('');
  const SubjectSpecification.dirty([super.value = '']) : super.dirty();

  @override
  SubjectSpecificationValidationError? validator(String value) {
    if (value.isEmpty) return SubjectSpecificationValidationError.empty;
    return null;
  }
}

enum MarksValidationError { empty }

class Marks extends FormzInput<String, MarksValidationError> {
  const Marks.pure() : super.pure('');
  const Marks.dirty([super.value = '']) : super.dirty();

  @override
  MarksValidationError? validator(String value) {
    if (value.isEmpty) return MarksValidationError.empty;
    return null;
  }
}
