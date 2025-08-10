import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static const Color orangeColor = Colors.orange;

  // Pour gérer l'état visible/masqué du mot de passe
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.flash_on, color: orangeColor),
                  SizedBox(width: 6),
                  Text(
                    'OKampus',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              const Text(
                'Commencez maintenant',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Créez un compte pour explorer l\'application',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 14),

              _buildTextField(label: 'Nom', hint: 'Entrez votre nom', icon: Icons.person_outline),
              _buildTextField(label: 'Matricule', hint: 'Ex: 21A1234', icon: Icons.badge_outlined),
              _buildTextField(label: 'Email', hint: 'Entrez votre email', icon: Icons.email_outlined),

              // Champ téléphone avec drapeau +237
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Téléphone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 45,
                      child: Row(
                        children: [
                          const Text('🇨🇲 +237', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: 'Numéro de téléphone',
                                filled: true,
                                fillColor: Color(0xFFF9F9F9),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Champ mot de passe avec œil dynamique
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Mot de passe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        obscureText: _isPasswordObscured,
                        decoration: InputDecoration(
                          hintText: 'Entrez votre mot de passe',
                          prefixIcon: const Icon(Icons.lock_outline, size: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordObscured = !_isPasswordObscured;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9F9F9),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    // Exemple : navigation vers la page Home après inscription
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangeColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('S\'inscrire', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 10),

              const Center(child: Text("Ou continuez avec", style: TextStyle(color: Colors.grey))),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _buildSocialButton(
                      label: 'Google',
                      icon: FontAwesomeIcons.google,
                      iconColor: const Color(0xFFDB4437),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildSocialButton(
                      label: 'Facebook',
                      icon: FontAwesomeIcons.facebookF,
                      iconColor: const Color(0xFF1877F2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous avez déjà un compte ? "),
                    GestureDetector(
                      onTap: () {
                        // Navigation vers la page login
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text(
                        "Connexion",
                        style: TextStyle(fontWeight: FontWeight.bold, color: orangeColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 4),
          SizedBox(
            height: 45,
            child: TextField(
              obscureText: obscureText,
              keyboardType: icon == Icons.phone_outlined ? TextInputType.phone : null,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: Icon(icon, size: 20),
                suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20) : null,
                filled: true,
                fillColor: const Color(0xFFF9F9F9),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required String label,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: iconColor, size: 16),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
