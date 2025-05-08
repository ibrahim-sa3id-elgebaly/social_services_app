class EventApiModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final String time;
  final String contactNumber;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  EventApiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.time,
    required this.contactNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory EventApiModel.fromJson(Map<String, dynamic> json) {
    return EventApiModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      contactNumber: json['contactNumber'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
      'time': time,
      'contactNumber': contactNumber,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
