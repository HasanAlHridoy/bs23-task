import 'package:hive_flutter/adapters.dart';

class Boxes {
  Box<dynamic> get repositoryBox => Hive.box('repositoryBox');
}
