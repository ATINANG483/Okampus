import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🔹 Import du fichier d’édition de profil
import 'EditProfil.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.lightBlue),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
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
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Ferme la boîte de dialogue
              // Redirection vers la page login
              Navigator.pushReplacementNamed(context, '/login');
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
        leading: const BackButton(color: Colors.black),
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
            icon: const Icon(Icons.smart_toy_outlined, color: Colors.lightBlue), // icône chatbot
            onPressed: () {
              Navigator.pushNamed(context, '/chat'); // lien vers ton chatbot
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'ATINANG MOISE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage('assets/qr.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(FontAwesomeIcons.linkedin, color: Color(0xFF0A66C2), size: 20),
                const SizedBox(width: 12),
                const Icon(FontAwesomeIcons.github, color: Colors.black, size: 20),
                const SizedBox(width: 12),
                const Icon(FontAwesomeIcons.xTwitter, color: Colors.black, size: 20),
                const SizedBox(width: 12),
                const Icon(FontAwesomeIcons.facebook, color: Color(0xFF1877F2), size: 20),
                const SizedBox(width: 12),
                const Icon(FontAwesomeIcons.whatsapp, color: Color(0xFF25D366), size: 20),
                const SizedBox(width: 12),
                const Icon(FontAwesomeIcons.instagram, color: Color(0xFFE4405F), size: 20),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfileScreen()), // ✅ Correction ici
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.edit, color: Colors.lightBlue, size: 18),
                      SizedBox(width: 3),
                      Text(
                        "Modifier le profil",
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(), // empêche le scroll
                children: [
                  buildListTile(Icons.menu_book, 'Mes cours', () {
                    Navigator.pushNamed(context, '/cours');
                  }),
                  const SizedBox(height: 6),
                  buildListTile(Icons.info_outline, 'Mes informations', () {}),
                  const SizedBox(height: 6),
                  buildListTile(Icons.settings, 'Paramètres', () {
                    Navigator.pushNamed(context, '/parametres');
                  }),
                  const SizedBox(height: 6),
                  buildListTile(Icons.lock_outline, 'Changer le mot de passe', () {
                    Navigator.pushNamed(context, '/change-password');
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
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}
