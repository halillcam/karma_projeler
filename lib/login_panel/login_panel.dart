import 'package:flutter/material.dart';
import 'package:karma_projeler/managers/shared_manager.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({super.key});

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SharedManager sharedManager = SharedManager();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    await sharedManager.init();

    _loadSavedEmail();
  }

  void _loadSavedEmail() {
    final savedEmail = sharedManager.getString(SharedKeys.counter);
    if (savedEmail != null) {
      emailController.text = savedEmail;
    }
  }

  // Login işlemi
  Future<void> _handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage("Lütfen tüm alanları doldurun");
      return;
    }

    changeLoading();
    await sharedManager.saveString(SharedKeys.counter, email);
    await Future.delayed(Duration(seconds: 1));

    changeLoading();

    _showMessage("Giriş başarılı!");
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page", style: TextStyle(color: Colors.blue, fontSize: 25)),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          child: Container(
            width: 400,
            height: 305,
            padding: EdgeInsets.all(20),
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(width: 10),
                Text(
                  "Login Page",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                SizedBox(height: 20),

                // E-mail Textfield
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "E-mail", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),

                // Password Textfield
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                ),
                SizedBox(height: 35),

                // Login Button
                ElevatedButton(
                  onPressed: isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.amber, strokeWidth: 2),
                        )
                      : Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
