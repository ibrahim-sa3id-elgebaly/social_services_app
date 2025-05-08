import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../cache/cache_helper.dart';
import '../model/auth_model/sign_in_model.dart';
import '../repositories/user_repository.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final UserRepository userRepository;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up first name
  TextEditingController signUpFirstName = TextEditingController();
  //Sign up last name
  TextEditingController signUpLastName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController signUpConfirmPassword = TextEditingController();
  //Sign up gender
  TextEditingController signUpGender = TextEditingController();

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
    try {
      final token = await CacheHelper().getData(key: 'token');
      if (token != null) {
        await getUserProfile(); // Reuse your existing method
      }
    } catch (e) {
      // Silent error - don't emit any state if loading fails
    }
  }



}
