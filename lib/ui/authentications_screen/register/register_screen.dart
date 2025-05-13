import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:social_serveces_app/core/cubit/user_cubit.dart';
import '../../../core/constants/constants.dart';
import '../../../core/cubit/user_state.dart';
import '../../../core/style/app_colors.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_form_field.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

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
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text("Create Account"),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
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
                          if (value.length < 6) {
                            return "password should be at least 6";
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
                          if (value.length < 11) {
                            return "Please enter valid phone number";
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
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: UnderlineInputBorder(),
                    iconColor: Colors.black,
                  ),items: ['Male', 'Female'].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender,
                        style: TextStyle(color: Colors.black,
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
                          ? Center(child: CircularProgressIndicator())
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
