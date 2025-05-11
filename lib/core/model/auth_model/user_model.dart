class UserModel {
  String? profilePic;
  String? coverPic;
  bool? isDeleted;
  bool? isVerified;
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String mobileNumber;
  final String gender;
  num? v;

  UserModel({
    this.profilePic,
    this.coverPic,
    this.isDeleted,
    this.isVerified,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.gender,
    this.v,
  });

  UserModel.fromJson(dynamic json)
      : profilePic = json['profilePic'],
        coverPic = json['coverPic'],
        isDeleted = json['isDeleted'],
        isVerified = json['isVerified'],
        id = json['_id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        password = json['password'],
        mobileNumber = json['mobileNumber'],
        gender = json['gender'],
        v = json['__v'];

  Map<String, dynamic> toJson() {
    return {
      'profilePic': profilePic,
      'coverPic': coverPic,
      'isDeleted': isDeleted,
      'isVerified': isVerified,
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber,
      'gender': gender,
      '__v': v,
    };
  }
}
