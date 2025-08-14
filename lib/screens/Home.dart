import 'package:flutter/material.dart';
import 'Profil.dart';
import 'Notifications.dart';
import 'Recherche.dart';
import 'UnitesScreen.dart';
import 'Chambre.dart';
import 'voir_plus_barbillard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.lightBlue),
        title: Image.asset('assets/logo.png', height: 32),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RechercheScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/assistance');
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const NotificationsScreen()));
                },
              ),
              Positioned(
                right: 10,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: const Text('8',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfilScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.person, size: 32, color: Colors.lightBlue),
            ),
          ),
        ],
      ),

      // Corps
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bienvenue ÔKAMPUS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // QR & Infos
              Row(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2))
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: ClipOval(
                      child: Image.asset('assets/qr.jpg',
                          height: 90, width: 90, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.school,
                                  color: Colors.lightBlue, size: 18),
                              SizedBox(width: 6),
                              Text('ITT3-IR CLASSIQUE',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.person, color: Colors.lightBlue),
                              SizedBox(width: 6),
                              Text('ATINANG MOISE',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text('22T007',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Section Emploi / Barbillard / Boukarou
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.work, color: Colors.orange),
                        SizedBox(width: 6),
                        Text('Emploi temps',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => VoirPlusBarbillard()),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.sports_esports, color: Colors.lightBlue),
                          SizedBox(width: 6),
                          Text('Barbillard',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.house, color: Colors.green),
                        SizedBox(width: 6),
                        Text('Boukarou',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Raccourcis
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const [
                  _ActionButton(icon: Icons.person, label: 'Admin', fontSize: 10),
                  _ActionButton(icon: Icons.person, label: 'Délégué', fontSize: 10),
                  _ActionButton(icon: Icons.public, label: 'Site-École', fontSize: 10),
                  _ActionButton(icon: FontAwesomeIcons.whatsapp, label: 'Groupe', fontSize: 10),

                ],
              ),
              const SizedBox(height: 24),

              // Unités d’enseignement
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Unités d’enseignement',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const UnitesScreen()));
                    },
                    child: const Text('Voir plus',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  _UECard(title: 'Algorithmique', prof: 'M. NANA'),
                  _UECard(title: 'Maths discrètes', prof: 'Mme TALLA'),
                ],
              ),
              const SizedBox(height: 16),

              // Chambres à louer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Chambres à louer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const VoirPlusChambres()));
                    },
                    child: const Text('Voir plus',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _RoomCardSimple(
                      title: 'Bonamoussadi',
                      description: 'Chambre meublée avec balcon et wifi.',
                      prix: '120 000 FCFA/mois',
                      imagePath: 'assets/chambre1.jpg',
                      rating: 5,
                    ),
                    SizedBox(width: 12),
                    _RoomCardSimple(
                      title: 'Ecole des postes ',
                      description: 'Appartement lumineux proche des commerces.',
                      prix: '100 000 FCFA/mois',
                      imagePath: 'assets/chambre2.jpg',
                      rating: 4,
                    ),
                    SizedBox(width: 12),
                    _RoomCardSimple(
                      title: 'Cradat, Yaounde',
                      description: 'Studio confortable avec kitchenette.',
                      prix: '80 000 FCFA/mois',
                      imagePath: 'assets/chambre3.jpg',
                      rating: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF0F0F0),
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/cours');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/parametres');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'Chatbot'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Cours'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }
}

// ------------------- Widgets -------------------

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double fontSize;
  const _ActionButton(
      {required this.icon, required this.label, this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.lightBlue, size: 28),
          const SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _UECard extends StatelessWidget {
  final String title, prof;
  const _UECard({required this.title, required this.prof});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Prof: $prof',
              style: const TextStyle(
                  color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Cours',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Text('TD',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Text('Examens',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoomCardSimple extends StatelessWidget {
  final String title;
  final String description;
  final String prix;
  final String imagePath;
  final int rating;

  const _RoomCardSimple({
    required this.title,
    required this.description,
    required this.prix,
    required this.imagePath,
    this.rating = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 210,
      decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(imagePath, height: 80, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(description,
                    style: const TextStyle(color: Colors.black54, fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),

                // Etoiles
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 14,
                    );
                  }),
                ),
                const SizedBox(height: 6),

                // Boutons Contacter et Localiser
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // action Contacter
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue, borderRadius: BorderRadius.circular(8)),
                        child: const Text('Contacter',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // action Localiser
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.green, borderRadius: BorderRadius.circular(8)),
                        child: const Text('Localiser',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
