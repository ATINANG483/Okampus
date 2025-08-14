import 'package:flutter/material.dart';
import 'package:okampus/theme.dart';
import 'package:provider/provider.dart';
import 'ScannerScreen.dart';

class ParametresScreen extends StatefulWidget {
  const ParametresScreen({Key? key}) : super(key: key);

  @override
  State<ParametresScreen> createState() => _ParametresScreenState();
}

class _ParametresScreenState extends State<ParametresScreen> {
  String _selectedLangue = 'Français';
  String _selectedMode = 'Clair';

  void _changerLangue() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Choisir la langue'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSelectableOption(
              label: 'Français',
              selected: _selectedLangue == 'Français',
              onTap: () {
                setState(() => _selectedLangue = 'Français');
                Navigator.pop(context);
              },
            ),
            _buildSelectableOption(
              label: 'Anglais',
              selected: _selectedLangue == 'Anglais',
              onTap: () {
                setState(() => _selectedLangue = 'Anglais');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _changerApparence() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Apparence'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSelectableOption(
              label: 'Mode clair',
              selected: _selectedMode == 'Clair',
              onTap: () {
                setState(() => _selectedMode = 'Clair');
                context.read<ThemeProvider>().setLightMode();
                Navigator.pop(context);
              },
            ),
            _buildSelectableOption(
              label: 'Mode sombre',
              selected: _selectedMode == 'Sombre',
              onTap: () {
                setState(() => _selectedMode = 'Sombre');
                context.read<ThemeProvider>().setDarkMode();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _afficherAPropos() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.95,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'À propos de OKampus',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.lightBlue,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '''📱 Okampus – Votre compagnon numérique universitaire

Okampus est une application mobile intelligente conçue pour améliorer l’expérience académique et administrative des étudiants...
''',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _scannerTickets() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );
  }

  Widget _buildSelectableOption({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? Colors.lightBlue : Colors.black,
        ),
      ),
      trailing: selected
          ? const Icon(Icons.check_circle, color: Colors.lightBlue)
          : null,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Paramètres',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.lightBlue),
            onPressed: () => Navigator.pushNamed(context, '/recherche'),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.lightBlue),
                onPressed: () => Navigator.pushNamed(context, '/notifications'),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '18',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.lightBlue),
            onPressed: () => Navigator.pushNamed(context, '/assistance'),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE6F0FA),
              Colors.white,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          children: [
            _buildParamCard(
              icon: Icons.public,
              title: 'Langue ($_selectedLangue)',
              onTap: _changerLangue,
            ),
            _buildParamCard(
              icon: Icons.brightness_6_outlined,
              title: 'Apparence ($_selectedMode)',
              onTap: _changerApparence,
            ),
            _buildParamCard(
              icon: Icons.info_outline,
              title: 'À propos de OKampus',
              onTap: _afficherAPropos,
            ),
            _buildParamCard(
              icon: Icons.qr_code_scanner,
              title: 'Scanner le code QR',
              onTap: _scannerTickets,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParamCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(icon, color: Colors.lightBlue),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
