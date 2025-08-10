import 'package:flutter/material.dart';

class ErreurScreen extends StatelessWidget {
  const ErreurScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Erreur'),
      ),
      body: const Center(
        child: Text(
          'Une erreur s\'est produite.',
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
    );
  }
}
