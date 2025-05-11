import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/ui/authentications_screen/forgotten_password/reset_password.dart';
import '../../../core/cubit/user_cubit.dart';
import '../../../core/cubit/user_state.dart';

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
        final cubit = context.read<UserCubit>();
        return Scaffold(
          appBar: AppBar(title: const Text('Forgot Password')),
          body: Padding(
            padding: REdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: cubit.forgotPasswordEmail,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  if (state is ForgotPasswordLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserCubit>().forgotPassword();
                        }
                      },
                      child: const Text('Send Reset otp'),
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