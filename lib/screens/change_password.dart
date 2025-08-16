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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      resizeToAvoidBottomInset: true, // ✅ permet d'éviter l'overflow
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Changer le mot de passe",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
         actions: [
    IconButton(
      icon: const Icon(Icons.search, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/recherche');
      },
    ),
    IconButton(
      icon: const Icon(Icons.notifications_none, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/notifications');
      },
    ),
    IconButton(
      icon: const Icon(Icons.smart_toy_outlined, color: Colors.lightBlue), // icône chatbot
      onPressed: () {
        Navigator.pushNamed(context, '/chat'); // lien vers ton chatbot
      },
    ),
  ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 8),
                child: Text("Mot de passe actuel",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              _passwordField(
                hint: "Entrez votre mot de passe actuel",
                controller: _currentController,
                obscure: _obscureCurrent,
                toggle: () {
                  setState(() => _obscureCurrent = !_obscureCurrent);
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 8),
                child: Text("Nouveau mot de passe",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              _passwordField(
                hint: "Entrez votre nouveau mot de passe",
                controller: _newController,
                obscure: _obscureNew,
                toggle: () {
                  setState(() => _obscureNew = !_obscureNew);
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 8),
                child: Text("Confirmer le nouveau mot de passe",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              _passwordField(
                hint: "Confirmez votre nouveau mot de passe",
                controller: _confirmController,
                obscure: _obscureConfirm,
                toggle: () {
                  setState(() => _obscureConfirm = !_obscureConfirm);
                },
              ),

              // 🔹 Politique de sécurité
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.privacy_tip,
                            color: Colors.lightBlue, size: 26),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Politique de sécurité",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(height: 1, color: Colors.grey),
                    const SizedBox(height: 8),
                    const Text(
                      "⚠️ Choisissez un mot de passe fort : au moins 8 caractères, incluant lettres, chiffres et symboles.\n"
                      "🚫 Ne partagez jamais vos identifiants avec qui que ce soit.\n"
                      "📅 Changez votre mot de passe régulièrement pour plus de sécurité.\n",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Boutons
              Padding(
                padding: const EdgeInsets.all(16),
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
                          // TODO: Changer le mot de passe
                        },
                        child: const Text(
                          "Valider",
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
      ),
    );
  }
}
