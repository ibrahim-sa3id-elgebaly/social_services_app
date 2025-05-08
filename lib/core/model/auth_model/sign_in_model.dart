class SignInModel {
  final String token;
  final User user;

  SignInModel({
    required this.token,
    required this.user,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      token: json['token'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class User {
  final String profilePic;
  final String coverPic;
  final bool isDeleted;
  final bool isVerified;
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String mobileNumber;
  final String gender;
  final int v;

  User({
    required this.profilePic,
    required this.coverPic,
    required this.isDeleted,
    required this.isVerified,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.gender,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      profilePic: json['profilePic'] ?? '',
      coverPic: json['coverPic'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      isVerified: json['isVerified'] ?? false,
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      gender: json['gender'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}





/*
import '../../api/api_dio/end_ponits.dart';

class SignInModel {
  final String message;
  final String token;


  SignInModel({required this.message, required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKey.message],
      token: jsonData[ApiKey.token],
    );
  }
}
*/
