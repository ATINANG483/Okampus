import 'package:flutter/material.dart';


class ActusScreen extends StatelessWidget {
  const ActusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualités'),
      ),
      body: const Center(
        child: Text(
          'Bienvenue dans la section des actualités.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
