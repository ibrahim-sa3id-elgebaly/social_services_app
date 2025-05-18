import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/ui/authentications_screen/forgotten_password/reset_password.dart';
import '../../../core/constants/constants.dart';
import '../../../core/cubit/user_cubit.dart';
import '../../../core/cubit/user_state.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_form_field.dart';

class ForgottenPasswordScreen extends StatelessWidget {
  static const String routeName = "forgotten password screen";

  ForgottenPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ForgotPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        } else if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          Navigator.pushNamed(context, ResetPasswordScreen.routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Forgot Password')),
          body: Padding(
            padding: REdgeInsets.all(16),
            child: Form(
              key: context.read<UserCubit>().forgotPasswordFormKey,
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
                  const SizedBox(height: 20),
                  state is ForgotPasswordLoading
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                      label: "Send Reset otp",
                      onClick: () {
                        context.read<UserCubit>().forgotPassword();
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