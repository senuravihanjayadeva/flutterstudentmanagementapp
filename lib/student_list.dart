import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudentmanagementapp/modules/student_list_module.dart';

import 'bottom_navigation.dart';

class StudentListComponent extends StatefulWidget {
  const StudentListComponent({Key? key}) : super(key: key);

  @override
  _StudentListComponentState createState() => _StudentListComponentState();
}

class _StudentListComponentState extends State<StudentListComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Student List",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(child: StudentListModule())
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(1));
  }
}
