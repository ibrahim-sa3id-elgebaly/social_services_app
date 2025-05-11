import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/user_cubit.dart';
import '../../../core/cubit/user_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "reset password screen";

  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

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
        final cubit = context.read<UserCubit>();

        return Scaffold(
          appBar: AppBar(title: const Text('Reset Password')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email field (pre-filled from forgot password screen)
                  TextFormField(
                    controller: cubit.forgotPasswordEmail,
                    decoration: const InputDecoration(labelText: 'Email'),
                    readOnly: true, // Make it read-only as it comes from forgot password
                  ),
                  // OTP field
                  TextFormField(
                    controller: cubit.otpController,
                    decoration: const InputDecoration(labelText: 'OTP Code'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP code';
                      }
                      if (value.length != 6) {
                        return 'OTP must be 6 digits';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  // New Password field
                  TextFormField(
                    controller: cubit.resetNewPassword,
                    decoration: const InputDecoration(labelText: 'New Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a new password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  if (state is ResetPasswordLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserCubit>().resetPassword();
                        }
                      },
                      child: const Text('Reset Password'),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}