import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/cubit/user/user_cubit.dart';
import '../../../core/cubit/user/user_state.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = "edit profile screen";

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UpdateProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        } else if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          // Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final user = (state is GetUserSuccess) ? state.user : null;
        if (user != null) {
          context.read<UserCubit>().signUpFirstName.text = user.firstName;
          context.read<UserCubit>().signUpLastName.text = user.lastName;
          context.read<UserCubit>().signUpPhoneNumber.text = user.mobileNumber;
          context.read<UserCubit>().signUpGender.text = user.gender;
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Update Profile'),
          ),
          body: Padding(
            padding: REdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        context.read<UserCubit>().uploadProfilePic(image);
                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: context.read<UserCubit>().profilePic != null
                          ? FileImage(File(context.read<UserCubit>().profilePic!.path))
                          : (user?.profilePic != null
                              ? NetworkImage(user!.profilePic!)
                              : const AssetImage(
                                  'assets/images/avatar.png')) as ImageProvider,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomFormField(
                    controller: context.read<UserCubit>().signUpFirstName,
                    label: "First Name",
                    keyboard: TextInputType.name,
                    validate: (value) {
                      return null;
                    },
                  ),
                  CustomFormField(
                    controller: context.read<UserCubit>().signUpLastName,
                    label: "Last Name",
                    keyboard: TextInputType.name,
                    validate: (value) {
                      return null;
                    },
                  ),
                  CustomFormField(
                    controller: context.read<UserCubit>().signUpPhoneNumber,
                    label: "Phone Number",
                    keyboard: TextInputType.phone,
                    validate: (value) {
                      return null;
                    },
                  ),
                  CustomFormField(
                    controller: context.read<UserCubit>().signUpGender,
                    label: "Gender",
                    keyboard: TextInputType.name,
                    validate: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  state is SignInLoading
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                      label: "Update Profile",
                      onClick: () {
                          context.read<UserCubit>().updateProfile();
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
