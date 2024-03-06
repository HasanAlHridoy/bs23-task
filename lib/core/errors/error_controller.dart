
import 'package:flutter/material.dart';

import '../../helper/dailog_helper.dart';
import 'app_exceptions.dart';

mixin ErrorController {
  void handleError(error) {
    DialogHelper.hideLoading();
    if (error is BadRequestException) {
      showSnackbar(message: error.message.toString(), isError: true);
    } else if (error is FetchDataException) {
      showSnackbar(message: error.message.toString(), isError: true);
    } else if (error is DataNotFoundException) {
      showSnackbar(message: error.message.toString(), isError: true);
    } else if (error is ApiNotRespondingException) {
      showSnackbar(message: 'Oops! It took longer to respond.', isError: true);
    } else if (error is UnauthorizedException) {
      showSnackbar(message: error.message.toString(), isError: true);
    }
  }

  // showLoading([String? message = "Please Wait"]) {
  //   DialogHelper.showLoading(message: message);
  // }

  // hideLoading() {
  //   DialogHelper.hideLoading();
  // }

  void showSnackbar({required String message, bool isError = false}) {
    // Get.snackbar(
    //   isError ? 'Error' : 'Success',
    //   message,
    //   // backgroundColor: isError ? appTheme.pink : theme.colorScheme.primary,
    //   colorText: Colors.white,
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }
}
