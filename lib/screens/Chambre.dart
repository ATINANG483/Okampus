import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:url_launcher/url_launcher.dart';

class VoirPlusChambres extends StatefulWidget {
  const VoirPlusChambres({super.key});

  @override
  State<VoirPlusChambres> createState() => _VoirPlusChambresState();
}

class _VoirPlusChambresState extends State<VoirPlusChambres> {
  final Map<int, int> _currentImageIndex = {};

  Future<void> _ouvrirLocalisation(double lat, double lng) async {
    final Uri googleMapsUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$lat,$lng");
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      throw "Impossible d'ouvrir Google Maps";
    }
  }

  Future<void> _appelerNumero(String numero) async {
    final Uri telUrl = Uri.parse("tel:$numero");
    if (await canLaunchUrl(telUrl)) {
      await launchUrl(telUrl);
    } else {
      throw "Impossible d'appeler $numero";
    }
  }

  void _afficherImagePleinEcran(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white54,
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStars() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return const Icon(Icons.star, color: Colors.amber, size: 16);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chambres",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.lightBlueAccent), // Bleu ciel
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.lightBlueAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.lightBlueAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.lightBlueAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: chambres.length,
        itemBuilder: (context, index) {
          final chambre = chambres[index];
          final images = chambre['images'] as List<String>;
          final description = chambre['description'] as String;
          final lat = chambre['lat'] as double;
          final lng = chambre['lng'] as double;

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    cs.CarouselSlider(
                      options: cs.CarouselOptions(
                        height: 180,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (i, reason) {
                          setState(() {
                            _currentImageIndex[index] = i;
                          });
                        },
                      ),
                      items: images.map<Widget>((imgPath) {
                        return GestureDetector(
                          onTap: () => _afficherImagePleinEcran(imgPath),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.asset(
                              imgPath,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          bool isActive =
                              _currentImageIndex[index] == entry.key;
                          return Container(
                            width: isActive ? 8 : 6,
                            height: isActive ? 8 : 6,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive ? Colors.white : Colors.white54,
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),

                // Infos chambre
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${chambre['lieu']} • ${chambre['type']}",
                            style: const TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          _buildStars(),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${chambre['prix']} FCFA/mois",
                        style: const TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.phone,
                                  color: Colors.lightBlueAccent),
                              label: const Text(
                                "Contacter",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlueAccent),
                              ),
                              onPressed: () {
                                _appelerNumero("+237688080882");
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.location_on,
                                  color: Colors.lightBlueAccent),
                              label: const Text(
                                "Position",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlueAccent),
                              ),
                              onPressed: () {
                                _ouvrirLocalisation(lat, lng);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

final chambres = [
  {
    "lieu": "Nkolbisson",
    "type": "Moderne",
    "prix": "50000",
    "description": "Chambre moderne avec douche interne. Proche de SUP’PTIC.",
    "images": ["assets/chambre1.jpg", "assets/chambre2.jpg"],
    "lat": 3.8667,
    "lng": 11.5167
  },
  {
    "lieu": "Nkolbisson",
    "type": "Moderne",
    "prix": "50000",
    "description": "Chambre moderne avec douche interne. Proche de SUP’PTIC.",
    "images": ["assets/chambre1.jpg", "assets/chambre2.jpg"],
    "lat": 3.8667,
    "lng": 11.5167
  },
  {
    "lieu": "Nkolbisson",
    "type": "Moderne",
    "prix": "50000",
    "description": "Chambre moderne avec douche interne. Proche de SUP’PTIC.",
    "images": ["assets/chambre1.jpg", "assets/chambre2.jpg"],
    "lat": 3.8667,
    "lng": 11.5167
  },
  {
    "lieu": "Ngoa-Ekelle",
    "type": "Simple",
    "prix": "16000",
    "description": "Chambre simple avec toilette partagée. Quartier calme.",
    "images": ["assets/chambre3.jpg", "assets/chambre4.jpg"],
    "lat": 3.8480,
    "lng": 11.5021
  },
  {
    "lieu": "Ngoa-Ekelle",
    "type": "Simple",
    "prix": "16000",
    "description": "Chambre simple avec toilette partagée. Quartier calme.",
    "images": ["assets/chambre3.jpg", "assets/chambre4.jpg"],
    "lat": 3.8480,
    "lng": 11.5021
  }
];
