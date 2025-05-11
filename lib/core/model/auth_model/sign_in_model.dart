import 'package:social_serveces_app/core/model/auth_model/user_model.dart';

class SignInModel {
  final String token;
  final UserModel user;

  SignInModel({
    required this.token,
    required this.user,
  });

  SignInModel.fromJson(dynamic json)
      : token = json['token'],
        user = UserModel.fromJson(json['user']);

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }
}
