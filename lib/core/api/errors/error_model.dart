import '../api_dio/end_ponits.dart';

class ErrorModel {
  // final int status;
  final String errorMessage;

  ErrorModel({ required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
//      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage],
    );
  }
}
