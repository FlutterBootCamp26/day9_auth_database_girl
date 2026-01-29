import 'package:day9_database_auth_girl/extension/nav.dart';
import 'package:day9_database_auth_girl/screens/login_screen.dart';
import 'package:day9_database_auth_girl/service/database.dart';
import 'package:day9_database_auth_girl/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "signUp page",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 100),
        child: Column(
          children: [
            TextFieldWidget(
              hint: "Enter you email",
              icon: Icon(Icons.email),
              controller: emailController,
            ),
            SizedBox(height: 24),
            TextFieldWidget(
              hint: "Enter you password",
              icon: Icon(Icons.password),
              controller: passwordController,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async{
                await Database().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: Text("Sign up"),
            ),
            TextButton(
              onPressed: () {
                context.pushAndClear(LoginScreen());
              },
              child: Text("already have ac account? login"),
            ),
          ],
        ),
      ),
    );
  }
}
