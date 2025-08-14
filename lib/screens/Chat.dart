import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
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
    {
      'text': "Quels sont les horaires de la bibliothèque ?",
      'isUser': true,
      'time': '8 août 19:05',
    },
    {
      'text':
          "La bibliothèque est ouverte du lundi au vendredi, de 8h à 18h, et le samedi de 9h à 13h 📚.",
      'isUser': false,
      'time': '19:06',
    },
    {
      'text': "Quels événements sont prévus cette semaine ?",
      'isUser': true,
      'time': '8 août 19:15',
    },
    {
      'text':
          "Cette semaine :\n- Mardi : Conférence sur l'entrepreneuriat (14h)\n- Jeudi : Tournoi de football ⚽\n- Vendredi : Soirée culturelle 🎶",
      'isUser': false,
      'time': '19:16',
    },
  ];

  void sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          'text': _controller.text.trim(),
          'isUser': true,
          'time': 'Maintenant',
        });
        _controller.clear();
      });
    }
  }

  Widget buildMessage(Map<String, dynamic> msg) {
    final isUser = msg['isUser'];
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? Colors.white : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          msg['text'],
          style: TextStyle(
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
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? lastDateShown;

    return Scaffold(
     appBar: AppBar(
  title: Text(
    'ChatOkampus',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  elevation: 1,
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
    onPressed: () {
      Navigator.pushNamed(context, '/home'); // Retour vers le dashboard
    },
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/recherche');
      },
    ),
    IconButton(
      icon: Icon(Icons.notifications_none, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/notifications');
      },
    ),
    IconButton(
      icon: Icon(Icons.home_outlined, color: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    ),
  ],
),

      backgroundColor: Color(0xFFF1F5FA),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final time = msg['time'];
                final showDate =
                    time.contains('8 août') && time != lastDateShown;
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
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.edit, color: Colors.lightBlue),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Envoyer un message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.lightBlue),
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
