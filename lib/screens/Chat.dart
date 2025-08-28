import 'dart:async';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Future<String> Function(String)? fetchResponse;

  const ChatScreen({Key? key, this.fetchResponse}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Bonsoir 👋',
      'isUser': true,
      'time': '8 août 18:59',
    },
    {
      'text':
          'Bonjour et bienvenue sur le chat du campus 🎓\n\nComment puis-je vous aider aujourd’hui ?',
      'isUser': false,
      'time': '18:59',
    },
  ];

  Future<void> sendMessage() async {
    if (_controller.text.trim().isNotEmpty) {
      String userMessage = _controller.text.trim();

      setState(() {
        messages.add({
          'text': userMessage,
          'isUser': true,
          'time': 'Maintenant',
        });
        _controller.clear();
      });

      // Fermer le clavier automatiquement
      FocusScope.of(context).unfocus();

      // Si une fonction Gemini est fournie
      if (widget.fetchResponse != null) {
        // Ajouter le loader
        setState(() {
          messages.add({
            'text': '',
            'isUser': false,
            'time': 'Maintenant',
            'isTyping': true,
          });
        });

        String reply = await widget.fetchResponse!(userMessage);

        // Supprimer le loader
        setState(() {
          messages.removeWhere((msg) => msg['isTyping'] == true);
        });

        // Affichage progressif lettre par lettre
        String currentText = '';
        for (int i = 0; i < reply.length; i++) {
          currentText += reply[i];
          if (i % 2 == 0 || i == reply.length - 1) {
            await Future.delayed(const Duration(milliseconds: 30));
            if (mounted) {
              setState(() {
                if (messages.isNotEmpty && messages.last['isUser'] == false) {
                  messages.last['text'] = currentText;
                } else {
                  messages.add({
                    'text': currentText,
                    'isUser': false,
                    'time': 'Maintenant',
                  });
                }
              });
            }
          }
        }
      }
    }
  }

  Widget buildMessage(Map<String, dynamic> msg) {
    final isUser = msg['isUser'];
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? Colors.lightBlue[100] : Colors.green[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          msg['text'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget buildChatDate(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(
          date,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      ),
    );
  }

  Widget buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Dot(),
            SizedBox(width: 4),
            Dot(delay: 100),
            SizedBox(width: 4),
            Dot(delay: 200),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? lastDateShown;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ChatOkampus',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.lightBlue),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
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
            icon: const Icon(Icons.home_outlined, color: Colors.
            lightBlue),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF1F5FA),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                if (msg['isTyping'] == true) return buildTypingIndicator();

                final time = msg['time'];
                final showDate = time.contains('8 août') && time != lastDateShown;
                if (showDate) lastDateShown = time;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (showDate) buildChatDate(time),
                    buildMessage(msg),
                  ],
                );
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                const Icon(Icons.edit, color: Colors.lightBlue),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Envoyer un message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.lightBlue),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Dot extends StatefulWidget {
  final int delay;
  const Dot({this.delay = 0, super.key});

  @override
  State<Dot> createState() => _DotState();
}

class _DotState extends State<Dot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const CircleAvatar(radius: 4, backgroundColor: Colors.green),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
