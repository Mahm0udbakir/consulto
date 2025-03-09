import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/logo.jpg', height: 100), // App Logo
              const SizedBox(height: 20),
              const Text(
                "Who We Are",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                "We are a team of six students from Future University in Egypt:\n"
                "Abdelrahman, Karim, Abdullah, Ziad, Mohamed, and Amr.\n"
                "We created Smart Consult to help people invest their money wisely.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Our Mission"),
              _buildSectionContent(
                "At Smart Consult, our goal is simple:\n"
                "Empower individuals with smart investment choices that fit their financial reality.",
              ),
              const SizedBox(height: 20),
              _buildFeature(
                  Icons.trending_up,
                  "Custom Investment Recommendations",
                  "We help you decide where to invest."),
              _buildFeature(Icons.account_balance_wallet, "Debt Management",
                  "Plan and organize your financial obligations."),
              _buildFeature(Icons.lightbulb, "Expert Guidance",
                  "Smart Consult provides instant, AI-powered financial insights."),
              const SizedBox(height: 30),
              const Text(
                "Let’s grow your wealth—smartly!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
