part of 'signup_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpUserNameChanged extends SignUpEvent {
  const SignUpUserNameChanged(
    this.username,
  );
  final String username;
  @override
  List<Object> get props => [username];
}

final class SignUpUserPasswordChanged extends SignUpEvent {
  const SignUpUserPasswordChanged(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

final class SignUpUserPasswordConfirmed extends SignUpEvent {
  const SignUpUserPasswordConfirmed(this.confirmedPassword);
  final String confirmedPassword;
  @override
  List<Object> get props => [confirmedPassword];
}

final class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}

final class OnChangedName extends SignUpEvent {
  const OnChangedName(this.name);
  final String name;
  @override
  List<Object> get props => [name];
}

final class OnChangedHouseNo extends SignUpEvent {
  const OnChangedHouseNo(this.houseNo);
  final String houseNo;
  @override
  List<Object> get props => [houseNo];
}

final class OnChangedAddressLine1 extends SignUpEvent {
  const OnChangedAddressLine1(this.addressLine1);
  final String addressLine1;
  @override
  List<Object> get props => [addressLine1];
}

final class OnChangedAddressLine2 extends SignUpEvent {
  const OnChangedAddressLine2(this.addressLine2);
  final String addressLine2;
  @override
  List<Object> get props => [addressLine2];
}

final class OnChangedCity extends SignUpEvent {
  const OnChangedCity(this.city);
  final String city;
  @override
  List<Object> get props => [city];
}

final class OnChangedState extends SignUpEvent {
  const OnChangedState(this.state);
  final String state;
  @override
  List<Object> get props => [state];
}

final class OnChangedSubject extends SignUpEvent {
  const OnChangedSubject(this.subject);
  final String subject;
  @override
  List<Object> get props => [subject];
}

final class OnChangedQualification extends SignUpEvent {
  const OnChangedQualification(this.qualification);
  final String qualification;
  @override
  List<Object> get props => [qualification];
}

final class OnChangedMarks extends SignUpEvent {
  const OnChangedMarks(this.marks);
  final String marks;
  @override
  List<Object> get props => [marks];
}

final class OnChangedSubjectSpecification extends SignUpEvent {
  const OnChangedSubjectSpecification(this.subjectSpecification);
  final String subjectSpecification;
  @override
  List<Object> get props => [subjectSpecification];
}

final class OnChangedFetchUserData extends SignUpEvent {
  const OnChangedFetchUserData();
}
