import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Notifications.dart';
import 'Profil.dart';

class ParrainageScreen extends StatelessWidget {
  const ParrainageScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> classes = const [
    {'name': 'ITT1A', 'icon': FontAwesomeIcons.whatsapp, 'url': 'https://wa.me/237690000001'},
    {'name': 'ITT1B', 'icon': FontAwesomeIcons.whatsapp, 'url': 'https://wa.me/237690000002'},
    {'name': 'ITT2A', 'icon': FontAwesomeIcons.whatsapp, 'url': 'https://wa.me/237690000003'},
    {'name': 'ITT2B', 'icon': FontAwesomeIcons.whatsapp, 'url': 'https://wa.me/237690000004'},
    {'name': 'ITT3', 'icon': FontAwesomeIcons.whatsapp, 'url': 'https://wa.me/237690000005'},
    {'name': 'MASTER', 'icon': FontAwesomeIcons.whatsapp, 'url': 'https://wa.me/237690000006'},
  ];

  final List<Map<String, dynamic>> plateformes = const [
    {'name': 'Facebook', 'icon': FontAwesomeIcons.facebook, 'color': Colors.blue, 'url': 'https://facebook.com'},
    {'name': 'LinkedIn', 'icon': FontAwesomeIcons.linkedin, 'color': Colors.blueAccent, 'url': 'https://linkedin.com'},
    {'name': 'X', 'icon': FontAwesomeIcons.xTwitter, 'color': Colors.black, 'url': 'https://x.com'},
    {'name': 'Instagram', 'icon': FontAwesomeIcons.instagram, 'color': Colors.purple, 'url': 'https://instagram.com'},
  ];

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Impossible d'ouvrir le lien : $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Parrainage',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.lightBlue),
            onPressed: () {
              // Exemple : aller vers une page de recherche
              Navigator.pushNamed(context, '/recherche');
            },
          ),
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_none, color: Colors.lightBlue),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '18',
                      style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.lightBlue),
            onPressed: () {
              Navigator.pushNamed(context, '/parametres');
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.lightBlue, size: 26),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Parraine ta promo, partage la vibe OKAMPUS !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: classes.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final classe = classes[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          _openUrl(classe['url']); // Ouvre WhatsApp avec le lien
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade50,
                          ),
                          child: FaIcon(classe['icon'], color: Colors.green, size: 28),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(classe['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              title: 'FAQ rapide',
              children: const [
                _FaqRow(
                  question: 'Comment parrainer ?',
                  answer: 'Clique sur une classe ci-dessus pour partager le lien via WhatsApp.',
                ),
                _FaqRow(
                  question: 'Quels sont les avantages ?',
                  answer: 'Tu gagnes des bonus : badges, Premium, et accès à des événements.',
                ),
                _FaqRow(
                  question: 'Puis-je suivre mes filleuls ?',
                  answer: 'Oui, tu peux suivre l\'activité de tes filleuls depuis ton espace personnel.',
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              title: "Plateformes de SUP'PTIC",
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: plateformes.map((p) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _openUrl(p['url']); // Ouvre la plateforme
                          },
                          child: CircleAvatar(
                            backgroundColor: p['color'].withOpacity(0.1),
                            radius: 28,
                            child: FaIcon(p['icon'], color: p['color'], size: 28),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(p['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.lightBlue)),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _FaqRow extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqRow({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 4),
          Text(answer, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ],
      ),
    );
  }
}
