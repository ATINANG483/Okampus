import 'package:flutter/material.dart';

class AssistanceScreen extends StatelessWidget {
  const AssistanceScreen({Key? key}) : super(key: key);

  Widget buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailingIcon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          leading: Icon(icon, color: Colors.lightBlue, size: 30),
          title: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              // Une petite étoile ou fleur pour égayer
              const Text('⭐️', style: TextStyle(fontSize: 18)),
              // Ou utiliser un Icon fleur personnalisée (exemple)
              // Icon(Icons.local_florist, color: Colors.lightBlue, size: 20),
            ],
          ),
          trailing: trailingIcon ??
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.lightBlue,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F7FF), // bleu ciel clair doux
      appBar: AppBar(
        title: const Text('Assistance'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.lightBlue),
            onPressed: () {
              // TODO: action recherche
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.lightBlue),
            onPressed: () {
              Navigator.pushNamed(context, '/parametres');
            },
          ),
          IconButton(
            icon: const Icon(Icons.home, color: Colors.lightBlue),
            onPressed: () {
              Navigator.pushNamed(context, '/accueil');
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
      body: ListView(
        padding: const EdgeInsets.only(top: 20, bottom: 24),
        children: [
          buildOption(
            icon: Icons.group_add_outlined,
            title: 'Parrainez un ami',
            onTap: () {
              Navigator.pushNamed(context, '/parrainage');
            },
          ),
          buildOption(
            icon: Icons.headset_mic_outlined,
            title: 'Service client',
            onTap: () {
              // TODO: action service client
            },
          ),
          buildOption(
            icon: Icons.store_mall_directory_outlined,
            title: 'Où nous trouver ?',
            onTap: () {
              // TODO: action localisation
            },
          ),
          // Exemple d'option supplémentaire avec icône fleur différente
          buildOption(
            icon: Icons.help_outline,
            title: 'FAQ & Aide',
            trailingIcon: const Icon(Icons.local_florist, color: Colors.lightBlue, size: 22),
            onTap: () {
              // TODO: action FAQ
            },
          ),
        ],
      ),
    );
  }
}
