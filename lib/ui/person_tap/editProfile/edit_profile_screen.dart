import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/cubit/user_cubit.dart';
import '../../../core/cubit/user_state.dart';

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
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final cubit = context.read<UserCubit>();
        final user = (state is GetUserSuccess) ? state.user : null;

        if (user != null) {
          cubit.signUpFirstName.text = user.firstName!;
          cubit.signUpLastName.text = user.lastName!;
          cubit.signUpPhoneNumber.text = user.mobileNumber!;
          cubit.signUpGender.text = user.gender!;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text('Update Profile'),
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 22.sp),
            iconTheme: const IconThemeData(
                color: Colors.white
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      cubit.uploadProfilePic(image);
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: cubit.profilePic != null
                        ? FileImage(File(cubit.profilePic!.path))
                        : (user?.profilePic != null
                            ? NetworkImage(user!.profilePic!)
                            : const AssetImage(
                                'assets/default_profile.png')) as ImageProvider,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: cubit.signUpFirstName,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextFormField(
                  controller: cubit.signUpLastName,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                TextFormField(
                  controller: cubit.signUpPhoneNumber,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                ),
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
                const SizedBox(height: 20),
                if (state is UpdateProfileLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () => cubit.updateProfile(),
                    child: const Text('Update Profile'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
