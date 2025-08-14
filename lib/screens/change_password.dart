import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  Widget _passwordField({
    required String hint,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback toggle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.lightBlue),
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.lightBlue,
            ),
            onPressed: toggle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Flèche en noir
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Changer le mot de passe",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18, // Légèrement réduit
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.lightBlue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.lightBlue),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mot de passe actuel",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _passwordField(
              hint: "Entrez votre mot de passe actuel",
              controller: _currentController,
              obscure: _obscureCurrent,
              toggle: () {
                setState(() => _obscureCurrent = !_obscureCurrent);
              },
            ),
            const SizedBox(height: 8),
            const Text(
              "Nouveau mot de passe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _passwordField(
              hint: "Entrez votre nouveau mot de passe",
              controller: _newController,
              obscure: _obscureNew,
              toggle: () {
                setState(() => _obscureNew = !_obscureNew);
              },
            ),
            const SizedBox(height: 8),
            const Text(
              "Confirmation du nouveau mot de passe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _passwordField(
              hint: "Confirmez votre nouveau mot de passe",
              controller: _confirmController,
              obscure: _obscureConfirm,
              toggle: () {
                setState(() => _obscureConfirm = !_obscureConfirm);
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20), // Monte un peu les boutons
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(color: Colors.lightBlue),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Annuler",
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Changer le mot de passe dans ton backend
                      },
                      child: const Text(
                        "Enregistrer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
