import 'location_model.dart';

class ServiceApiModel {
  final String id;
  final String name;
  final String? description;
  final String address;
  final String contactNumber;
  final String? createdAt;
  final String? workingHours;
  final bool isActive;
  final int v;
  final LocationModel location;

  ServiceApiModel({
    required this.id,
    required this.name,
    this.description,
    required this.address,
    required this.contactNumber,
    this.workingHours,
    this.createdAt,
    required this.isActive,
    required this.v,
    required this.location,
  });

  factory ServiceApiModel.fromJson(Map<String, dynamic> json) {
    return ServiceApiModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      contactNumber: json['contactNumber'],
      workingHours: json['workingHours'],
      createdAt: json['createdAt'],
      isActive: json['isActive'],
      v: json['__v'],
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'address': address,
      'contactNumber': contactNumber,
      'workingHours': workingHours,
      'isActive': isActive,
      '__v': v,
      'location': location.toJson(),
      'description': description,
      'createdAt': createdAt,
    };
  }
}
