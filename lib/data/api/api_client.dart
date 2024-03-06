import 'dart:convert';

import '../../core/errors/app_exceptions.dart';
import '../../helper/dailog_helper.dart';

class ApiClient{

  String? get baseUrl => "https://api-afvstage.neoscoder.com/api/v1/";

  // Future<dynamic> getData(String endpoint) async {
  //   final response = await connect.get(
  //     '$baseUrl/$endpoint',
  //     headers: {
  //       'Authorization': 'Bearer ''}',
  //     },
  //   );
  //   return _processResponse(response);
  // }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data,
      {bool useBearerToken = true}) async {
    try {
      final headers = useBearerToken
          ? {
              'Authorization': 'Bearer ''}',
            }
          : {};

      // Response response = await connect.post(
      //   '$baseUrl/$endpoint',
      //   json.encode(data),
      //   headers: headers.cast<String, String>(),
      // );

      // var responseJson = _processResponse(response);
      // DialogHelper.colorPrint("${response.body}",error: false);
      // return responseJson;
    } catch (e) {
      print("Error in postData: $e");
      throw e;
    }
  }
}

// _processResponse(Response response) async {
//   switch (response.statusCode) {
//     case 200:
//            DialogHelper.colorPrint("${response.body}",error: false);
//       var resJson = response.bodyString!;
//       return resJson;
//     case 400:
//      DialogHelper.colorPrint("${response.body}",error: true);
//       throw BadRequestException(
//           response.bodyString!, response.request?.url.toString());
//     case 401:
//          DialogHelper.colorPrint("${response.body}",error: true);
//       final Map<String, dynamic> errorData = json.decode(response.bodyString!);
//       final String errorMessage = errorData['errors']['message'];
//       throw UnauthorizedException(
//           errorMessage, response.request?.url.toString());
//     case 404:
//          DialogHelper.colorPrint("${response.body}",error: true);
//
//       final Map<String, dynamic> errorData = json.decode(response.bodyString!);
//       final String errorMessage = errorData['errors']['message'];
//       throw DataNotFoundException(
//           errorMessage, response.request?.url.toString());
//     case 500:
//     default:
//       throw FetchDataException(
//           "Error occured with code: ${response.statusCode}",
//           response.request?.url.toString());
//   }
// }
