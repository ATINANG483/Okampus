import 'package:flutter/material.dart';

class UnitesScreen extends StatelessWidget {
  const UnitesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unités'),
      ),
      body: const Center(
        child: Text(
          'Liste des unités d\'enseignement.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
