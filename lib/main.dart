import 'package:flutter/material.dart';
import 'package:flutterstudentmanagementapp/create_student.dart';
import 'package:flutterstudentmanagementapp/home.dart';
import 'package:flutterstudentmanagementapp/student_list.dart';
import 'package:flutterstudentmanagementapp/update_student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', initialRoute: '/', routes: {
      '/': (context) => HomeComponent(),
      '/list': (context) => StudentListComponent(),
      '/create': (context) => CreateStudent(),
    });
  }
}
