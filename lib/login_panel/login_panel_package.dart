import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPanelPackage extends StatelessWidget {
  const LoginPanelPackage({super.key});

  // Loading time
  Duration get loadingTime => const Duration(milliseconds: 2000);

  // login
  Future<String?> _authUser(LoginData login) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  // forgot password

  Future<String?> _recoverPassword(String data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  // sign up
  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        onLogin: _authUser,
        onRecoverPassword: _recoverPassword,
        onSignup: _signupUser,
      ),
    );
  }
}
