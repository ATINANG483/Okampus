import 'package:flutter/material.dart';

class DetailBarbillard extends StatelessWidget {
  final String titre;
  final String type;
  final String date;
  final String imagePath;

  const DetailBarbillard({
    Key? key,
    required this.titre,
    required this.type,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "$type - $date",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
