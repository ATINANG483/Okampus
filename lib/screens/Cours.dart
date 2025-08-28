import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      "image": "assets/course1.jpg",
      "title": "Algorithmes avancés en Python",
      "professor": "Pr. Ndongo Pierre",
      "time": "08h00 - 10h00",
    },
    {
      "image": "assets/course2.jpg",
      "title": "Réseaux Informatiques",
      "professor": "Dr. Mvondo Alain",
      "time": "10h15 - 12h15",
    },
    {
      "image": "assets/course3.png",
      "title": "Développement Mobile Flutter",
      "professor": "Mme. Essomba Claire",
      "time": "13h30 - 15h30",
    },
     {
      "image": "assets/course1.jpg",
      "title": "Algorithmes avancés en Python",
      "professor": "Pr. Ndongo Pierre",
      "time": "08h00 - 10h00",
    },
    {
      "image": "assets/course2.jpg",
      "title": "Réseaux Informatiques",
      "professor": "Dr. Mvondo Alain",
      "time": "10h15 - 12h15",
    },
    {
      "image": "assets/course3.png",
      "title": "Développement Mobile Flutter",
      "professor": "Mme. Essomba Claire",
      "time": "13h30 - 15h30",
    },
     {
      "image": "assets/course1.jpg",
      "title": "Algorithmes avancés en Python",
      "professor": "Pr. Ndongo Pierre",
      "time": "08h00 - 10h00",
    },
    {
      "image": "assets/course2.jpg",
      "title": "Réseaux Informatiques",
      "professor": "Dr. Mvondo Alain",
      "time": "10h15 - 12h15",
    },
    {
      "image": "assets/course3.png",
      "title": "Développement Mobile Flutter",
      "professor": "Mme. Essomba Claire",
      "time": "13h30 - 15h30",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Cours",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
          actions: [
    IconButton(
      icon: const Icon(Icons.search, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/recherche'); // redirige vers recherche
      },
    ),
    IconButton(
      icon: const Icon(Icons.notifications_none, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/notifications');
      },
    ),
    IconButton(
      icon: const Icon(Icons.smart_toy_outlined, color: Colors.lightBlue), // chatbot au lieu du "?"
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

      // Liste des cours
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.05), // Bleu très clair
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image du cours
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    course["image"],
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),

                // Infos du cours
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nom du cours
                        Text(
                          course["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Professeur
                        Row(
                          children: [
                            const Icon(Icons.person, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              course["professor"],
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        // Horaire
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              course["time"],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        // Étoiles + Ouvrir
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(4, (i) {
                                return const Icon(Icons.star, size: 14, color: Colors.amber);
                              }),
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Ouverture du cours : ${course['title']}")),
                                );
                              },
                              child: const Text(
                                "Ouvrir",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
