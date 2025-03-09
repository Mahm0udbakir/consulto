import 'package:flutter/material.dart';

class NationalBankInvestmentScreen extends StatelessWidget {
  final List<Map<String, String>> certificates = [
    {
      "title": "Platinum Certificate with a Graduated Return",
      "interestRate": "26%",
      "returnType": "Variable",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Ahl Masr Certificate",
      "interestRate": "5%",
      "returnType": "Fixed",
      "duration": "5 years",
      "payoutFrequency": "Monthly",
      "currency": "US Dollar",
      "minDeposit": "500 USD"
    },
    {
      "title": "Monthly Platinum Certificate",
      "interestRate": "21.5%",
      "returnType": "Fixed",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Platinum Annual Certificate",
      "interestRate": "27%",
      "returnType": "Fixed",
      "duration": "1 year",
      "payoutFrequency": "At the end of the term",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Investment for Two Years Certificate",
      "interestRate": "13.5%",
      "returnType": "Fixed",
      "duration": "2 years",
      "payoutFrequency": "Quarterly",
      "currency": "Egyptian Pound",
      "minDeposit": "500 EGP"
    },
    {
      "title": "Platinum Annual Certificate",
      "interestRate": "23%",
      "returnType": "Fixed",
      "duration": "1 year",
      "payoutFrequency": "Daily",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Platinum Certificate with Annual Gradual Return Certificate",
      "interestRate": "30%",
      "returnType": "Gradual",
      "duration": "3 years",
      "payoutFrequency": "Annually",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
  ];

  NationalBankInvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar("National Bank of Egypt Certificates"),
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
