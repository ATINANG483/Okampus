import 'package:flutter/material.dart';
import 'PdfViewerScreen.dart';

class UnitesScreen extends StatefulWidget {
  const UnitesScreen({Key? key}) : super(key: key);

  @override
  State<UnitesScreen> createState() => _UnitesScreenState();
}

class _UnitesScreenState extends State<UnitesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<Map<String, String>>> semestre1 = {
    "Cours": List.generate(10, (i) => {
          "titre": "Cours ${i + 1}",
          "url": "https://exemple.com/cours${i + 1}.pdf"
        }),
    "TD": [
      {"titre": "TD 1", "url": "https://exemple.com/td1.pdf"},
    ],
    "CC": [
      {"titre": "CC 1", "url": "https://exemple.com/cc1.pdf"},
    ],
    "Examen": [
      {"titre": "Examen 1", "url": "https://exemple.com/examen1.pdf"},
    ],
    "Rattrapage": [
      {"titre": "Rattrapage 1", "url": "https://exemple.com/rattrapage1.pdf"},
    ],
  };

  final Map<String, List<Map<String, String>>> semestre2 = {
    "Cours": List.generate(10, (i) => {
          "titre": "Cours S2-${i + 1}",
          "url": "https://exemple.com/sem2_cours${i + 1}.pdf"
        }),
    "TD": [
      {"titre": "TD 1", "url": "https://exemple.com/sem2_td1.pdf"},
    ],
    "CC": [
      {"titre": "CC 1", "url": "https://exemple.com/sem2_cc1.pdf"},
    ],
    "Examen": [
      {"titre": "Examen S2-1", "url": "https://exemple.com/sem2_examen1.pdf"},
    ],
    "Rattrapage": [
      {"titre": "Rattrapage S2-1", "url": "https://exemple.com/sem2_rattrapage1.pdf"},
    ],
  };

  String filtreActif = "Cours";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "ITT3-IR",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.lightBlue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.lightBlue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.lightBlue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.lightBlue),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.purple,
          tabs: const [
            Tab(text: "Semestre 1"),
            Tab(text: "Semestre 2"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSemestreView(semestre1),
          _buildSemestreView(semestre2),
        ],
      ),
    );
  }

  Widget _buildSemestreView(Map<String, List<Map<String, String>>> fichiers) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard("4", "Total Courses", Colors.purple.shade100, Icons.bookmark),
              _buildStatCard("4", "In Progress", Colors.orange.shade100, Icons.play_circle_fill),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard("1", "Completed", Colors.green.shade100, Icons.check_circle),
              _buildStatCard("112h", "Total Hours", Colors.blue.shade100, Icons.access_time),
            ],
          ),
          const SizedBox(height: 24),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var cat in fichiers.keys)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filtreActif = cat;
                      });
                    },
                    child: _buildFilter(cat, filtreActif == cat),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Column(
            children: fichiers[filtreActif]!
                .map((fichier) => _buildPdfRow(fichier["titre"]!, fichier["url"]!))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String label, Color color, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.black54, size: 28),
            const SizedBox(height: 8),
            Text(
              number,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilter(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.purple : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildPdfRow(String titre, String url) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, color: Colors.red, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titre,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          TextButton(
            onPressed: () {
              String assetPath = _mapTitreToAssetPath(titre);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerScreen(
                    assetPath: assetPath,
                    titre: titre,
                  ),
                ),
              );
            },
            child: const Text(
              "Ouvrir",
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  String _mapTitreToAssetPath(String titre) {
    switch (titre) {
      case "Cours 1":
        return 'assets/cours1.pdf';
      case "Cours 2":
        return 'assets/cours2.pdf';
      case "Examen 1":
        return 'assets/examen1.pdf';
      case "Rattrapage 1":
        return 'assets/rattrapage1.pdf';
      default:
        return 'assets/cours1.pdf';
    }
  }
}
