import 'package:flutter/material.dart';

class AssistanceScreen extends StatelessWidget {
  const AssistanceScreen({Key? key}) : super(key: key);

  Widget buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFD), // Blanc doux
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Fond gris clair
      appBar: AppBar(
        title: const Text('Assistance'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
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
            onTap: () {},
          ),
          buildOption(
            icon: Icons.store_mall_directory_outlined,
            title: 'Où nous trouver ?',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
