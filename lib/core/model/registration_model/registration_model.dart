class RegistrationsModel {
  final String id;
  final String eventId;
  final String name;
  final int age;
  final String gender;
  final String phone;
  final DateTime createdAt;
  final int version;
  final String errorMessage;

  RegistrationsModel({
    required this.id,
    required this.eventId,
    required this.name,
    required this.age,
    required this.gender,
    required this.phone,
    required this.createdAt,
    required this.version,
    required this.errorMessage,
  });

  factory RegistrationsModel.fromJson(Map<String, dynamic> json) {
    return RegistrationsModel(
      id: json['_id'] ?? "",
      eventId: json['eventId'] ?? "",
      name: json['name'] ?? "",
      age: json['age'] ?? 0,
      gender: json['gender'] ?? "",
      phone: json['phone'] ?? "",
      createdAt: DateTime.parse(json['createdAt']),
      version: json['__v'] ?? 0,
      errorMessage: json['error'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'eventId': eventId,
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
      '__v': version,
      'error': errorMessage,
    };
  }

}
