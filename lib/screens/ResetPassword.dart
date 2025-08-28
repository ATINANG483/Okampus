import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // Remplace cette ligne :
  // static const Color blueSkyColor = Color(0xFF2563EB);
  // Par :
  static const Color blueSkyColor = Colors.lightBlue;

  static const Color errorColor = Colors.red;

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  bool _showPasswordIcon = false;
  bool _showConfirmIcon = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  String? _passwordError;
  String? _confirmError;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      final text = _passwordController.text;
      setState(() {
        _showPasswordIcon = text.isNotEmpty;
        if (_passwordError != null) _passwordError = null;
      });
    });

    _confirmController.addListener(() {
      final text = _confirmController.text;
      setState(() {
        _showConfirmIcon = text.isNotEmpty;
        if (_confirmError != null) _confirmError = null; 
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _updatePassword() {
    final password = _passwordController.text;
    final confirm = _confirmController.text;

    setState(() {
      _passwordError = null;
      _confirmError = null;
    });

    if (password.isEmpty) {
      setState(() {
        _passwordError = 'Veuillez remplir ce champ';
      });
      return;
    }
    if (confirm.isEmpty) {
      setState(() {
        _confirmError = 'Veuillez remplir ce champ';
      });
      return;
    }
    if (password != confirm) {
      setState(() {
        _confirmError = 'Les mots de passe ne correspondent pas';
      });
      return;
    }

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required bool showIcon,
    required VoidCallback toggleObscure,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: blueSkyColor,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: label == 'Mot de passe'
                ? 'Entrez votre nouveau mot de passe'
                : 'Confirmez le mot de passe',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: const Color(0xFFF5F8FA),
            prefixIcon: Icon(Icons.lock_outline, color: blueSkyColor),
            suffixIcon: showIcon
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: blueSkyColor,
                    ),
                    onPressed: toggleObscure,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: errorText != null
                  ? BorderSide(color: errorColor, width: 2)
                  : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: errorText != null
                  ? BorderSide(color: errorColor, width: 2)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: errorText != null
                  ? BorderSide(color: errorColor, width: 2)
                  : BorderSide(color: Colors.lightBlue, width: 2),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            errorText,
            style: TextStyle(color: errorColor, fontSize: 12),
          ),
        ],
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: blueSkyColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Créer un nouveau mot de passe',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 7, 10),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Créez un mot de passe différent des précédents pour plus de sécurité.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),

            _buildPasswordField(
              label: 'Mot de passe',
              controller: _passwordController,
              obscureText: _obscurePassword,
              showIcon: _showPasswordIcon,
              toggleObscure: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              errorText: _passwordError,
            ),

            _buildPasswordField(
              label: 'Confirmez le mot de passe',
              controller: _confirmController,
              obscureText: _obscureConfirm,
              showIcon: _showConfirmIcon,
              toggleObscure: () {
                setState(() {
                  _obscureConfirm = !_obscureConfirm;
                });
              },
              errorText: _confirmError,
            ),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _updatePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueSkyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Mettre à jour le mot de passe',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
