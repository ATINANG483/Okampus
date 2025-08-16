import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                title: "Bienvenue sur Okampus",
                subtitle:
                    "Tout ce qu’il te faut pour réussir ton année universitaire.",
                imagePath: "assets/2b.jpg",
                features: [
                  "Consulte tes notes facilement",
                  "Accède à tes cours partout",
                  "Télécharge les documents pour réviser",
                  "Reste informé des annonces importantes"
                ],
              ),
              buildPage(
                title: "Organise ton temps",
                subtitle:
                    "Visualise ton emploi du temps pour mieux planifier tes journées.",
                imagePath: "assets/3b.jpg",
                features: [
                  "Consulte ton emploi du temps à tout moment",
                  "Sois prêt pour chaque cours",
                  "Évite les oublis et retards"
                ],
              ),
              buildPage(
                title: "Suis tes progrès",
                subtitle:
                    "Analyse tes résultats et prépare-toi pour les examens.",
                imagePath: "assets/4b.jpg",
                features: [
                  "Suis tes notes et moyennes",
                  "Identifie tes points forts et faibles",
                  "Progresse efficacement"
                ],
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.pushReplacementNamed(context, '/login');
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? "Commencer" : "Suivant",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPage({
    required String title,
    required String subtitle,
    required String imagePath,
    required List<String> features,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 250),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...features.map(
            (f) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle,
                      color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Expanded(child: Text(f)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
