import 'package:flutter/material.dart';
import 'Profil.dart';
import 'Notifications.dart';
import 'Recherche.dart';
import 'UnitesScreen.dart';
import 'Chambre.dart';
import 'voir_plus_barbillard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RechercheScreen()),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                  );
                },
              ),
              Positioned(
                right: 10,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                  child: const Text('19', style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/assistance');
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenue sur OKampus',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/qr.jpg',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.account_balance_wallet, color: Colors.orange, size: 18),
                            SizedBox(width: 6),
                            Text('ITT3-IR CLASSIQUE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.remove_red_eye, color: Colors.black),
                            SizedBox(width: 6),
                            Text('ATINANG MOISE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('Mes notes', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(color: const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: const [
                  Text('Contactez...', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('Support', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
                  Icon(Icons.chevron_right, color: Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
                _ActionButton(icon: Icons.send, label: 'WhatsApp', fontSize: 10),
              ],
            ),
            const SizedBox(height: 24),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text('Unités d’enseignement', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UnitesScreen()),
        );
      },
      child: const Text('Voir plus', style: TextStyle(color: Colors.blueAccent, fontSize: 13, fontWeight: FontWeight.bold)),
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
                _UECard(title: 'Réseaux', prof: 'Dr. BILE'),
                _UECard(title: 'Développement mobile', prof: 'M. MOUAFO'),
              ],
            ),
            const SizedBox(height: 24),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Chambres à louer',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VoirPlusChambres(),
          ),
        );
      },
      child: const Text(
        'Voir plus',
        style: TextStyle(
          color: Colors.lightBlue,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

            const SizedBox(height: 12),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 0),
                  _RoomCardSimple(title: 'Bonamoussadi', description: 'Studio équipé avec wifi, douche, eau.'),
                  SizedBox(width: 12),
                  _RoomCardSimple(title: 'Makepe', description: 'Chambre étudiante, propre et sécurisée.'),
                  SizedBox(width: 12),
                  _RoomCardSimple(title: 'Logpom', description: 'Chambre calme proche campus.'),
                  SizedBox(width: 12),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Catégorie',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VoirPlusBarbillard()),
        );
      },
      child: const Text(
        'Voir plus',
        style: TextStyle(
          color: Colors.lightBlue,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 0),
                  _CategoryCard(title: 'Barbillard', note: 'Note: 15/20', communique: 'Prochain tournoi vendredi'),
                  SizedBox(width: 12),
                  _CategoryCard(title: 'Boukarou', note: 'Note: 12/20', communique: 'Assemblée générale lundi'),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color(0xFFF0F0F0),
  selectedItemColor: Colors.lightBlue,
  unselectedItemColor: Colors.black,
  type: BottomNavigationBarType.fixed,
  currentIndex: 0,
  onTap: (index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/chat');
    } else if (index == 2) { // Cours
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
)

    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double fontSize;
  const _ActionButton({required this.icon, required this.label, this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.lightBlue, size: 28),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.bold)),
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
      decoration: BoxDecoration(color: const Color(0xFFEFEFEF), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Prof: $prof', style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Cours', style: TextStyle(color: Colors.lightBlue, fontSize: 12, fontWeight: FontWeight.bold)),
              Text('TD', style: TextStyle(color: Colors.lightBlue, fontSize: 12, fontWeight: FontWeight.bold)),
              Text('Examens', style: TextStyle(color: Colors.lightBlue, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoomCardSimple extends StatelessWidget {
  final String title, description;
  const _RoomCardSimple({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFEFEFEF), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Contacter', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title, note, communique;
  const _CategoryCard({required this.title, required this.note, required this.communique});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFEFEFEF), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(note, style: const TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(communique, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
