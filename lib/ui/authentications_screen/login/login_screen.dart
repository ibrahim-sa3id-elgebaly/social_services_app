import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cubit/user/user_state.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/constants/constants.dart';
import '../../../core/cubit/user/user_cubit.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_form_field.dart';
import '../../../widget/skip_button.dart';
import '../../home/home_screen.dart';
import '../forgotten_password/forgotten_password_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) async{
        if (state is SignInSuccess) {
          await CacheHelper.saveInitialRoute(HomeScreen.routeName);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Successful"),
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (Route<dynamic> route) => false,
          );
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: Center(
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Form(
                key: context.read<UserCubit>().signInFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFormField(
                        controller: context.read<UserCubit>().signInEmail,
                        label: "Email Address",
                        keyboard: TextInputType.emailAddress,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          if (!isValidEmail(value)) {
                            return "enter valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomFormField(
                        controller: context.read<UserCubit>().signInPassword,
                        isPassword: true,
                        label: "Password",
                        keyboard: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your password";
                          }
                          if (value.length < 6) {
                            return "password should be at least 6";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 55.h),
                      state is SignInLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              label: "Login",
                              onClick: () {
                                if (context
                                        .read<UserCubit>()
                                        .signInFormKey
                                        .currentState
                                        ?.validate() ==
                                    true) {
                                  context.read<UserCubit>().signIn();
                                }
                              }),
                      SizedBox(height: 10.h),
                      SkipButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgottenPasswordScreen.routeName);
                        },
                        text: "Forgotten password?",
                      ),
                      SizedBox(height: 55.h),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: const Text(
                            "Or create new account",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
