import 'package:day9_database_auth_girl/screens/home_screen.dart';
import 'package:day9_database_auth_girl/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "SUPABASE_URL", // change to your own url
    anonKey: "SUPABASE_ANON_KEY", // change to your own key
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen()
    );
  }
}
