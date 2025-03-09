import 'package:flutter/material.dart';



class CommercialInternationalBankInvestmentScreen extends StatelessWidget {
  final List<Map<String, String>> certificates = [
    {
      "title": "Floating 2024 Certificate (3 Years)",
      "interestRate": "26%",
      "returnType": "Floating",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Five-Year USD Certificate (Monthly)",
      "interestRate": "4.5%",
      "returnType": "Fixed",
      "duration": "5 years",
      "payoutFrequency": "Monthly",
      "currency": "US Dollar",
      "minDeposit": "1,000 USD"
    },
    {
      "title": "Wealth Exclusive Certificate for Clients",
      "interestRate": "19%",
      "returnType": "Fixed",
      "duration": "3 years",
      "payoutFrequency": "Monthly",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000,000 EGP"
    },
    {
      "title": "Quinary - Quarterly Payout",
      "interestRate": "10.25%",
      "returnType": "Fixed",
      "duration": "5 years",
      "payoutFrequency": "Quarterly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Quinary - Semi-Annual Payout Certificate",
      "interestRate": "10.5%",
      "returnType": "Fixed",
      "duration": "5 years",
      "payoutFrequency": "Semi-Annual",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Ternary - Quarterly Payout Certificate",
      "interestRate": "9.75%",
      "returnType": "Fixed",
      "duration": "3 years",
      "payoutFrequency": "Quarterly",
      "currency": "Egyptian Pound",
      "minDeposit": "1,000 EGP"
    },
    {
      "title": "Quinary - At Maturity Certificate",
      "interestRate": "9.5%",
      "returnType": "Fixed",
      "duration": "5 years",
      "payoutFrequency": "At Maturity",
      "currency": "Egyptian Pound",
      "minDeposit": "5,000 EGP"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar("CIB Certificates"),
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
