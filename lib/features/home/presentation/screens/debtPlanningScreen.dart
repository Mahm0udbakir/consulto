import 'package:consulto/features/auth/presentation/screens/latest.dart';
import 'package:consulto/features/home/presentation/screens/banks/arabAfricanBank.dart';
import 'package:consulto/features/home/presentation/screens/banks/banqueMisr.dart';
import 'package:consulto/features/home/presentation/screens/banks/commercialBank.dart';
import 'package:consulto/features/home/presentation/screens/banks/qatarBank.dart';
import 'package:flutter/material.dart';

class DebtPlanningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar("Loan"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBankButton(
                "National Bank of Egypt", context, NationalBankofEgyptScreen()),
            const SizedBox(height: 16),
            _buildBankButton("Banque Misr", context, BanqueMisrInvestmentScreen()),
            const SizedBox(height: 16),
            _buildBankButton("Commercial International Bank", context,
                CommercialInternationalBankInvestmentScreen()),
            const SizedBox(height: 16),
            _buildBankButton(
                "Arab African Bank", context, ArabAfricanBankInvestmentScreen()),
            const SizedBox(height: 16),
            _buildBankButton(
                "Qatar National Bank", context, QatarNationalBankInvestmentScreen()),
          ],
        ),
      ),
    );
  }
}

Widget _buildBankButton(String bankName,
    [BuildContext? context, Widget? page]) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton(
      child: Text(bankName, style: const TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, foregroundColor: Colors.white),
      onPressed: () {
        if (context != null && page != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
      },
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
