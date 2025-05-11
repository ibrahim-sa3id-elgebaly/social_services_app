
class SignUpModel {

  final String message;

  SignUpModel({required this.message});

  SignUpModel.fromJson(dynamic json)
      : message = json['message'];


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
