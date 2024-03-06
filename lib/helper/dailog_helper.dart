
import 'package:flutter/material.dart';

import '../core/app_export.dart';

class DialogHelper {
  // show error dialog
 static void colorPrint(String message,{bool? error = true,String query =""}) {
     if(error!) {print("\x1B[37m $query\n\x1B[31m$message\x1B[0m");}else{
      debugPrint("\x1B[32m$query\n\x1B[33m$message\x1B[0m");
     }}
  static void showLoading({String? message = "Please Wait"}) {
    // Get.dialog(AlertDialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10)
    //   ),
    //   title: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           Padding(
    //             padding: EdgeInsets.all(0.0),
    //             child:   CustomImageView(
    //               imagePath: ImageConstant.afvlogo,
    //               // color: Color(0XFF8DC63F),
    //             ),
    //           ),
    //           // Lottie image
    //           Lottie.asset(LottieConstant.loaderLotties,
    //               height: 100.adaptSize, width: 100.adaptSize, fit: BoxFit.fill),
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    //             child: Text(message!,style: TextStyle(
    //               color: Colors.black
    //             ),),
    //           ),
    //
    //           //Description
    //         ],
    //       ),
    //     ],
    //   ),
    // )

    // );
  }

  static void hideLoading() {
    // if (Get.isDialogOpen!) Get.back();
  }
}