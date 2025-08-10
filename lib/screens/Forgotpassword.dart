import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  Color orangeColor = Colors.orange;

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 6; i++) {
      _controllers[i].addListener(_checkInputs);
    }
  }

  void _checkInputs() {
    bool allFilled = _controllers.every((c) => c.text.trim().isNotEmpty);
    if (allFilled != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = allFilled;
      });
    }
  }

  void _onChanged(int index, String value) {
    if (value.length == 1) {
      if (index < 5) {
        _focusNodes[index].unfocus();
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[index].unfocus();
      }
    } else if (value.isEmpty) {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }

  void _resendCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code renvoyé')),
    );
  }

  void _verifyCode() {
    String code = _controllers.map((c) => c.text).join();
    // Ici tu peux ajouter la logique de vérification du code
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Code saisi : $code')),
    );
  }

  Widget _buildCodeInput(int index) {
    return SizedBox(
      width: 40,
      height: 50,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: orangeColor, width: 2),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: (value) => _onChanged(index, value),
      ),
    );
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
        backgroundColor: orangeColor,
        leading: BackButton(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: orangeColor.withOpacity(0.15),
                radius: 30,
                child: Icon(
                  Icons.email_outlined,
                  color: orangeColor,
                  size: 30,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Please Verify Your Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter the 6 digit code we sent by email to',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                widget.email,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: orangeColor,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              // Code inputs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => _buildCodeInput(index)),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? _verifyCode : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangeColor,
                    disabledBackgroundColor: orangeColor.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Verify',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: _resendCode,
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: orangeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
