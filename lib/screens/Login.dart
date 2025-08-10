import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Forgotpassword.dart';  

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color orangeColor = Colors.orange;

  bool _isPasswordObscured = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _matriculeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? prefix,
    Widget? suffix,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 6),
          SizedBox(
            height: 45,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF9F9F9),
                prefixIcon: prefix,
                suffixIcon: suffix,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                'Bienvenue !',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Connectez-vous à votre compte',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 30),

              _buildTextField(
                label: 'Nom complet',
                controller: _nameController,
                prefix: const Icon(Icons.person_outline, size: 20),
              ),

              _buildTextField(
                label: 'Matricule',
                controller: _matriculeController,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('🇨🇲 +237', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      SizedBox(width: 8),
                      Icon(Icons.badge_outlined, size: 20, color: Colors.grey),
                    ],
                  ),
                ),
              ),

              _buildTextField(
                label: 'Mot de passe',
                controller: _passwordController,
                obscureText: _isPasswordObscured,
                prefix: const Icon(Icons.lock_outline, size: 20),
                suffix: IconButton(
                  icon: Icon(
                    _isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 20,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                 onPressed: () {
  final email = _matriculeController.text.trim();
  if (email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Veuillez entrer votre matricule avant.')),
    );
    return;
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VerificationScreen(email: email),
    ),
  );
},

                  child: const Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(color: orangeColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangeColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Se connecter', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 10),
              const Center(child: Text("Ou connectez-vous avec", style: TextStyle(color: Colors.grey))),
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
                    const Text("Pas encore de compte ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: const Text(
                        "S'inscrire",
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
}
