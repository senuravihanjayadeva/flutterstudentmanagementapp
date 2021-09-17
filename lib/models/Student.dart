class Student {
  final String id;
  final String name;
  final int age;

  const Student({
    required this.id,
    required this.name,
    required this.age,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
    );
  }
}
