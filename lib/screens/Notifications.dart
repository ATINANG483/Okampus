import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> notifications = [
    {
      'title': 'Note d\'examen disponible 📘',
      'date': '04-08-2025',
      'description': 'Vos notes pour l\'UE "Intelligence Artificielle" sont disponibles.',
      'fullMessage': 'Bonjour, vos notes d\'examen pour l\'UE "Intelligence Artificielle" ont été publiées. '
          'Connectez-vous à votre espace étudiant pour consulter le relevé détaillé.'
    },
    {
      'title': 'Communiqué 📢',
      'date': '02-08-2025',
      'description': 'Le Directeur informe tous les étudiants que...',
      'fullMessage': 'Le Directeur informe tous les étudiants que les activités pédagogiques reprendront le 05 août à 08h00. '
          'Présence obligatoire pour tous.'
    },
    {
      'title': 'Offre de stage disponible 🎓',
      'date': '01-08-2025',
      'description': 'Une nouvelle offre de stage est disponible dans le domaine IoT.',
      'fullMessage': 'Stage proposé par l\'entreprise AIOTE AFRIKA pour les étudiants en fin de cycle. '
          'Durée : 3 mois. Début : 15 août. Plus d\'infos dans votre espace étudiant.'
    },
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _showNotificationDetail(BuildContext context, Map<String, String> notif) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.45,
          minChildSize: 0.35,
          maxChildSize: 0.9,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
            child: ListView(
              controller: controller,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  notif['title'] ?? '',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  notif['date'] ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Text(
                  notif['fullMessage'] ?? notif['description'] ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Page de consultation...")),
                        );
                      },
                      icon: const Icon(Icons.visibility),
                      label: const Text('Consulter'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Notification marquée comme lue.")),
                        );
                      },
                      icon: const Icon(Icons.done),
                      label: const Text('Marquer comme lu'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationsTab() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notif = notifications[index];
        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.notifications_active_outlined, color: Colors.orange),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  notif['title'] ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Text(
                notif['date'] ?? '',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                notif['description'] ?? '',
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () => _showNotificationDetail(context, notif),
                child: const Text(
                  "Lire la suite",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(height: 1),
            ],
          ),
          isThreeLine: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'Notifications'),
            Tab(text: 'Transaction en attente'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationsTab(),
          const Center(child: Text("Aucune transaction en attente")),
        ],
      ),
    );
  }
}
