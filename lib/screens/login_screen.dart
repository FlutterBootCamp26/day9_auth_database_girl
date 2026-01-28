import 'package:day9_database_auth_girl/extension/nav.dart';
import 'package:day9_database_auth_girl/screens/home_screen.dart';
import 'package:day9_database_auth_girl/screens/sign_up_screen.dart';
import 'package:day9_database_auth_girl/service/database.dart';
import 'package:day9_database_auth_girl/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: Text(
          "Login page",
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
              onPressed: () async {
                try {
                  await Database().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  if (context.mounted) {
                    context.push(HomeScreen());
                  }
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }

              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                context.pushAndClear(SignUpScreen());
              },
              child: Text("don't have ac account? sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
