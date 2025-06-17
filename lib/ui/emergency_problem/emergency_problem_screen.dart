import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/cubit/emergency/emergency-cubit.dart';
import '../../core/cubit/emergency/emergency_state.dart';
import '../../core/cubit/user/user_state.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmergencyProblemScreen extends StatelessWidget {
  static const String routeName = "Emergency Problem Screen";
  const EmergencyProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<EmergencyCubit, EmergencyState>(
        listener: (context, state) {
          if (state is PostProblemSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Posted successfully"),
              duration: Duration(seconds: 1),
            ));
            context.read<EmergencyCubit>().postEmergencyName.clear();
            context.read<EmergencyCubit>().postEmergencyGovernorate.clear();
            context.read<EmergencyCubit>().postEmergencyPhoneNumber.clear();
            context.read<EmergencyCubit>().postEmergencyDescription.clear();
            context.read<EmergencyCubit>().postEmergencyUrgent = false;
          } else if (state is PostProblemFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
          }
        },
        builder: (context, state) {
          final cubit = context.read<EmergencyCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text("Emergency Problem"),
            ),
            body: Padding(
              padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Form(
                key: cubit.postEmergencyFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    CustomFormField(
                    controller: cubit.postEmergencyName,
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
                    controller: cubit.postEmergencyGovernorate,
                    label: "address",
                    keyboard: TextInputType.text,
                    validate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomFormField(
                    controller: cubit.postEmergencyPhoneNumber,
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
                  SizedBox(height: 16.h),
                  CustomFormField(
                    maxLines: 7,
                    controller: cubit.postEmergencyDescription,
                    label: "description",
                    keyboard: TextInputType.text,
                    validate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your description";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                      DropdownButtonFormField<bool>(
                        value: cubit.postEmergencyUrgent,
                        decoration: const InputDecoration(
                          labelText: 'is it Urgent',
                          border: UnderlineInputBorder(),
                          iconColor: Colors.black,
                        ),
                        items: const [
                          DropdownMenuItem<bool>(
                            value: true,
                            child: Text('Yes', style: TextStyle(color: Colors.black, fontSize: 15)),
                          ),
                          DropdownMenuItem<bool>(
                            value: false,
                            child: Text('No', style: TextStyle(color: Colors.black, fontSize: 15)),
                          ),
                        ],
                        onChanged: (value) {
                          cubit.postEmergencyUrgent = value ?? false;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select urgency';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 76.h),
                      state is SignUpLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                          label: AppLocalizations.of(context)!.post,
                          onClick: () {
                            if (cubit.postEmergencyFormKey.currentState?.validate() == true) {
                              cubit.postEmergency();
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/cubit/emergency/emergency-cubit.dart';
import '../../core/cubit/emergency/emergency_state.dart';
import '../../core/cubit/user/user_state.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_form_field.dart';

class EmergencyProblemScreen extends StatelessWidget {
  static const String routeName = "Emergency Problem Screen";
  const EmergencyProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<EmergencyCubit, EmergencyState>(listener: (context, state) {
      if (state is PostProblemSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("post succefuly"),
          duration: Duration(seconds: 1),
        ));
        context.read<EmergencyCubit>().postEmergencyName.clear();
        context.read<EmergencyCubit>().postEmergencyGovernorate.clear();
        context.read<EmergencyCubit>().postEmergencyPhoneNumber.clear();
        context.read<EmergencyCubit>().postEmergencyDescription.clear();
      } else if (state is PostProblemFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errMessage),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Emergency Problem"),
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: context.read<EmergencyCubit>().postEmergencyFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomFormField(
                    controller:
                        context.read<EmergencyCubit>().postEmergencyName,
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
                    controller:
                        context.read<EmergencyCubit>().postEmergencyGovernorate,
                    label: "address",
                    keyboard: TextInputType.text,
                    validate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomFormField(
                    controller:
                        context.read<EmergencyCubit>().postEmergencyPhoneNumber,
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
                  SizedBox(height: 16.h),
                  CustomFormField(
                    maxLines: 7,
                    controller:
                        context.read<EmergencyCubit>().postEmergencyDescription,
                    label: "description",
                    keyboard: TextInputType.text,
                    validate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your description";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  DropdownButtonFormField<String>(
                    value: context.read<EmergencyCubit>().postEmergencyUrgent.text.isNotEmpty
                        ? context.read<EmergencyCubit>().postEmergencyUrgent.text
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Urgent',
                      border: UnderlineInputBorder(),
                      iconColor: Colors.black,
                    ),items: ['true', 'false'].map((gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender,
                          style: TextStyle(color: Colors.black,
                              fontSize: 15)),
                    );}).toList(),
                    onChanged: (value) {
                      context.read<EmergencyCubit>().postEmergencyUrgent = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 76.h),
                  state is SignUpLoading
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                          label: "Post problem",
                          onClick: () {
                            if (context
                                    .read<EmergencyCubit>()
                                    .postEmergencyFormKey
                                    .currentState
                                    ?.validate() ==
                                true) {
                              context.read<EmergencyCubit>().postEmergency();
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
*/
