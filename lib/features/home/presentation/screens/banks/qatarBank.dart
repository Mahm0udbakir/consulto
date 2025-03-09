import 'package:flutter/material.dart';

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

class QatarNationalBankInvestmentScreen extends StatelessWidget {
  final List<Map<String, String>> certificates = [
    {
      "title": "Three-Year Tiered Certificate with Monthly Return",
      "interestRate": "27.25%",
      "returnType": "Tiered",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "My Certificate",
      "interestRate": "1.3%",
      "returnType": "Fixed",
      "duration": "5 years",
      "payoutFrequency": "Monthly",
      "currency": "US Dollar",
      "minDeposit": "1,000 USD"
    },
    {
      "title": "Exclusive Certificate",
      "interestRate": "19.5%",
      "returnType": "Fixed",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000,000 EGP"
    },
    {
      "title": "First Certificate",
      "interestRate": "19.65%",
      "returnType": "Fixed",
      "duration": "3 years",
      "payoutFrequency": "Annually",
      "currency": "Egyptian Pound",
      "minDeposit": "500 EGP"
    },
    {
      "title": "Fourth Certificate with Semi-Annual Returns",
      "interestRate": "17.625%",
      "returnType": "Fixed",
      "duration": "4 years",
      "payoutFrequency": "Semi-Annually",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Third Certificate with Semi-Annual Returns",
      "interestRate": "18.6%",
      "returnType": "Fixed",
      "duration": "3 years",
      "payoutFrequency": "Semi-Annually",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Fifth Certificate with Variable Quarterly Returns",
      "interestRate": "27%",
      "returnType": "Variable",
      "duration": "5 years",
      "payoutFrequency": "Quarterly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar("Qatar National Bank Certificates"),
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
