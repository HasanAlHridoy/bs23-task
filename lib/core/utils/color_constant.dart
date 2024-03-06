import 'package:flutter/material.dart' as mat;
import 'package:flutter/material.dart';

class App {
  double? _height;
  double? _width;
  double? _originalWidth;
  double? _heightPadding;
  double? _widthPadding;

  App(context) {
    mat.MediaQueryData _queryData = mat.MediaQuery.of(context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _originalWidth = _queryData.size.width;
    _heightPadding = _height! - ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding = _width! - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height! * v;
  }

  double appWidth(double v) {
    return _width! * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding! * v;
  }

  double appHorizontalPadding(double v) {
    return _widthPadding! * v;
  }

  double aspectRatioValue(double v) {
    return _originalWidth! / v;
  }
}

class ConfigColors {
  static Color secondColor = const Color(0xFF344968);
  static Color mainPrimaryColor = const Color(0xFF24338A);
  static Color scaffoldDarkColor = const Color(0xFF2C2C2C);
  static Color secondDarkColor = const Color(0xFFccccdd);
  static Color whiteGrey = const Color(0xFFEEEEEE);
  static Color accentDarkColor = const Color(0xFF9999aa);
  static Color lightGrey = const Color(0xFF686868);
  static Color scaffoldColor = const Color(0xFFFAFAFA);
  static Color accentColor = const Color(0xFF8C98A8);
  static Color greenColor = const Color(0xFF0EAC9F);
  static Color yellow = const Color(0xFFFFA200);
  static Color grayWhite = const Color(0xFFEEEEEE);
  static Color iconColor = const Color(0xFF2B2B2B);
  static Color placeholderColor = const Color(0xFFCACACA);
  static Color containerBgColor = const Color(0xFFF7F6FB);
  static Color selectedItemColor = const Color(0xFF24338A);

  static Color mainColor = mat.Colors.white;
  static Color errorColor = const Color.fromARGB(255, 173, 48, 48);
}

class AppAssets {
  static const demoUser = "assets/img/user_demo.jpg";

  // splash screen
  static const splash = 'assets/img/splash_screen.svg';

  static const mainLogo = 'assets/svg/main_logo.svg';

  // settings screen
  static const settingAccount = 'assets/setting/account.svg';
  static const settingNotification = 'assets/setting/notification.svg';
  static const settingPrivacy = 'assets/setting/privacy_security.svg';
  static const settingHelp = 'assets/setting/help.svg';
  static const settingAbout = 'assets/setting/about.svg';
  static const settingLogout = 'assets/setting/logout.svg';
  static const warranty = 'assets/setting/warranty.svg';

  // Product List
  static const search = 'assets/svg/search.svg';
  static const filter = 'assets/svg/filter.svg';
  static const line = 'assets/svg/line.svg';

  // home screen
  static const imgCar1 = 'assets/img/img_carousel_1.png';
  static const imgCar2 = 'assets/img/img_carousel_2.png';
  static const imgCar3 = 'assets/img/img_carousel_3.png';
  static const warrantyRules = 'assets/home/warranty_rules.svg';
  static const homeSelected = 'assets/home/home_selected.svg';
  static const homeUnelected = 'assets/home/home_unselected.svg';
  static const listSelected = 'assets/home/list_selected.svg';
  static const listUnselected = 'assets/home/list_unselected.svg';
  static const reportSelected = 'assets/home/report_selected.svg';
  static const reportUnselected = 'assets/home/report_unselected.svg';
  static const settingsSelected = 'assets/home/settings_selected.svg';
  static const settingsUnselected = 'assets/home/settings_unselected.svg';

//
  static const fbIcon = 'assets/home/facebook.svg';
  static const webIcon = 'assets/home/website.svg';
  static const questionIcon = 'assets/svg/question.svg';
  static const upDownIcon = 'assets/svg/upDown.svg';
}
