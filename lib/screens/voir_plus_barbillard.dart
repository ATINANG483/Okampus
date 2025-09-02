import 'package:flutter/material.dart';
class VoirPlusBarbillard extends StatelessWidget {
  final List<Map<String, String>> annonces = [
    {
      "titre": "Réunion de rentrée académique",
      "type": "Communiqué",
      "date": "01 Juil. 2025",
      "image": "assets/reunion.jpg"
    },
     {
      "titre": "Réunion de rentrée académique",
      "type": "Communiqué",
      "date": "01 Juil. 2025",
      "image": "assets/reunion.jpg"
    },
    {
      "titre": "Résultats CC2 TIC102",
      "type": "Note de CC",
      "date": "28 Juin 2025",
      "image": "assets/resultat.jpg"
    },
     {
      "titre": "Réunion de rentrée académique",
      "type": "Communiqué",
      "date": "01 Juil. 2025",
      "image": "assets/reunion.jpg"
    },
    {
      "titre": "Réunion de rentrée académique",
      "type": "Communiqué",
      "date": "01 Juil. 2025",
      "image": "assets/reunion.jpg"
    },
  ];

  
  IconData _getIconForType(String type) {
    switch (type) {
      case "Communiqué":
        return Icons.campaign;
      case "Note de CC":
        return Icons.assignment_turned_in;
      default:
        return Icons.info;
    }
  }

  void _afficherImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (_) => Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.black.withOpacity(0.9),
              alignment: Alignment.center,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color orangeColor = Color.fromARGB(255, 11, 34, 241);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Barbillard",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
    IconButton(
      icon: const Icon(Icons.search, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/recherche');
      },
    ),
    IconButton(
      icon: const Icon(Icons.smart_toy_outlined, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/chat');
      },
    ),
    IconButton(
      icon: const Icon(Icons.account_circle, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/profil');
      },
    ),
  ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: annonces.length,
        itemBuilder: (context, index) {
          final annonce = annonces[index];
          return GestureDetector(
            onTap: () {
             
            },
            child: Card(
              elevation: 5,
              shadowColor: const Color.fromARGB(255, 19, 214, 110).withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  GestureDetector(
                    onTap: () => _afficherImage(context, annonce["image"]!),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        annonce["image"]!,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Infos
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          children: [
                            Icon(
                              _getIconForType(annonce["type"]!),
                              color: orangeColor,
                              size: 20,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              annonce["type"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              annonce["date"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Titre
                        Text(
                          annonce["titre"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: orangeColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}