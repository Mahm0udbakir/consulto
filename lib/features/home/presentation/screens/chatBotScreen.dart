import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "message": _controller.text});
    });

    String userMessage = _controller.text.toLowerCase();
    _controller.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      _addBotResponse(userMessage);
    });
  }

  void _addBotResponse(String userMessage) {
    String botResponse = _generateBotResponse(userMessage);

    setState(() {
      _messages.add({"sender": "bot", "message": botResponse});
    });
  }

  String _generateBotResponse(String message) {
    if (message.contains("hello") || message.contains("hi")) {
      return "Hello! I'm your financial assistant. How can I help you manage your money today? 😊";
    } else if (message.contains("budget")) {
      return "A good budget starts with tracking income and expenses. Would you like tips on saving or investing?";
    } else if (message.contains("saving")) {
      return "It's great to save! A good rule is the 50/30/20 method: 50% needs, 30% wants, and 20% savings. Want help setting a savings goal?";
    } else if (message.contains("investing")) {
      return "Investing can grow your wealth over time! Consider stocks, bonds, or real estate based on your risk tolerance. Need beginner tips?";
    } else if (message.contains("loan")) {
      return "Loans can be useful but should be managed wisely. Are you looking for advice on personal loans or credit management?";
    } else if (message.contains("bye")) {
      return "Goodbye! Stay financially smart and have a great day! 👋";
    }
    return "I'm here to help with financial advice! Try asking about budgeting, saving, or investing.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Financial Assistant"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUser = _messages[index]["sender"] == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: 1.0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(12),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.green : Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          _messages[index]["message"]!,
                          style: TextStyle(color: isUser ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Ask about budgeting, saving, investing...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 200),
                    tween: Tween<double>(begin: 1, end: 1.1),
                    curve: Curves.easeInOut,
                    builder: (context, double scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: child,
                      );
                    },
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.green),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
