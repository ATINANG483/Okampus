import 'package:flutter/material.dart';

class RechercheScreen extends StatefulWidget {
  const RechercheScreen({Key? key}) : super(key: key);

  @override
  State<RechercheScreen> createState() => _RechercheScreenState();
}

class _RechercheScreenState extends State<RechercheScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                  hintText: 'Recherche',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                FocusScope.of(context).unfocus(); // Ferme le clavier
              },
            ),
          ],
        ),
      ),
      body: const SizedBox(), // Corps vide comme sur l'image
    );
  }
}
