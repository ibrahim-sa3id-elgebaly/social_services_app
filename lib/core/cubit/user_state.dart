import '../model/auth_model/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccess extends UserState {}

final class UploadProfilePic extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}


final class UpdateProfileSuccess extends UserState {
  final String message;
  final UserModel user;

  UpdateProfileSuccess({required this.message, required this.user});
}

final class UpdateProfileLoading extends UserState {}

final class UpdateProfileFailure extends UserState {
  final String errMessage;

  UpdateProfileFailure({required this.errMessage});
}

final class ForgotPasswordSuccess extends UserState {
  final String message;

  ForgotPasswordSuccess({required this.message});
}

final class ForgotPasswordLoading extends UserState {}

final class ForgotPasswordFailure extends UserState {
  final String errMessage;

  ForgotPasswordFailure({required this.errMessage});
}

final class ResetPasswordSuccess extends UserState {
  final String message;

  ResetPasswordSuccess({required this.message});
}

final class ResetPasswordLoading extends UserState {}

final class ResetPasswordFailure extends UserState {
  final String errMessage;

  ResetPasswordFailure({required this.errMessage});
}

