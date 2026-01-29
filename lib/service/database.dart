import 'package:day9_database_auth_girl/models/course.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

  signUp({required String email, required String password}) async {
    await supabase.auth.signUp(email: email, password: password);
  }

  login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  // ======================== CRUD operation ========================

  Future<List<Course>> getData() async {
    final data = await supabase.from('course').select();
    List<Course> couseLsit = [];

    for (var element in data) {
      Course c1 = Course.fromJson(element);
      couseLsit.add(c1);
    }
    return couseLsit;
  }

  addCourse({required String image,required String title})async{
    await supabase.from('course').insert({'image': image, 'title': title});
  }
}

extension N on String{
  bool get isValidText => length < 50;
}
