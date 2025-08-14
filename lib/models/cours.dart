class Cours {
  final int id;
  final String title;
  final String prof;
  final int cc;
  final int td;
  final int tp;
  final int exam;

  Cours({required this.id, required this.title, required this.prof, required this.cc, required this.td, required this.tp, required this.exam});

  factory Cours.fromJson(Map<String, dynamic> json) {
    return Cours(
      id: json['id'],
      title: json['title'],
      prof: json['prof'],
      cc: json['cc'],
      td: json['td'],
      tp: json['tp'],
      exam: json['exam'],
    );
  }
}
