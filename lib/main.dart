import 'package:flutter/material.dart';
import 'package:okampus/screens/EditProfil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'theme.dart';

// Import des écrans
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
import 'screens/VerifyCode.dart';
import 'screens/ResetPassword.dart';
import 'screens/debut.dart';


Future<void> main() async {
  // Charger la clé API depuis .env
  await dotenv.load(fileName: "assets/config/.env");

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const OKampusApp(),
    ),
  );
}

// Fonction pour appeler l'API Gemini
Future<String> fetchGeminiResponse(String prompt) async {
  final apiKey = dotenv.env['GEMINI_API_KEY'];
  final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ]
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['candidates']?[0]?['content']?['parts']?[0]?['text'] ??
        "Pas de réponse";
  } else {
    throw Exception('Erreur API: ${response.statusCode} - ${response.body}');
  }
}

class OKampusApp extends StatelessWidget {
  const OKampusApp({super.key});

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
      initialRoute: '/debut',
      routes: {
        '/debut': (context) => const OnboardingScreen(),
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
        '/edit-profile': (context) => const EditProfileScreen(),

        '/chat': (context) => ChatScreen(
              fetchResponse: fetchGeminiResponse,
            ),
        '/assistance': (context) => const AssistanceScreen(),
        '/parrainage': (context) => const ParrainageScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/verify-code': (context) => const VerifyCodeScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
      },
    );
  }
}
