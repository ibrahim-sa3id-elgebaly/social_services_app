import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/user_cubit.dart';
import '../../../core/cubit/user_state.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: /*state is GetUserLoading
              ? const CircularProgressIndicator()
              : state is GetUserSuccess
              ?*/ ListView(
            children: [
              const SizedBox(height: 16),
              //! Profile Picture
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage("state.user.profilePic"),
              ),
              const SizedBox(height: 16),

              //! firstName
              ListTile(
                title: Text("state.user.firstName"),
                leading: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),

              //! lastName
              ListTile(
                title: Text("state.user.lastName"),
                leading: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),

              //! Email
              ListTile(
                title: Text("state.user.email"),
                leading: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),

              //! Phone number
              ListTile(
                title: Text("state.user.phone"),
                leading: const Icon(Icons.phone),
              ),
              const SizedBox(height: 16),

            ],
          )
//              : Container(),
        );
      },
    );
  }
}









/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/cubit/user_cubit.dart';
import '../../../core/cubit/user_state.dart';
import '../../../core/style/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "EditProfileScreen";
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  File? _pickedImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      builder:  (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryLightColor,
            title: const Text("Edit profile"),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is GetUserFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errMessage),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                          _pickedImage != null
                              ? FileImage(_pickedImage!)
                              : null,
                          child: _pickedImage == null
                              ? const Icon(Icons.add_a_photo, size: 50)
                              : null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                            labelText: 'First Name'),
                        validator: (value) =>
                        value!.isEmpty
                            ? 'Enter first name'
                            : null,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                            labelText: 'Last Name'),
                        validator: (value) =>
                        value!.isEmpty
                            ? 'Enter last name'
                            : null,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) =>
                        value!.isEmpty
                            ? 'Enter email'
                            : null,
                      ),
                      TextFormField(
                        controller: _mobileController,
                        decoration: const InputDecoration(
                            labelText: 'Mobile Number'),
                        validator: (value) =>
                        value!.isEmpty
                            ? 'Enter mobile number'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<EditProfileCubit>().updateProfile(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              mobile: _mobileController.text,
                              imagePath: _pickedImage?.path,
                            );
                          }
                        },
                        child: const Text('Save Changes'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}*/
