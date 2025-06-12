import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cubit/emergency/emergency_state.dart';
import '../../core/cubit/emergency/emergency-cubit.dart';
import '../../core/cubit/user/user_state.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_form_field.dart';

class RegistrationFormScreen extends StatelessWidget {
  static const String routeName = "Registration Form Screen";
  const RegistrationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventId = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
        child: BlocConsumer<EmergencyCubit, EmergencyState>(listener: (context, state) {
          if (state is RegistrationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Registration successfully"),
              duration: Duration(seconds: 1),
            ));
            context.read<EmergencyCubit>().registrationName.clear();
            context.read<EmergencyCubit>().registrationAge.clear();
            context.read<EmergencyCubit>().registrationGender.clear();
            context.read<EmergencyCubit>().registrationPhoneNumber.clear();
          } else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
          }
        }, builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Registration Form"),
            ),
            body: Padding(
              padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Form(
                key: context.read<EmergencyCubit>().registrationFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomFormField(
                        controller: context.read<EmergencyCubit>().registrationName,
                        label: "name",
                        keyboard: TextInputType.text,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomFormField(
                        controller: context.read<EmergencyCubit>().registrationAge,
                        label: "age",
                        keyboard: TextInputType.number,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your age";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomFormField(
                        controller: context.read<EmergencyCubit>().registrationGender,
                        label: "Gender",
                        keyboard: TextInputType.text,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your gender";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomFormField(
                        controller: context.read<EmergencyCubit>().registrationPhoneNumber,
                        label: "Phone number",
                        keyboard: TextInputType.phone,
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
                      const SizedBox(height: 76),
                      state is SignUpLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                          label: "Register",
                          onClick: () {
                            if (context
                                .read<EmergencyCubit>()
                                .registrationFormKey
                                .currentState
                                ?.validate() ==
                                true) {
                              context.read<EmergencyCubit>().registrationForm(eventId);
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
