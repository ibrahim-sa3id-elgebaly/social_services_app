class ForgetPasswordModel {

  final String message;

  ForgetPasswordModel({required this.message});

  ForgetPasswordModel.fromJson(dynamic json)
      : message = json['message'];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
