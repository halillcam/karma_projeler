import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:karma_projeler/managers/shared_manager.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //sharedmanager instance
  final SharedManager sharedManager = SharedManager();

  var isLoading = false.obs;
}
