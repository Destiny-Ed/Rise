import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    final TextEditingController usernameController = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to Rise", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Image.asset("assets/auth_image.png", height: 200),
          SizedBox(height: 30),
          TextField(controller: usernameController, decoration: InputDecoration(labelText: "Enter Username")),
          SizedBox(height: 30),

          ElevatedButton.icon(icon: Icon(Icons.g_mobiledata), label: Text("Sign in with Google"), onPressed: () {}),
          SizedBox(height: 20),
          ElevatedButton.icon(icon: Icon(Icons.apple), label: Text("Sign in with Apple"), onPressed: () {}),
        ],
      ),
    );
  }
}
