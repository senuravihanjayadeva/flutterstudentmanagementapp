import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudentmanagementapp/models/Student.dart';
import 'package:flutterstudentmanagementapp/update_student.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StudentListModule extends StatefulWidget {
  const StudentListModule({Key? key}) : super(key: key);

  @override
  _StudentListModuleState createState() => _StudentListModuleState();
}

void deleteStudent(String id, BuildContext context) async {
  final http.Response response = await http.delete(
    Uri.parse('https://springbootsenu.herokuapp.com/students/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  Navigator.pushNamed(context, '/list');
}

List<Student> parseStudents(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Student>((json) => Student.fromJson(json)).toList();
}

Future<List<Student>> fetchStudents(http.Client client) async {
  print("called");
  final response = await client
      .get(Uri.parse('https://springbootsenu.herokuapp.com/students'));

  // Use the compute function to run parseStudents in a separate isolate.
  return parseStudents(response.body);
}

class _StudentListModuleState extends State<StudentListModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Student>>(
      future: fetchStudents(http.Client()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Text("Loading"),
          );
        } else
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.face_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(snapshot.data![index].name),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(snapshot.data![index].age.toString()),
                        SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            deleteStudent(snapshot.data![index].id, context)
                          },
                          child: Icon(Icons.delete),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateStudent(
                                    student: snapshot.data![index]),
                              ),
                            )
                          },
                          child: Icon(Icons.settings),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
      },
    ));
  }
}
