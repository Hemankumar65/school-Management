part of 'signup_bloc.dart';

final class SignUpState extends Equatable {
  const SignUpState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.name = const Name.pure(),
    this.houseNo = const HouseNo.pure(),
    this.addressLine1 = const AddressLine1.pure(),
    this.addressLine2 = const AddressLine2.pure(),
    this.city = const City.pure(),
    this.state = const State.pure(),
    this.subject = const Subject.pure(),
    this.qualification = const Qualification.pure(),
    this.subjectSpecification = const SubjectSpecification.pure(),
    this.marks = const Marks.pure(),
  });

  final Username username;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
  final Name name;
  final HouseNo houseNo;
  final AddressLine1 addressLine1;
  final AddressLine2 addressLine2;
  final City city;
  final State state;
  final Subject subject;
  final Qualification qualification;
  final SubjectSpecification subjectSpecification;
  final Marks marks;

  SignUpState copyWith({
    Username? username,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    Name? name,
    HouseNo? houseNo,
    AddressLine1? addressLine1,
    AddressLine2? addressLine2,
    City? city,
    State? state,
    Subject? subject,
    Qualification? qualification,
    SubjectSpecification? subjectSpecification,
    Marks? marks,
  }) {
    return SignUpState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      name: name ?? this.name,
      houseNo: houseNo ?? this.houseNo,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      city: city ?? this.city,
      state: state ?? this.state,
      subject: subject ?? this.subject,
      qualification: qualification ?? this.qualification,
      subjectSpecification: subjectSpecification ?? this.subjectSpecification,
      marks: marks ?? this.marks,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        confirmedPassword,
        status,
        isValid,
        errorMessage,
        name,
        houseNo,
        addressLine1,
        addressLine2,
        city,
        state,
        subject,
        qualification,
        subjectSpecification,
        marks,
      ];
}
