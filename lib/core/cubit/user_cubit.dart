import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_serveces_app/core/api/api_dio/end_ponits.dart';
import '../cache/cache_helper.dart';
import '../model/auth_model/sign_in_model.dart';
import '../repositories/user_repository.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());

  final UserRepository userRepository;

  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  //-------------------------------------------------------------------

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  XFile? profilePic;
  TextEditingController signUpFirstName = TextEditingController();
  TextEditingController signUpLastName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();
  TextEditingController signUpGender = TextEditingController();

  //---------------------------------------------------------------------

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  //----------------------------------------------------------------------

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  TextEditingController forgotPasswordEmail = TextEditingController();
  TextEditingController resetPasswordToken = TextEditingController();
  TextEditingController resetNewPassword = TextEditingController();
  TextEditingController otpController = TextEditingController();

  //--------------------------------------------------------------------

  SignInModel? user;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      firstName: signUpFirstName.text,
      lastName: signUpLastName.text,
      email: signUpEmail.text,
      password: signUpPassword.text,
      phone: signUpPhoneNumber.text,
      gender: signUpGender.text,
    );
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }

  getUserProfile() async {
    emit(GetUserLoading());
    final response = await userRepository.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }

  Future<void> loadUserData() async {
    emit(GetUserLoading());
    try {
      final token = await CacheHelper().getData(key: 'token');
      if (token != null) {
        await getUserProfile(); // Reuse your existing method
      } else {
        emit(GetUserFailure(errMessage: "user not logged in."));
      }
    } catch (e) {
      emit(GetUserFailure(errMessage: "An error occurred: ${e.toString()}"));
      print("Error is $e");
    }
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());
    try {
      final response = await userRepository.updateProfile(
        firstName: signUpFirstName.text,
        lastName: signUpLastName.text,
        phone: signUpPhoneNumber.text,
        gender: signUpGender.text,
        profilePic: profilePic,
      );
      response.fold(
        (errMessage) => emit(UpdateProfileFailure(errMessage: errMessage)),
        (updatedUser) {
          emit(UpdateProfileSuccess(
            message: "Profile updated successfully",
            user: updatedUser,
          ));
          if (state is GetUserSuccess) {
            emit(GetUserSuccess(user: updatedUser));
          }
        },
      );
    } catch (e) {
      emit(UpdateProfileFailure(
          errMessage: "Failed to update profile: ${e.toString()}"));
    }
  }

  Future<void> forgotPassword() async {
    emit(ForgotPasswordLoading());
    final response = await userRepository.forgotPassword(
      email: forgotPasswordEmail.text,
    );
    response.fold(
      (errMessage) => emit(ForgotPasswordFailure(errMessage: errMessage)),
      (message) => emit(ForgotPasswordSuccess(message: message)),
    );
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    final response = await userRepository.resetPassword(
      email: forgotPasswordEmail.text,
      otp: otpController.text,
      newPassword: resetNewPassword.text,
    );
    response.fold(
      (errMessage) => emit(ResetPasswordFailure(errMessage: errMessage)),
      (message) {
        // Clear fields after successful reset
        // forgotPasswordEmail.clear();
        // otpController.clear();
        // resetNewPassword.clear();
        emit(ResetPasswordSuccess(message: message));
      },
    );
  }

  void clearProfileUpdateFields() {
    signUpFirstName.clear();
    signUpLastName.clear();
    signUpPhoneNumber.clear();
    signUpGender.clear();
    profilePic = null;
  }

  Future<void> getProfile() async {
    emit(GetUserLoading());
    final result = await userRepository.getUserProfile();
    result.fold(
      (error) => emit(GetUserFailure(errMessage: error)),
      (userModel) {
        CacheHelper().saveData(key: 'firstName', value: userModel.firstName);
        CacheHelper().saveData(key: 'lastName', value: userModel.lastName);
        CacheHelper().saveData(key: 'email', value: userModel.email);
        CacheHelper()
            .saveData(key: 'mobileNumber', value: userModel.mobileNumber);
        CacheHelper().saveData(key: 'gender', value: userModel.gender);
        CacheHelper().saveData(key: '_id', value: userModel.id);

        emit(GetUserSuccess(user: userModel));
      },
    );
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await CacheHelper().removeData(key: ApiKey.token);
      await CacheHelper().removeData(key: ApiKey.id);
      await CacheHelper().removeData(key: ApiKey.firstName);
      await CacheHelper().removeData(key: ApiKey.lastName);
      await CacheHelper().removeData(key: ApiKey.email);
      await CacheHelper().removeData(key: ApiKey.phone);
      await CacheHelper().removeData(key: ApiKey.gender);

      signInEmail.clear();
      signInPassword.clear();
      signUpFirstName.clear();
      signUpLastName.clear();
      signUpPhoneNumber.clear();
      signUpEmail.clear();
      signUpPassword.clear();
      signUpGender.clear();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(errMessage: "Logout failed: ${e.toString()}"));
    }
  }
}
