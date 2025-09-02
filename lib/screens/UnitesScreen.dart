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
  String filtreActif = "Cours";

  final Map<String, List<Map<String, String>>> semestre1 = {
    "Cours": List.generate(6, (i) => {
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
    "Cours": List.generate(5, (i) => {
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
          "ITT3 - IR",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black87),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.black87),
              onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.lightBlue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.lightBlue,
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- Bannière
            Container(
              height: 130,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Explore your lessons",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                        SizedBox(height: 8),
                        Text("Access courses, TD, exams and more",
                            style: TextStyle(
                                fontSize: 13, color: Colors.black54)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.menu_book,
                        size: 50, color: Colors.lightBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ---- Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: "Search any document",
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),

            // ---- Catégories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Explore by categories",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text("See All",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: fichiers.keys
                    .map((cat) => GestureDetector(
                          onTap: () {
                            setState(() {
                              filtreActif = cat;
                            });
                          },
                          child: _buildCategoryCard(
                              cat, filtreActif == cat ? Colors.lightBlue : Colors.grey.shade200,
                              selected: filtreActif == cat),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),

            // ---- Liste horizontale des fichiers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$filtreActif available",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                const Text("See All",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: fichiers[filtreActif]!
                    .map((fichier) =>
                        _buildPdfCard(fichier["titre"]!, fichier["url"]!))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildCategoryCard(String title, Color color,
      {bool selected = false}) {
    IconData icon;
    switch (title) {
      case "Cours":
        icon = Icons.menu_book;
        break;
      case "TD":
        icon = Icons.edit_note;
        break;
      case "CC":
        icon = Icons.assignment;
        break;
      case "Examen":
        icon = Icons.fact_check;
        break;
      case "Rattrapage":
        icon = Icons.refresh;
        break;
      default:
        icon = Icons.folder;
    }

    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: selected ? Colors.white : Colors.black54),
          const SizedBox(width: 8),
          Text(title,
              style: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildPdfCard(String titre, String url) {
    return GestureDetector(
      onTap: () {
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
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: const Center(
                  child: Icon(Icons.picture_as_pdf,
                      size: 45, color: Colors.redAccent)),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                titre,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ),
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
