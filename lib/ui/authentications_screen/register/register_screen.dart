import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cubit/user/user_cubit.dart';
import '../../../core/constants/constants.dart';
import '../../../core/cubit/user/user_state.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
          Navigator.of(context).pop();
          context.read<UserCubit>().signUpFirstName.clear();
          context.read<UserCubit>().signUpLastName.clear();
          context.read<UserCubit>().signUpEmail.clear();
          context.read<UserCubit>().signUpPassword.clear();
          context.read<UserCubit>().signUpConfirmPassword.clear();
          context.read<UserCubit>().signUpPhoneNumber.clear();
          context.read<UserCubit>().signUpGender.clear();
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Create Account"),
          ),
          body: Center(
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Form(
                key: context.read<UserCubit>().signUpFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFormField(
                        controller: context.read<UserCubit>().signUpFirstName,
                        label: "First Name",
                        keyboard: TextInputType.name,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001),
                      CustomFormField(
                        controller: context.read<UserCubit>().signUpLastName,
                        label: "Last Name",
                        keyboard: TextInputType.name,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      CustomFormField(
                        controller: context.read<UserCubit>().signUpEmail,
                        label: "Email Address",
                        keyboard: TextInputType.emailAddress,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your email";
                          }
                          if (!isValidEmail(value)) {
                            return "enter valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      CustomFormField(
                        controller: context.read<UserCubit>().signUpPassword,
                        isPassword: true,
                        label: "Password",
                        keyboard: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your password";
                          }
                          value = value.trim();
                          final RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                          if (!regex.hasMatch(value)) {
                            return "Password must be at least 8 characters,\ninclude uppercase, lowercase, number,\n and special character";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      CustomFormField(
                        controller:
                            context.read<UserCubit>().signUpConfirmPassword,
                        isPassword: true,
                        label: "Password confirmation",
                        keyboard: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your password confirmation";
                          }
                          if (value !=
                              context.read<UserCubit>().signUpPassword.text) {
                            return "should be same as password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      CustomFormField(
                        controller: context.read<UserCubit>().signUpPhoneNumber,
                        label: "Phone number",
                        keyboard: TextInputType.phone,
                        maxLength: 11,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your phone";
                          }
                          value = value.trim();
                          final RegExp regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
                          if (!regex.hasMatch(value)) {
                            return "Please enter a valid Egyptian phone number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      DropdownButtonFormField<String>(
                        value: context.read<UserCubit>().signUpGender.text.isNotEmpty
                            ? context.read<UserCubit>().signUpGender.text
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          border: UnderlineInputBorder(),
                          iconColor: Colors.black,
                        ),items: ['male', 'female'].map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender,
                              style: TextStyle(color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 15)),
                        );}).toList(),
                        onChanged: (value) {
                          context.read<UserCubit>().signUpGender.text = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      state is SignUpLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                                  label: "Create Account",
                                  onClick: () {
                                    if (context
                                            .read<UserCubit>()
                                            .signUpFormKey
                                            .currentState
                                            ?.validate() ==
                                        true) {
                                      context.read<UserCubit>().signUp();
                                    }
                                  }),
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
