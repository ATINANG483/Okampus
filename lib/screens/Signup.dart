import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static const Color blueSkyColor = Color(0xFF2563EB); // Bleu ciel
  static const Color greenIconColor = Color(0xFF2F855A); // Vert icône
  bool _isPasswordObscured = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {}); // Pour rafraîchir la visibilité de l'oeil en fonction du contenu
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: bottomInset > 0
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 30,
              bottom: bottomInset,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Créer un compte Okampus',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: blueSkyColor,
                  ),
                ),

                const SizedBox(height: 14),

                // Nom et prénom
                _buildTextField(
                  label: 'Nom et prénom',
                  hint: 'Entrez prénom et nom',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 14),

                // Matricule
                _buildTextField(
                  label: 'Matricule',
                  hint: 'Entrez votre matricule',
                  icon: Icons.badge_outlined,
                ),

                const SizedBox(height: 14),

                // Email
                _buildTextField(
                  label: 'Email',
                  hint: 'Entrez votre email',
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 14),

                // Mot de passe
                const Text(
                  'Mot de passe',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 56, // un peu plus grand
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isPasswordObscured,
                    decoration: InputDecoration(
                      hintText: 'Entrez votre mot de passe',
                      hintStyle: const TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.lock_outline,
                          size: 20, color: greenIconColor),
                      suffixIcon: _passwordController.text.isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(
                                _isPasswordObscured
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20,
                                color: greenIconColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordObscured = !_isPasswordObscured;
                                });
                              },
                            ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),

                const SizedBox(height: 30),

                // Bouton Créer un compte
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueSkyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Créer un compte',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Center(
                  child: Text(
                    'OU',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w400),
                  ),
                ),

                const SizedBox(height: 16),

                // Boutons réseaux sociaux
                Row(
                  children: [
                    Expanded(
                      child: _buildSocialButton(
                        label: 'Google',
                        icon: FontAwesomeIcons.google,
                        iconColor: const Color(0xFFDB4437),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSocialButton(
                        label: 'Facebook',
                        icon: FontAwesomeIcons.facebookF,
                        iconColor: const Color(0xFF1877F2),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // Lien vers Connexion
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Vous avez déjà un compte ? ",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                            color: blueSkyColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Champ personnalisé
  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          height: 56, // plus grand que 50 pour confort
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(icon, size: 20, color: greenIconColor),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  // Boutons sociaux
  Widget _buildSocialButton({
    required String label,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Coins légèrement arrondis
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: iconColor, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
