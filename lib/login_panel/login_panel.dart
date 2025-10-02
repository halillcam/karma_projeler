import 'package:flutter/material.dart';

class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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

                //password Textfield
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text("Login", style: TextStyle(color: Colors.amber)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
