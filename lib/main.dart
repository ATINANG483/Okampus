import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

import 'screens/Cours.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/dashboard.dart';
import 'screens/erreur.dart';
import 'screens/favoris.dart';
import 'screens/notifications.dart';
import 'screens/parametres.dart';
import 'screens/profil.dart';
import 'screens/recherche.dart';
import 'screens/Chat.dart';
import 'screens/Assistance.dart';
import 'screens/Parrainage.dart';
import 'screens/change_password.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const OKampusApp(),
    ),
  );
}

class OKampusApp extends StatelessWidget {
  const OKampusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'OKAMPUS',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/signup',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/cours': (context) => CoursesScreen(),
        '/erreur': (context) => const ErreurScreen(),
        '/favoris': (context) => const FavorisScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/parametres': (context) => const ParametresScreen(),
        '/profil': (context) => const ProfilScreen(),
        '/recherche': (context) => const RechercheScreen(),
        '/chat': (context) => ChatScreen(),
        '/assistance': (context) => const AssistanceScreen(),
        '/parrainage': (context) => const ParrainageScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),

      },
    );
  }
}
