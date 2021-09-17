import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'bottom_navigation.dart';
import 'package:http/http.dart' as http;

class CreateStudent extends StatefulWidget {
  const CreateStudent({Key? key}) : super(key: key);

  @override
  _CreateStudentState createState() => _CreateStudentState();
}

Future<http.Response> createStudent(
    String name, String age, BuildContext context) {
  Map data = {
    "name": name,
    "age": int.parse(age),
  };

  var response = http.post(
    Uri.parse('https://springbootsenu.herokuapp.com/createstudent'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
  print("response");
  response.then((value) => {
        if (value.statusCode == 200) {Navigator.pushNamed(context, '/list')}
      });

  return response;
}

class _CreateStudentState extends State<CreateStudent> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  color.AppColor.gradientFirst,
                  color.AppColor.gradientSecond
                ]),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.face_outlined,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ADD STUDENT",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  // Add TextFormFields and ElevatedButton here.
                  TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Student Name',
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Student Age',
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      createStudent(
                          nameController.text, ageController.text, context);
                    },
                    child: const Text('ADD'),
                  ),
                ],
              ),
            ),
          ))
        ],
      )),
      bottomNavigationBar: BottomNavigation(2),
    );
  }
}
