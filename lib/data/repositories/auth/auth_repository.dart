
import '../../../core/errors/error_controller.dart';
import '../../api/api_client.dart';
import 'auth_repository_interface.dart';

class AuthRepository with ErrorController implements AuthRepositoryInterface {
  final apiClient = ApiClient();

  // @override
  // Future<RegisterResponseModel> register(RegisterRequestModel entity) async {
  //   var body = {
  //     'phone': entity.phone,
  //     'password': entity.password,
  //     'fullName': entity.fullName,
  //     'customerFacebookId': entity.customerFacebookId,
  //     'email': entity.email,
  //     'phoneVerified': entity.phoneVerified,
  //     'emailVerified': entity.emailVerified,
  //     'image': entity.image,
  //     'otp': entity.otp,
  //     'lastLoginTime': entity.lastLoginTime
  //   };
  //
  //   print('registerBody $body');
  //
  //   try {
  //     var response = await apiClient.postData("auth/register", body,
  //         useBearerToken: false);
  //
  //     var registerResponsModel = registerResponseModelFromJson(response);
  //
  //     return registerResponsModel;
  //   } catch (e) {
  //     handleError(e);
  //     throw Exception('Error in regsiter: $e');
  //   }
  // }


}
