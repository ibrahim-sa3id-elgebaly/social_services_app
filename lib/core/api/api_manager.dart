import 'package:dio/dio.dart';
import '../model/event_api_model/event_api_model.dart';
import '../model/service_api_model/service_api_model.dart';
import 'api_dio/end_ponits.dart';

class ApiManager {


  static Future<List<ServiceApiModel>> getService(String serviceId) async {
    try {
      final response = await Dio().get('${EndPoint.baseUrl}$serviceId');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => ServiceApiModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load blood bank locations');
      }
    } catch (e) {
      print('Error in getService: $e');
      rethrow;
    }
  }

  static Future<List<EventApiModel>> getEvent(String serviceId) async {
    try {
      final response = await Dio().get('${EndPoint.baseUrl}$serviceId');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => EventApiModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load blood bank locations');
      }
    } catch (e) {
      print('Error in getService: $e');
      rethrow;
    }
  }

}
