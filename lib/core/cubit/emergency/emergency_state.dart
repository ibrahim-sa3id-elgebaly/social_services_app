
class EmergencyState {}

final class EmergencyInitial extends EmergencyState {}

final class PostProblemSuccess extends EmergencyState {}

final class PostProblemLoading extends EmergencyState {}

final class PostProblemFailure extends EmergencyState {
  final String errMessage;
  PostProblemFailure({required this.errMessage});
}

final class RegistrationSuccess extends EmergencyState {}

final class RegistrationLoading extends EmergencyState {}

final class RegistrationFailure extends EmergencyState {
  final String errMessage;
  RegistrationFailure({required this.errMessage});
}
