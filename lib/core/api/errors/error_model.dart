import 'package:dio/dio.dart';

import '../api_dio/end_ponits.dart';

class ErrorModel {
  // final int status;
  final String errorMessage;

  ErrorModel({ required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData[ApiKey.errorMessage] ??
          jsonData['error'] ??
          'Unknown error occurred',
    );
  }

  factory ErrorModel.fromDioException(DioException e) {
    if (e.response?.data is Map<String, dynamic>) {
      return ErrorModel.fromJson(e.response!.data);
    }
    return ErrorModel(
      errorMessage: e.message ?? 'Network error occurred',
    );
  }

}
