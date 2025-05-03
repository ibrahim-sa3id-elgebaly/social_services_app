import '../../api/api_dio/end_ponits.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
//  final String gender;
  String profilePic="assets/images/avatar.png";

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
//    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      firstName: jsonData['user'][ApiKey.firstName],
      lastName: jsonData['user'][ApiKey.lastName],
      email: jsonData['user'][ApiKey.email],
      phone: jsonData['user'][ApiKey.phone],
    );
  }
}
