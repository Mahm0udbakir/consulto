import 'package:flutter/material.dart';

class BanqueMisrInvestmentScreen extends StatelessWidget {
  final List<Map<String, String>> certificates = [
    {
      "title": "Al-Qimma Certificate",
      "interestRate": "21.5%",
      "type": "Fixed",
      "duration": "3 years",
      "payout": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Ibn Misr Certificate",
      "interestRate": "26%",
      "type": "Graduated",
      "duration": "3 years",
      "payout": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Five-Year Fixed Dollar Certificate",
      "interestRate": "5%",
      "type": "Fixed",
      "duration": "5 years",
      "payout": "Monthly",
      "currency": "US Dollar",
      "minDeposit": "100 USD"
    },
    {
      "title": "Talaat Harb Certificate",
      "interestRate": "23.5%",
      "type": "Fixed",
      "duration": "1 year",
      "payout": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Al-Qimma Certificate (The Summit Certificate)",
      "interestRate": "16.5%",
      "type": "Fixed",
      "duration": "3 years",
      "payout": "Semi-Annual",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Talaat Harb Certificate (Annual Payout Version)",
      "interestRate": "27%",
      "type": "Fixed",
      "duration": "1 year",
      "payout": "Annually",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Daily Variable Yield Certificate",
      "interestRate": "27%",
      "type": "Variable",
      "duration": "3 years",
      "payout": "Daily",
      "currency": "Egyptian Pound",
      "minDeposit": "10,000 EGP"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar("Banque Misr Certificates"),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: certificates.length,
        itemBuilder: (context, index) {
          final cert = certificates[index];
          return _buildCertificateDetail(
            cert["title"]!,
            cert["interestRate"]!,
            cert["type"]!,
            cert["duration"]!,
            cert["payout"]!,
            cert["currency"]!,
            cert["minDeposit"]!,
          );
        },
      ),
    );
  }
}
Widget _buildCertificateDetail(
    String title,
    String interestRate,
    String returnType,
    String duration,
    String payoutFrequency,
    String currency,
    String minDeposit) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text("Interest Rate: $interestRate",
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
          Text("Type of Return: $returnType",
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
          Text("Duration: $duration",
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
          Text("Payout Frequency: $payoutFrequency",
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
          Text("Currency: $currency",
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
          Text("Minimum Deposit: $minDeposit",
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
        ],
      ),
    ),
  );
}

PreferredSizeWidget _buildAppBar(String title) {
  return AppBar(
    title: Text(title, style: const TextStyle(color: Colors.white)),
    backgroundColor: Colors.green,
    centerTitle: true,
  );
}
