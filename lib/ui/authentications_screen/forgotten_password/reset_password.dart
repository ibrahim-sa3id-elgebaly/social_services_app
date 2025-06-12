import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../core/cubit/user/user_cubit.dart';
import '../../../core/cubit/user/user_state.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "reset password screen";

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        } else if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reset Password'),
          ),
          body: Padding(
            padding: REdgeInsets.all(16),
            child: Form(
              key: context.read<UserCubit>().resetPasswordFormKey  ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomFormField(
                    controller: context.read<UserCubit>().forgotPasswordEmail,
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
                  // OTP field
                  CustomFormField(
                    controller: context.read<UserCubit>().otpController,
                    label: "OTP Code",
                    keyboard: TextInputType.number,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP code';
                      }
                      if (value.length != 6) {
                        return 'OTP must be 6 digits';
                      }
                      return null;
                    },
                  ),
                  // New Password field
                  CustomFormField(
                    controller: context.read<UserCubit>().resetNewPassword,
                    isPassword: true,
                    label: " New Password",
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
                  const SizedBox(height: 20),
                  state is ResetPasswordLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          label: "Reset Password",
                          onClick: () {
                            if (context
                                    .read<UserCubit>()
                                    .resetPasswordFormKey
                                    .currentState
                                    ?.validate() ==
                                true) {
                              context.read<UserCubit>().resetPassword();
                            }
                          }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
