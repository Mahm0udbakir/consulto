import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

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
      body: FadeIn(
        duration: const Duration(milliseconds: 800),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ZoomIn(
                  duration: const Duration(milliseconds: 600),
                  child: Image.asset('assets/logo.jpg', height: 100),
                ),
                const SizedBox(height: 20),

                SlideInDown(
                  duration: const Duration(milliseconds: 700),
                  child: const Text(
                    "Who We Are",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),

                SlideInUp(
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    "We are a team of six students from Future University in Egypt:\n"
                    "Abdelrahman, Karim, Abdullah, Ziad, Mohamed, and Amr.\n"
                    "We created Smart Consult to help people invest their money wisely.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),

                _buildAnimatedSectionTitle("Our Mission"),
                _buildAnimatedSectionContent(
                  "At Smart Consult, our goal is simple:\n"
                  "Empower individuals with smart investment choices that fit their financial reality.",
                ),
                const SizedBox(height: 20),

                _buildAnimatedFeature(
                    Icons.trending_up, "Custom Investment Recommendations", "We help you decide where to invest."),
                _buildAnimatedFeature(Icons.account_balance_wallet, "Debt Management",
                    "Plan and organize your financial obligations."),
                _buildAnimatedFeature(Icons.lightbulb, "Expert Guidance",
                    "Smart Consult provides instant, AI-powered financial insights."),
                
                const SizedBox(height: 30),

                FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  child: const Text(
                    "Let’s grow your wealth—smartly!",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSectionTitle(String title) {
    return SlideInLeft(
      duration: const Duration(milliseconds: 700),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildAnimatedSectionContent(String content) {
    return SlideInRight(
      duration: const Duration(milliseconds: 700),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildAnimatedFeature(IconData icon, String title, String description) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 700),
      child: Padding(
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
      ),
    );
  }
}
