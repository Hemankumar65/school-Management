import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:hello_dev/login/models/confirmed_password.dart';
import 'package:hello_dev/repository/authentication_repository/auth_repository.dart';

import '../../login/models/password.dart';
import '../../login/models/username.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const SignUpState()) {
    on<SignUpUserNameChanged>(_onSignUpChanged);
    on<SignUpUserPasswordChanged>(_onPassword);
    on<SignUpUserPasswordConfirmed>(_onConfirmedPassword);
    on<SignUpSubmitted>(_onSubmitted);
    on<OnChangedName>(_onChangedName);
    on<OnChangedHouseNo>(_onChangedHouseNo);
    on<OnChangedAddressLine1>(_onChangedAddressLine1);
    on<OnChangedAddressLine2>(_onChangedAddressLine2);
    on<OnChangedCity>(_onChangedCity);
    on<OnChangedState>(_onChangedState);
    on<OnChangedSubject>(_onChangedSubject);
    on<OnChangedQualification>(_onChangedQualification);
    on<OnChangedSubjectSpecification>(_onSubjectSpecification);
    on<OnChangedMarks>(_onChangedMarks);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onSignUpChanged(
    SignUpUserNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid:
            Formz.validate([username, state.password, state.confirmedPassword]),
      ),
    );
  }

  void _onPassword(
    SignUpUserPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.username, password, confirmedPassword]),
      ),
    );
  }

  void _onConfirmedPassword(
    SignUpUserPasswordConfirmed event,
    Emitter<SignUpState> emit,
  ) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: event.confirmedPassword,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid:
            Formz.validate([state.username, state.password, confirmedPassword]),
      ),
    );
  }

  void _onChangedName(
    OnChangedName event,
    Emitter<SignUpState> emit,
  ) {
    final name = Name.dirty(event.name);
    emit(state.copyWith(
      name: name,
      isValid: Formz.validate([state.name, name]),
    ));
  }

  void _onChangedHouseNo(
    OnChangedHouseNo event,
    Emitter<SignUpState> emit,
  ) {
    final houseno = HouseNo.dirty(event.houseNo);
    emit(state.copyWith(
      houseNo: houseno,
      isValid: Formz.validate([state.houseNo, houseno]),
    ));
  }

  void _onChangedAddressLine1(
    OnChangedAddressLine1 event,
    Emitter<SignUpState> emit,
  ) {
    final address1 = AddressLine1.dirty(event.addressLine1);
    emit(state.copyWith(
      addressLine1: address1,
      isValid: Formz.validate([state.addressLine1, address1]),
    ));
  }

  void _onChangedAddressLine2(
    OnChangedAddressLine2 event,
    Emitter<SignUpState> emit,
  ) {
    final address2 = AddressLine2.dirty(event.addressLine2);
    emit(state.copyWith(
      addressLine2: address2,
      isValid: Formz.validate([state.addressLine2, address2]),
    ));
  }

  void _onChangedCity(
    OnChangedCity event,
    Emitter<SignUpState> emit,
  ) {
    final city = City.dirty(event.city);
    emit(
      state.copyWith(
        city: city,
        isValid: Formz.validate([state.city, city]),
      ),
    );
  }

  void _onChangedState(
    OnChangedState event,
    Emitter<SignUpState> emit,
  ) {
    final statet = State.dirty(event.state);
    emit(state.copyWith(
      state: statet,
      isValid: Formz.validate([state.state, statet]),
    ));
  }

  void _onChangedSubject(
    OnChangedSubject event,
    Emitter<SignUpState> emit,
  ) {
    final sb = Subject.dirty(event.subject);
    emit(
      state.copyWith(
        subject: sb,
        isValid: Formz.validate([state.subject, sb]),
      ),
    );
  }

  void _onChangedQualification(
    OnChangedQualification event,
    Emitter<SignUpState> emit,
  ) {
    final quali = Qualification.dirty(event.qualification);
    emit(state.copyWith(
      qualification: quali,
      isValid: Formz.validate([state.qualification, quali]),
    ));
  }

  void _onSubjectSpecification(
    OnChangedSubjectSpecification event,
    Emitter<SignUpState> emit,
  ) {
    final sp = SubjectSpecification.dirty(event.subjectSpecification);
    emit(state.copyWith(
      subjectSpecification: sp,
      isValid: Formz.validate([state.subjectSpecification, sp]),
    ));
  }

  void _onChangedMarks(
    OnChangedMarks event,
    Emitter<SignUpState> emit,
  ) {
    final marks = Marks.dirty(event.marks);
    emit(state.copyWith(
      marks: marks,
      isValid: Formz.validate([state.marks, marks]),
    ));
  }

  void _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _authenticationRepository.signUp(
          email: state.username.value,
          password: state.password.value,
          additionalData: {
            'name': state.name.value,
            'houseNo': state.houseNo.value,
            'addressLine1': state.addressLine1.value,
            'addressLine2': state.addressLine2.value,
            'city': state.city.value,
            'state': state.state.value,
            'subject': state.subject.value,
            'qualification': state.qualification.value,
            'subjectSpecification': state.subjectSpecification.value,
            'marks': state.marks.value,
          },
        );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

//   Future<void> _onFetchUserData(
//     FetchUserData event,
//     Emitter<SignUpState> emit,
//   ) async {
//     final userData = await _authenticationRepository.fetchUserData();
//     try {
//       emit(state.copyWith(
//         username: Username.dirty(userData['email'] ?? ''),
//         name: Name.dirty(userData['name'] ?? ''),
//         houseNo: HouseNo.dirty(userData['houseNo'] ?? ''),
//         addressLine1: AddressLine1.dirty(userData['addressLine1'] ?? ''),
//         addressLine2: AddressLine2.dirty(userData['addressLine2'] ?? ''),
//         city: City.dirty(userData['city'] ?? ''),
//         state: State.dirty(userData['state'] ?? ''),
//         subject: Subject.dirty(userData['subject'] ?? ''),
//         qualification: Qualification.dirty(userData['qualification'] ?? ''),
//         subjectSpecification:
//             SubjectSpecification.dirty(userData['subjectSpecification'] ?? ''),
//         marks: Marks.dirty(userData['marks'] ?? ''),
//       ));
//     } catch (e) {
//       emit(state.copyWith(status: FormzSubmissionStatus.failure));
//     }
//   }
}
