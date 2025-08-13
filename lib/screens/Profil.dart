import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Pour le presse-papier
import 'package:share_plus/share_plus.dart'; // Pour le partage

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.lightBlue),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14), // taille réduite
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.lightBlue),
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

  void _confirmerDeconnexion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Vous êtes sur le point de quitter l\'application.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // annuler
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO : ajouter ici la logique de déconnexion réelle
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Déconnecté')),
              );
            },
            child: const Text('Oui'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Mon profil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.lightBlue),
            onPressed: () {
              Navigator.pushNamed(context, '/recherche');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.lightBlue),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.lightBlue),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'ATINANG MOISE',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/qr.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Actions principales',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildListTile(Icons.favorite_border, 'Mes favoris', () {}),
                    const SizedBox(height: 6),
                    buildListTile(Icons.shopping_bag_outlined, 'Mes cours', () {}),
                    const SizedBox(height: 6),
                    buildListTile(Icons.info_outline, 'Mes informations', () {}),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Autres actions',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    buildListTile(Icons.settings, 'Paramètres', () {
                      Navigator.pushNamed(context, '/parametres');
                    }),
                    const SizedBox(height: 6),
                    buildListTile(Icons.lock_outline, 'Changer le mot de passe', () {
                      Navigator.pushNamed(context, '/changer-mot-de-passe');
                    }),
                    const SizedBox(height: 6),
                    buildListTile(Icons.star_border, 'Noter l\'application', () {}),
                    const SizedBox(height: 6),
                    buildListTile(Icons.help, 'Assistance', () {
                      Navigator.pushNamed(context, '/assistance');
                    }),
                    const SizedBox(height: 6),
                    buildListTile(Icons.share_outlined, 'Partager l\'application', () {
                      _partagerApp(context);
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: OutlinedButton.icon(
                onPressed: () => _confirmerDeconnexion(context),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
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
