import 'package:consulto/features/home/presentation/screens/contactUsScreen.dart';
import 'package:consulto/features/home/presentation/screens/debtPlanningScreen.dart';
import 'package:consulto/features/home/presentation/screens/investementScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Smart Consult", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHomeButton(
                Icons.trending_up, "Investment", context, InvestmentScreen()),
            const SizedBox(height: 20),
            _buildHomeButton(Icons.account_balance_wallet, "Debt Planning",
                context, DebtPlanningScreen()),
            const SizedBox(height: 20),
            _buildHomeButton(
                Icons.contact_mail, "Contact Us", context, ContactUsScreen()),
          ],
        ),
      ),
    );
  }
}

Widget _buildHomeButton(
    IconData icon, String text, BuildContext context, Widget page) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton.icon(
      icon: Icon(icon, size: 30),
      label: Text(text, style: const TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, foregroundColor: Colors.white),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    ),
  );
}
