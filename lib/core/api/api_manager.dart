import 'package:dio/dio.dart';
import 'package:social_serveces_app/core/model/emergency_model/Emergency_model.dart';
import '../model/service_api_model/service_api_model.dart';
import 'api_dio/end_ponits.dart';

class ApiManager {


  static Future<List<ServiceEventApiModel>> getServiceEvent(String serviceEventId) async {
    try {
      final response = await Dio().get('${EndPoint.baseUrl}$serviceEventId');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => ServiceEventApiModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load blood bank locations');
      }
    } catch (e) {
      print('Error in getService: $e');
      rethrow;
    }
  }

  static Future<List<EmergencyModel>> getEmergencyProblem() async {
    try {
      final response = await Dio().get('${EndPoint.baseUrl}${EndPoint.postEmergency}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => EmergencyModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error in getService: $e');
      rethrow;
    }
  }


}
