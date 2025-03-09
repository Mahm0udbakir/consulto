import 'package:flutter/material.dart';

class ArabAfricanBankInvestmentScreen extends StatelessWidget {
  final List<Map<String, String>> certificates = [
    {
      "title": "Five-Year Certificate",
      "interestRate": "5%",
      "returnType": "Fixed",
      "duration": "5 years",
      "payoutFrequency": "Monthly",
      "currency": "USD (Dollar)",
      "minDeposit": "5,000 USD"
    },
    {
      "title": "Emerald 3-Year Certificate (Monthly) [Suspended]",
      "interestRate": "26.25%",
      "returnType": "Variable",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000 EGP"
    },
    {
      "title": "Emerald 3-Year Certificate (Monthly)",
      "interestRate": "18%",
      "returnType": "Fixed",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000 EGP"
    },
    {
      "title": "Emirates 5-Year Certificate (Annual) [Suspended]",
      "interestRate": "27%",
      "returnType": "Variable",
      "duration": "5 years",
      "payoutFrequency": "Annually",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000 EGP"
    },
    {
      "title": "Fixed Return Savings Certificate",
      "interestRate": "20%",
      "returnType": "Fixed",
      "duration": "1.5 years (18 months)",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000 EGP"
    },
    {
      "title": "Daily Deposit Certificate",
      "interestRate": "27%",
      "returnType": "Variable",
      "duration": "3 years",
      "payoutFrequency": "Daily",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000 EGP"
    },
    {
      "title": "Cumulative Return Quadruple Certificate",
      "interestRate": "18.92%",
      "returnType": "Fixed",
      "duration": "4 years",
      "payoutFrequency": "End of term",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000 EGP"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar("Arab African Bank Certificates"),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: certificates.length,
        itemBuilder: (context, index) {
          final cert = certificates[index];
          return _buildCertificateDetail(
            cert["title"]!,
            cert["interestRate"]!,
            cert["returnType"]!,
            cert["duration"]!,
            cert["payoutFrequency"]!,
            cert["currency"]!,
            cert["minDeposit"]!,
          );
        },
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(String title) {
  return AppBar(
    title: Text(title, style: const TextStyle(color: Colors.white)),
    backgroundColor: Colors.green,
    centerTitle: true,
  );
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
