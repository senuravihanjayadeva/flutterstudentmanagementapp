import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudentmanagementapp/student_list.dart';

import 'bottom_navigation.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({Key? key}) : super(key: key);

  @override
  _HomeComponentState createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Text("HomePage"),
        ),
        bottomNavigationBar: BottomNavigation(0));
  }
}
