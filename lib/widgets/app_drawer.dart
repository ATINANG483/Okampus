import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'OKAMPUS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(context, 'Accueil', '/home', Icons.home),
          _buildDrawerItem(context, 'Dashboard', '/dashboard', Icons.dashboard),
          _buildDrawerItem(context, 'Actualités', '/actus', Icons.newspaper),
          _buildDrawerItem(context, 'Cours', '/cours', Icons.book),
          _buildDrawerItem(context, 'Unités', '/unites', Icons.grid_view),
          _buildDrawerItem(context, 'Recherche', '/recherche', Icons.search),
          _buildDrawerItem(context, 'Favoris', '/favoris', Icons.favorite),
          _buildDrawerItem(context, 'Notifications', '/notifications', Icons.notifications),
          _buildDrawerItem(context, 'Profil', '/profil', Icons.person),
          _buildDrawerItem(context, 'Paramètres', '/parametres', Icons.settings),
          _buildDrawerItem(context, 'À propos', '/apropos', Icons.info),
          const Divider(),
          _buildDrawerItem(context, 'Se déconnecter', '/login', Icons.logout),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String route, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}
