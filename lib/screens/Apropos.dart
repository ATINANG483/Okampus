import 'package:flutter/material.dart';

class AproposScreen extends StatelessWidget {
  const AproposScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'OKAMPUS est une application dédiée aux étudiants pour gérer leurs cours, notifications, profils, et bien plus.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
