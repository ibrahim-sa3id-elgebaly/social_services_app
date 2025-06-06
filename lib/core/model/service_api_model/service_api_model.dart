
class ServiceEventApiModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final String formattedTime;
  final String contactNumber;
  final DateTime createdAt;
  final int v;

  ServiceEventApiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.formattedTime,
    required this.contactNumber,
    required this.createdAt,
    required this.v,
  });

  factory ServiceEventApiModel.fromJson(Map<String, dynamic> json) {
    return ServiceEventApiModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      formattedTime: json['time'],
      contactNumber: json['contactNumber'],
      createdAt: DateTime.parse(json['createdAt']),
      v: json['__v'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
      'time': formattedTime,
      'contactNumber': contactNumber,
      'createdAt': createdAt.toIso8601String(),
      '__v': v,
    };
  }
}
