class Student {
  final String id;
  final String name;
  final String email;

  Student({required this.id, required this.name, required this.email});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );
}
