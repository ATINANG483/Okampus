import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Pour le presse-papier
import 'package:share_plus/share_plus.dart'; // Pour le partage

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  void _partagerApp(BuildContext context) {
    const String lienApp = 'https://okampus.page.link/install';

    Clipboard.setData(const ClipboardData(text: lienApp));

    Share.share(
      'Viens découvrir OKAMPUS ! Voici le lien pour installer l\'application : $lienApp',
      subject: 'Découvre OKAMPUS 🚀',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Lien copié dans le presse-papier')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Mon profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.orange),
            onPressed: () {
              Navigator.pushNamed(context, '/recherche');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.orange),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.orange),
            onPressed: () {
              Navigator.pushNamed(context, '/assistance');
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Ligne profil avec nom à gauche et image QR à droite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ATINANG MOISE',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/qr.jpg'), // ← image QR
                ),
              ],
            ),

            const SizedBox(height: 32),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Actions principales',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildListTile(Icons.favorite_border, 'Mes favoris', () {}),
                    const SizedBox(height: 8),
                    buildListTile(Icons.shopping_bag_outlined, 'Mes cours', () {}),
                    const SizedBox(height: 8),
                    buildListTile(Icons.info_outline, 'Mes informations', () {}),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Autres actions',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    buildListTile(Icons.settings, 'Paramètres', () {
                      Navigator.pushNamed(context, '/parametres');
                    }),
                    const SizedBox(height: 8),
                    buildListTile(Icons.star_border, 'Noter l\'application', () {}),
                    const SizedBox(height: 8),
                    buildListTile(Icons.help, 'Assistance', () {
                      Navigator.pushNamed(context, '/assistance');
                    }),
                    const SizedBox(height: 8),
                    buildListTile(Icons.share_outlined, 'Partager l\'application', () {
                      _partagerApp(context);
                    }),
                  ],
                ),
              ),
            ),

            // Bouton Déconnexion visible en bas
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO : action de déconnexion
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  side: const BorderSide(color: Colors.black),
                ),
                icon: const Icon(Icons.logout, color: Colors.black),
                label: const Text(
                  'Déconnexion',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
