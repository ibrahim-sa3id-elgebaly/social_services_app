class EmergencyModel {
  final bool urgent;
  final String id;
  final String name;
  final String governorate;
  final String phone;
  final String description;
  final DateTime createdAt;
  final int v;
  final String errorMessage;

  EmergencyModel({
    required this.urgent,
    required this.id,
    required this.name,
    required this.governorate,
    required this.phone,
    required this.description,
    required this.createdAt,
    required this.v,
    required this.errorMessage,
  });

  factory EmergencyModel.fromJson(Map<String, dynamic> json) {
    return EmergencyModel(
      urgent: json['urgent'] ?? false,
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      governorate: json['governorate'] ?? '',
      phone: json['phone'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      v: json['__v'] ?? 0,
      errorMessage: json['error'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'urgent': urgent,
      '_id': id,
      'name': name,
      'governorate': governorate,
      'phone': phone,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      '__v': v,
      'error': errorMessage,
    };
  }
}
