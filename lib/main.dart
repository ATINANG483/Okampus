import 'package:flutter/material.dart';

import 'screens/Cours.dart';
import 'screens/splash.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/dashboard.dart';
import 'screens/actus.dart';
import 'screens/apropos.dart';
import 'screens/erreur.dart';
import 'screens/favoris.dart';
import 'screens/notifications.dart';
import 'screens/parametres.dart';
import 'screens/profil.dart';
import 'screens/recherche.dart';
import 'screens/unites.dart';
import 'screens/Chat.dart';
import 'screens/Assistance.dart';
import 'screens/Parrainage.dart';

void main() {
  runApp(const OKampusApp());
}

class OKampusApp extends StatelessWidget {
  const OKampusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OKAMPUS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/signup',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/actus': (context) => const ActusScreen(),
        '/apropos': (context) => const AproposScreen(),
        '/cours': (context) => CoursesScreen(),
        '/erreur': (context) => const ErreurScreen(),
        '/favoris': (context) => const FavorisScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/parametres': (context) => const ParametresScreen(),
        '/profil': (context) => const ProfilScreen(),
        '/recherche': (context) => const RechercheScreen(),
        '/unites': (context) => const UnitesScreen(),
        '/chat': (context) => ChatScreen(),
        '/assistance': (context) => const AssistanceScreen(),
        '/parrainage': (context) => const ParrainageScreen(),
      },
    );
  }
}
