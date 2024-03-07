import 'dart:convert';

import '../../../core/errors/error_controller.dart';
import '../../api/api_client.dart';
import 'repository_interface.dart';

class RepositoryData with ErrorController implements RepositoryInterface {
  final apiClient = ApiClient();

  @override
  Future<Map<String, dynamic>> getRepositoryData(String params) async {
    try {
      var response = await apiClient.getData("search/repositories?q=$params");

      Map<String, dynamic> getRepositoryData = jsonDecode(response);
      return getRepositoryData;
    } catch (e) {
      handleError(e);
      throw Exception('Error in Repository => $e');
    }
  }
}
