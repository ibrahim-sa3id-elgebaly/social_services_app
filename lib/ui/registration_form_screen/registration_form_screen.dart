import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cubit/emergency/emergency_state.dart';
import '../../core/cubit/emergency/emergency-cubit.dart';
import '../../core/cubit/user/user_state.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              title: Text(AppLocalizations.of(context)!.registration),
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
                        controller: context.read<EmergencyCubit>().registrationPhoneNumber,
                        label: "Phone number",
                        maxLength: 11,
                        keyboard: TextInputType.phone,
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
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: context.read<EmergencyCubit>().registrationGender.text.isNotEmpty
                            ? context.read<EmergencyCubit>().registrationGender.text
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          border: UnderlineInputBorder(),
                          iconColor: Colors.black,
                        ),items: ['male', 'female'].map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender,
                              style: const TextStyle(color: Colors.black,
                                  fontSize: 15)),
                        );}).toList(),
                        onChanged: (value) {
                          context.read<EmergencyCubit>().registrationGender.text = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 76),
                      state is SignUpLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                          label: AppLocalizations.of(context)!.register,
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
