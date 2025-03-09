// import 'package:flutter/material.dart';

// void main() {
//   runApp(SmartConsultApp());
// }

// class SmartConsultApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Smart Consult',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MainScreen(),
//     );
//   }
// }

// // -------------------- Main Screen with Bottom Navigation --------------------

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     HomeScreen(),
//     ProfileScreen(),
//     AboutUsScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//           BottomNavigationBarItem(icon: Icon(Icons.info), label: "About Us"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.logout_outlined), label: "Logout")
//         ],
//       ),
//     );
//   }
// }

// // -------------------- Updated Home Page --------------------

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Smart Consult"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildHomeButton(
//                 Icons.trending_up, "Investment", context!, InvestmentScreen()),
//             const SizedBox(height: 20),
//             _buildHomeButton(Icons.account_balance_wallet, "Loans", context!,
//                 DebtPlanningScreen()),
//             const SizedBox(height: 20),
//             _buildHomeButton(
//                 Icons.contact_mail, "Contact Us", context!, ContactUsScreen()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // -------------------- Investment Page --------------------

// class InvestmentScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Investment"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildBankButton("National Bank of Egypt", context,
//                 NationalBankInvestmentScreen()),
//             const const SizedBox(height: 16), // Increased space
//             _buildBankButton(
//                 "Banque Misr", context, BanqueMisrInvestmentScreen()),
//             const const SizedBox(height: 16),
//             _buildBankButton("Commercial International Bank", context,
//                 CommercialInternationalBankInvestmentScreen()),
//             const const SizedBox(height: 16),
//             _buildBankButton("Arab African Bank", context,
//                 ArabAfricanBankInvestmentScreen()),
//             const const SizedBox(height: 16),
//             _buildBankButton("Qatar National Bank", context,
//                 QatarNationalBankInvestmentScreen()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Placeholder screens for investment details
// class NationalBankInvestmentScreen extends StatelessWidget {
//   final List<Map<String, String>> certificates = [
//     {
//       "title": "Platinum Certificate with a Graduated Return",
//       "interestRate": "26%",
//       "returnType": "Variable",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Ahl Masr Certificate",
//       "interestRate": "5%",
//       "returnType": "Fixed",
//       "duration": "5 years",
//       "payoutFrequency": "Monthly",
//       "currency": "US Dollar",
//       "minDeposit": "500 USD"
//     },
//     {
//       "title": "Monthly Platinum Certificate",
//       "interestRate": "21.5%",
//       "returnType": "Fixed",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Platinum Annual Certificate",
//       "interestRate": "27%",
//       "returnType": "Fixed",
//       "duration": "1 year",
//       "payoutFrequency": "At the end of the term",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Investment for Two Years Certificate",
//       "interestRate": "13.5%",
//       "returnType": "Fixed",
//       "duration": "2 years",
//       "payoutFrequency": "Quarterly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "500 EGP"
//     },
//     {
//       "title": "Platinum Annual Certificate",
//       "interestRate": "23%",
//       "returnType": "Fixed",
//       "duration": "1 year",
//       "payoutFrequency": "Daily",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Platinum Certificate with Annual Gradual Return Certificate",
//       "interestRate": "30%",
//       "returnType": "Gradual",
//       "duration": "3 years",
//       "payoutFrequency": "Annually",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("National Bank of Egypt Certificates"),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: certificates.length,
//         itemBuilder: (context, index) {
//           final cert = certificates[index];
//           return _buildCertificateDetail(
//             cert["title"]!,
//             cert["interestRate"]!,
//             cert["returnType"]!,
//             cert["duration"]!,
//             cert["payoutFrequency"]!,
//             cert["currency"]!,
//             cert["minDeposit"]!,
//           );
//         },
//       ),
//     );
//   }
// }

// Widget _buildCertificateDetail(
//     String title,
//     String interestRate,
//     String returnType,
//     String duration,
//     String payoutFrequency,
//     String currency,
//     String minDeposit) {
//   return Card(
//     margin: const EdgeInsets.symmetric(vertical: 8),
//     child: Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 5),
//           Text("Interest Rate: $interestRate",
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//           Text("Type of Return: $returnType",
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//           Text("Duration: $duration",
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//           Text("Payout Frequency: $payoutFrequency",
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//           Text("Currency: $currency",
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//           Text("Minimum Deposit: $minDeposit",
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//         ],
//       ),
//     ),
//   );
// }

// class BanqueMisrInvestmentScreen extends StatelessWidget {
//   final List<Map<String, String>> certificates = [
//     {
//       "title": "Al-Qimma Certificate",
//       "interestRate": "21.5%",
//       "type": "Fixed",
//       "duration": "3 years",
//       "payout": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Ibn Misr Certificate",
//       "interestRate": "26%",
//       "type": "Graduated",
//       "duration": "3 years",
//       "payout": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Five-Year Fixed Dollar Certificate",
//       "interestRate": "5%",
//       "type": "Fixed",
//       "duration": "5 years",
//       "payout": "Monthly",
//       "currency": "US Dollar",
//       "minDeposit": "100 USD"
//     },
//     {
//       "title": "Talaat Harb Certificate",
//       "interestRate": "23.5%",
//       "type": "Fixed",
//       "duration": "1 year",
//       "payout": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Al-Qimma Certificate (The Summit Certificate)",
//       "interestRate": "16.5%",
//       "type": "Fixed",
//       "duration": "3 years",
//       "payout": "Semi-Annual",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Talaat Harb Certificate (Annual Payout Version)",
//       "interestRate": "27%",
//       "type": "Fixed",
//       "duration": "1 year",
//       "payout": "Annually",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Daily Variable Yield Certificate",
//       "interestRate": "27%",
//       "type": "Variable",
//       "duration": "3 years",
//       "payout": "Daily",
//       "currency": "Egyptian Pound",
//       "minDeposit": "10,000 EGP"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Banque Misr Certificates"),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: certificates.length,
//         itemBuilder: (context, index) {
//           final cert = certificates[index];
//           return _buildCertificateDetail(
//             cert["title"]!,
//             cert["interestRate"]!,
//             cert["type"]!,
//             cert["duration"]!,
//             cert["payout"]!,
//             cert["currency"]!,
//             cert["minDeposit"]!,
//           );
//         },
//       ),
//     );
//   }
// }

// class CommercialInternationalBankInvestmentScreen extends StatelessWidget {
//   final List<Map<String, String>> certificates = [
//     {
//       "title": "Floating 2024 Certificate (3 Years)",
//       "interestRate": "26%",
//       "returnType": "Floating",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Five-Year USD Certificate (Monthly)",
//       "interestRate": "4.5%",
//       "returnType": "Fixed",
//       "duration": "5 years",
//       "payoutFrequency": "Monthly",
//       "currency": "US Dollar",
//       "minDeposit": "1,000 USD"
//     },
//     {
//       "title": "Wealth Exclusive Certificate for Clients",
//       "interestRate": "19%",
//       "returnType": "Fixed",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000,000 EGP"
//     },
//     {
//       "title": "Quinary - Quarterly Payout",
//       "interestRate": "10.25%",
//       "returnType": "Fixed",
//       "duration": "5 years",
//       "payoutFrequency": "Quarterly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Quinary - Semi-Annual Payout Certificate",
//       "interestRate": "10.5%",
//       "returnType": "Fixed",
//       "duration": "5 years",
//       "payoutFrequency": "Semi-Annual",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Ternary - Quarterly Payout Certificate",
//       "interestRate": "9.75%",
//       "returnType": "Fixed",
//       "duration": "3 years",
//       "payoutFrequency": "Quarterly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Quinary - At Maturity Certificate",
//       "interestRate": "9.5%",
//       "returnType": "Fixed",
//       "duration": "5 years",
//       "payoutFrequency": "At Maturity",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000 EGP"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("CIB Certificates"),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: certificates.length,
//         itemBuilder: (context, index) {
//           final cert = certificates[index];
//           return _buildCertificateDetail(
//             cert["title"]!,
//             cert["interestRate"]!,
//             cert["returnType"]!,
//             cert["duration"]!,
//             cert["payoutFrequency"]!,
//             cert["currency"]!,
//             cert["minDeposit"]!,
//           );
//         },
//       ),
//     );
//   }
// }

// class ArabAfricanBankInvestmentScreen extends StatelessWidget {
//   final List<Map<String, String>> certificates = [
//     {
//       "title": "Five-Year Certificate",
//       "interestRate": "5%",
//       "returnType": "Fixed",
//       "duration": "5 years",
//       "payoutFrequency": "Monthly",
//       "currency": "USD (Dollar)",
//       "minDeposit": "5,000 USD"
//     },
//     {
//       "title": "Emerald 3-Year Certificate (Monthly) [Suspended]",
//       "interestRate": "26.25%",
//       "returnType": "Variable",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000 EGP"
//     },
//     {
//       "title": "Emerald 3-Year Certificate (Monthly)",
//       "interestRate": "18%",
//       "returnType": "Fixed",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000 EGP"
//     },
//     {
//       "title": "Emirates 5-Year Certificate (Annual) [Suspended]",
//       "interestRate": "27%",
//       "returnType": "Variable",
//       "duration": "5 years",
//       "payoutFrequency": "Annually",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000 EGP"
//     },
//     {
//       "title": "Fixed Return Savings Certificate",
//       "interestRate": "20%",
//       "returnType": "Fixed",
//       "duration": "1.5 years (18 months)",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000 EGP"
//     },
//     {
//       "title": "Daily Deposit Certificate",
//       "interestRate": "27%",
//       "returnType": "Variable",
//       "duration": "3 years",
//       "payoutFrequency": "Daily",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000 EGP"
//     },
//     {
//       "title": "Cumulative Return Quadruple Certificate",
//       "interestRate": "18.92%",
//       "returnType": "Fixed",
//       "duration": "4 years",
//       "payoutFrequency": "End of term",
//       "currency": "Egyptian Pound",
//       "minDeposit": "5,000 EGP"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Arab African Bank Certificates"),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: certificates.length,
//         itemBuilder: (context, index) {
//           final cert = certificates[index];
//           return _buildCertificateDetail(
//             cert["title"]!,
//             cert["interestRate"]!,
//             cert["returnType"]!,
//             cert["duration"]!,
//             cert["payoutFrequency"]!,
//             cert["currency"]!,
//             cert["minDeposit"]!,
//           );
//         },
//       ),
//     );
//   }
// }

// class QatarNationalBankInvestmentScreen extends StatelessWidget {
//   final List<Map<String, String>> certificates = [
//     {
//       "title": "Three-Year Tiered Certificate with Monthly Return",
//       "interestRate": "27.25%",
//       "returnType": "Tiered",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "My Certificate",
//       "interestRate": "1.3%",
//       "returnType": "Fixed",
//       "duration": "5 years",
//       "payoutFrequency": "Monthly",
//       "currency": "US Dollar",
//       "minDeposit": "1,000 USD"
//     },
//     {
//       "title": "Exclusive Certificate",
//       "interestRate": "19.5%",
//       "returnType": "Fixed",
//       "duration": "3 years",
//       "payoutFrequency": "Monthly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000,000 EGP"
//     },
//     {
//       "title": "First Certificate",
//       "interestRate": "19.65%",
//       "returnType": "Fixed",
//       "duration": "3 years",
//       "payoutFrequency": "Annually",
//       "currency": "Egyptian Pound",
//       "minDeposit": "500 EGP"
//     },
//     {
//       "title": "Fourth Certificate with Semi-Annual Returns",
//       "interestRate": "17.625%",
//       "returnType": "Fixed",
//       "duration": "4 years",
//       "payoutFrequency": "Semi-Annually",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Third Certificate with Semi-Annual Returns",
//       "interestRate": "18.6%",
//       "returnType": "Fixed",
//       "duration": "3 years",
//       "payoutFrequency": "Semi-Annually",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//     {
//       "title": "Fifth Certificate with Variable Quarterly Returns",
//       "interestRate": "27%",
//       "returnType": "Variable",
//       "duration": "5 years",
//       "payoutFrequency": "Quarterly",
//       "currency": "Egyptian Pound",
//       "minDeposit": "1,000 EGP"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Qatar National Bank Certificates"),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: certificates.length,
//         itemBuilder: (context, index) {
//           final cert = certificates[index];
//           return _buildCertificateDetail(
//             cert["title"]!,
//             cert["interestRate"]!,
//             cert["returnType"]!,
//             cert["duration"]!,
//             cert["payoutFrequency"]!,
//             cert["currency"]!,
//             cert["minDeposit"]!,
//           );
//         },
//       ),
//     );
//   }
// }

// // -------------------- Debt Planning (List of Banks) --------------------

// class DebtPlanningScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Loan"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildBankButton(
//                 "National Bank of Egypt", context, NationalBankofEgyptScreen()),
//             const const SizedBox(height: 16),
//             _buildBankButton("Banque Misr", context, BanqueMisrScreen()),
//             const const SizedBox(height: 16),
//             _buildBankButton("Commercial International Bank", context,
//                 CommercialInternationalBankScreen()),
//             const const SizedBox(height: 16),
//             _buildBankButton(
//                 "Arab African Bank", context, ArabAfricanBankScreen()),
//             const const SizedBox(height: 16),
//             _buildBankButton(
//                 "Qatar National Bank", context, QatarNationalBankScreen()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // -------------------- National Bank of Egypt Loan Details --------------------

// class NationalBankofEgyptScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("National Bank of Egypt Loans"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildLoanDetail(
//                   "Loan for Egyptians working abroad ",
//                   "Interest Rate: Up to 15%",
//                   "Loan Duration: Up to 4 years"
//                       "Guarantees: by salary transfer "
//                       "Loan amount: 50,000 to 3,000,000 pounds"
//                       "Funding type: Employees"),
//               _buildLoanDetail(
//                   "Private sector employee loan",
//                   "Interest Rate: 23.5%",
//                   "Loan Duration: Up to 10 years"
//                       "Guarantees: by salary transfer"
//                       "Loan amount: Up to 2,000,000 pounds"
//                       "Funding type:Private sector"),
//               _buildLoanDetail(
//                   "Employee loan",
//                   "Interest Rate: 23.75% to 24%",
//                   "Loan Duration: Up to 12 years"
//                       "Guarantees: by salary transfer"
//                       "Loan amount: up to 3,000,000 pounds"
//                       "Funding type: Employees"),
//               _buildLoanDetail(
//                   "Dept repayment",
//                   "Interest Rate: 16%",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees: by salary transfer"
//                       "Loan amount: up to 2,000,000 pounds"
//                       "Funding type: Dept repayment"),
//               _buildLoanDetail(
//                   "Loan secured by certificates",
//                   "Interest Rate: 2% %to 3.5% + Certificate price ",
//                   "Loan Duration: 1.5 to 10 years"
//                       "Guarantees: Savings pot"
//                       "Loan amount: up to 90% of the Certificate value "
//                       "Funding type: Secured Loans"),
//               _buildLoanDetail(
//                   "Bank Employee Loan",
//                   "Interest Rate: 19.5%",
//                   "Loan Duration: 7 to 10 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 700,000 pounds"
//                       "Funding type: Bankers"),
//               _buildLoanDetail(
//                   "Bank Employee Loan",
//                   "Interest Rate: 18.5%",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 1,500,000 pounds"
//                       "Funding type: Bankers"),
//               _buildLoanDetail(
//                   "Pensioners loan ",
//                   "Interest Rate: 21.5%",
//                   "Loan Duration: Up to 10 years"
//                       "Guarantees:by salary transfer "
//                       "Loan amount: up to 1,000,000 pounds"
//                       "Funding type: Pensioners"),
//               _buildLoanDetail(
//                   "Employee Loan ",
//                   "Interest Rate: 24% to 25.6%",
//                   "Loan Duration: 1 to 4 years"
//                       "Guarantees:Without conversion "
//                       "Loan amount: up to 700,000 pounds"
//                       "Funding type:Employees"),
//               _buildLoanDetail(
//                   "Oil and Gas Sector Employee Loan  ",
//                   "Interest Rate: 21%",
//                   "Loan Duration: Up to 10 years"
//                       "Guarantees:by salary transfer "
//                       "Loan amount: up to 2,000,000 pounds"
//                       "Funding type:Employees"),
//               _buildLoanDetail(
//                   "Doctors loan ",
//                   "Interest Rate: 20%",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: Without conversion "
//                       "Loan amount: up to 1,000,000 pounds"
//                       "Funding type: Doctors"),
//               _buildLoanDetail(
//                   "Self-employed loan  ",
//                   "Interest Rate: 26.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees:By salary transfer "
//                       "Loan amount: up to 1,500,000 pounds"
//                       "Funding type: Free professions"),
//               _buildLoanDetail(
//                   "Car loan for self-employed ",
//                   "Program type: The car is private"
//                       "Car type: New "
//                       "Interest Rate:32% to 32.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: Without conversion "
//                       "Financing value:20,000 to 3,000,000 pounds "
//                       "Down payment: 0%"),
//               _buildLoanDetail(
//                   "Chinese car loan ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 32% to 32.5%  ",
//                   "Loan Duration: 1 to 4 years"
//                       "Guarantees:Without conversion "
//                       "Financing value:20,000 to 1,000,000 pounds   "
//                       "Down payment: 50%"),
//               _buildLoanDetail(
//                   "Car loan ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 32% to 32.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees:Without conversion "
//                       "Financing value: 20,000 to 1,000,000 "
//                       "Down payment: 0%"),
//               _buildLoanDetail(
//                   "Car loan ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 32% to 32.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: by salary transfer "
//                       "Financing value: 20,000 to 1,000,000 "
//                       "Down payment: 0%"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // -------------------- Banque Misr Loan Details --------------------

// class BanqueMisrScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Banque Misr Loans"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildLoanDetail(
//                   "Bank Employee Loan",
//                   "Interest Rate: Up to 21%",
//                   "Loan Duration: Up to 10 years"
//                       "Guarantees: by salary transfer "
//                       "Loan amount: 10,000 to 1,500,000 pounds"),
//               _buildLoanDetail(
//                   "Cash Loan with Collateral",
//                   "Interest Rate: 2% + ROI",
//                   "Loan Duration: Up to 10 years"
//                       "Guarantees: Savings pot"
//                       "Loan amount: Up to 90% of the savings account value"),
//               _buildLoanDetail(
//                   "Travel & Hajj Loan",
//                   "Interest Rate: 22.5%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 100,000 pounds"
//                       "Funding type: Travel and Hajj"),
//               _buildLoanDetail(
//                   "Travel & Hajj Loan",
//                   "Interest Rate: 19%",
//                   "Loan Duration: Up to 6 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 100,000 pounds"
//                       "Funding type: Travel and Hajj"),
//               _buildLoanDetail(
//                   "Business Owners Loan",
//                   "Interest Rate: 17.5%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 500,000 pounds"
//                       "Funding type: free professions"),
//               _buildLoanDetail(
//                   "Pensioners Loan",
//                   "Interest Rate: 21.63%",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees: by salary transfer"
//                       "Loan amount: up to 500,000 pounds"
//                       "Funding type: pensioners"),
//               _buildLoanDetail(
//                   "Commodity loan for pensioners",
//                   "Interest Rate: 20.35%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 750,000 pounds"
//                       "Funding type: durable goods"),
//               _buildLoanDetail(
//                   "Employee Durable goods loan ",
//                   "Interest Rate: 20.75%",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees:by salary transfer "
//                       "Loan amount: up to 250,000 pounds"
//                       "Funding type: durable goods"),
//               _buildLoanDetail(
//                   "Employee Durable goods loan ",
//                   "Interest Rate: 21%",
//                   "Loan Duration: Up to 4 years"
//                       "Guarantees:Without conversion "
//                       "Loan amount: up to 100,000 pounds"
//                       "Funding type: durable goods"),
//               _buildLoanDetail(
//                   "Personal loan for free professions  ",
//                   "Interest Rate: 24%",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees:Without conversion "
//                       "Loan amount: up to 750,000 pounds"
//                       "Funding type:Employees"),
//               _buildLoanDetail(
//                   "Education loan for employees  ",
//                   "Interest Rate: 21%",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees:By salary transfer "
//                       "Loan amount: up to 300,000 pounds"
//                       "Funding type:Education"),
//               _buildLoanDetail(
//                   "Personal loan for employees   ",
//                   "Interest Rate: 22.38% to 23.5 ",
//                   "Loan Duration: Up to 15 years"
//                       "Guarantees:By salary transfer "
//                       "Loan amount: up to 3,000,000 pounds"
//                       "Funding type:Employees"),
//               _buildLoanDetail(
//                   "Used car loan for self-employment ",
//                   "Program type: The car is private"
//                       "Car type: used"
//                       "Interest Rate: 24.75% ",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees:Without conversion "
//                       "Financing value: Nothing  "
//                       "Down payment: 0%"),
//               _buildLoanDetail(
//                   "Car loan for self-employment ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 26% ",
//                   "Loan Duration: Up to 6 years"
//                       "Guarantees:Without conversion "
//                       "Financing value: up to 750,000  "
//                       "Down payment: 0%"),
//               _buildLoanDetail(
//                   "Car loan for employees  ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 25% ",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees:by salary transfer  "
//                       "Financing value: 40,000 to 1,000,000 "
//                       "Down payment: 0%"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // -------------------- Commercial International Bank Loan Details --------------------

// class CommercialInternationalBankScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Commercial International Bank Loans"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildLoanDetail(
//                   "Debt settlement loan ",
//                   "Interest Rate: 2% less than loan interest ",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: 50,000 to 2,000,000 pounds"
//                       "Funding type: Dept repayment "),
//               _buildLoanDetail(
//                   "Loan secured by savings accounts",
//                   "Interest Rate: 18% to 20% ",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: Savings pot"
//                       "Loan amount: Up to 1,200,000 pounds"
//                       "Funding type:Secured Loans"),
//               _buildLoanDetail(
//                   "University professors’ loan",
//                   "Interest Rate: 18.75% to 19.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: 25,000 to 175,000 pounds"
//                       "Funding type: University professors "),
//               _buildLoanDetail(
//                   "Doctors loan",
//                   "Interest Rate:21.5% to 23.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 2,000,000 pounds"
//                       "Funding type: Dept repayment"),
//               _buildLoanDetail(
//                   "Loan secured by certificates",
//                   "Interest Rate: 2% %to 3.5% + Certificate price ",
//                   "Loan Duration: 1.5 to 10 years"
//                       "Guarantees: Savings pot"
//                       "Loan amount:up to 450,000 "
//                       "Funding type: Doctors"),
//               _buildLoanDetail(
//                   "Education loan",
//                   "Interest Rate: up to 18% ",
//                   "Loan Duration: up to 5 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: 5000 to 150,000 pounds"
//                       "Funding type: Education"),
//               _buildLoanDetail(
//                   "Bank Employee Loan",
//                   "Interest Rate: up to 25.75%",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 3,000,000 pounds"
//                       "Funding type: Bankers"),
//               _buildLoanDetail(
//                   "Travel loan ",
//                   "Interest Rate: up to 20.75%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees:by salary transfer "
//                       "Loan amount: up to 350,000 pounds"
//                       "Funding type: Tourism and travel"),
//               _buildLoanDetail(
//                   "Solar energy loan ",
//                   "Interest Rate: Up to 18%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: By salary transfer  "
//                       "Loan amount: 5000 to 350,000 pounds"
//                       "Funding type:Solar energy"),
//               _buildLoanDetail(
//                   "Personal loan without salary transfer  ",
//                   "Interest Rate: 27% to 36%",
//                   "Loan Duration: Up to 3 years"
//                       "Guarantees: Without conversion "
//                       "Loan amount: 5000 to 8,000,000 pounds"
//                       "Funding type:Employees"),
//               _buildLoanDetail(
//                   "Employees loan",
//                   "Interest Rate: 20.75% to 22.25%",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees:by salary transfer"
//                       "Loan amount: 5000 to 3,000,000 pounds"
//                       "Funding type: Employees"),
//               _buildLoanDetail(
//                   "Car loan",
//                   "Program type: The car is private"
//                       "Car type: New "
//                       "Interest Rate:22% to 22.75%",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees: Without conversion "
//                       "Financing value:Up to 8,000,000 pounds "
//                       "Down payment: 0%"),
//               _buildLoanDetail(
//                   "Personal loan to finance the car ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 22% to 22.75%",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees:By salary transfer  "
//                       "Financing value:Up to 8,000,000 pounds   "
//                       "Down payment: 0%"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ArabAfricanBankScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(" Arab African Bank Loans"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildLoanDetail(
//                   "Employee loan ",
//                   "Interest Rate: 16% to 20%",
//                   "Loan Duration: 5 to 12 years"
//                       "Guarantees: by salary transfer "
//                       "Loan amount: up to 2,000,000 pounds"
//                       "Funding type: Employees"),
//               _buildLoanDetail(
//                   "Car loan ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 15% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: by salary transfer  "
//                       "Financing value: Up to 1,400,000 pounds "
//                       "Down payment: 50%"),
//               _buildLoanDetail(
//                   "Car loan ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 17% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: by salary transfer "
//                       "Financing value: Up to 1,400,000 pounds "
//                       "Down payment: 30%"),
//               _buildLoanDetail(
//                   "Used car loan",
//                   "Program type: The car is private"
//                       "Car type: Used"
//                       "Interest Rate: 21.75% ",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: Without conversion "
//                       "Financing value:Up to 70% of the car's value"
//                       "Down payment: 30%"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // -------------------- Qatar National Bank Loan Details --------------------

// class QatarNationalBankScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Qatar National Bank Loans"),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildLoanDetail(
//                   "Oil Sector Workers Loan ",
//                   "Interest Rate: Up to 22.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: By salary transfer "
//                       "Loan amount: 15,000 pounds"
//                       "Funding type: Nothing "),
//               _buildLoanDetail(
//                   "Commercial unit lease transfer loan",
//                   "Interest Rate: 30% to 31% ",
//                   "Loan Duration: Up to 8 years"
//                       "Guarantees: Savings pot"
//                       "Loan amount: 100,000 to 5,000,000 pounds"
//                       "Funding type:Secured Loans"),
//               _buildLoanDetail(
//                   "Doctors loan",
//                   "Interest Rate: 31.5% ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount: up to 1,200,000 pounds"
//                       "Funding type:Doctors "),
//               _buildLoanDetail(
//                   "Solar energy loan",
//                   "Interest Rate:24.5% to 25 %  ",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees: By salary transfer"
//                       "Loan amount: 100,000 to 400,000 pounds"
//                       "Funding type: Solar energy"),
//               _buildLoanDetail(
//                   "Freelance Loans",
//                   "Interest Rate: 27.25%  ",
//                   "Loan Duration: up to 5 years"
//                       "Guarantees: Without conversion"
//                       "Loan amount:up to 100,000 "
//                       "Funding type: Free professions"),
//               _buildLoanDetail(
//                   "Durable Goods Loan for Employee ",
//                   "Interest Rate: 24.5% ",
//                   "Loan Duration: up to 5 years"
//                       "Guarantees: By salary transfer"
//                       "Loan amount: 5000 to 150,000 pounds"
//                       "Funding type: durable goods"),
//               _buildLoanDetail(
//                   "Express loan",
//                   "Interest Rate:26.5%",
//                   "Loan Duration: Up to 4 years"
//                       "Guarantees: WBy salary transfer"
//                       "Loan amount: 5,000 to 100,000 pounds"
//                       "Funding type: Employees"),
//               _buildLoanDetail(
//                   "Personal loan secured by a savings account ",
//                   "Interest Rate:3.5% Above return",
//                   "Loan Duration: Up to 10 years"
//                       "Guarantees:Savings pot "
//                       "Loan amount: Up to 90% of the saving account value"
//                       "Funding type: Secured loans"),
//               _buildLoanDetail(
//                   "Personal loan secured by salary transfer ",
//                   "Interest Rate: 25.5%",
//                   "Loan Duration: 5 to 7 years"
//                       "Guarantees: By salary transfer  "
//                       "Loan amount: Up to 1,000,000 pounds"
//                       "Funding type: Employee"),
//               _buildLoanDetail(
//                   "Car loan for self-employment",
//                   "Program type: The car is private"
//                       "Car type: New "
//                       "Interest Rate:34%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: Without conversion "
//                       "Financing value:up to 750,000 pounds "
//                       "Down payment: 0%"),
//               _buildLoanDetail(
//                   "Used car loan for employees ",
//                   "Program type: The car is private"
//                       "Car type: Used"
//                       "Interest Rate: 23.75%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees:By salary transfer  "
//                       "Financing value:up to 750,000 pounds   "
//                       "Down payment: 25%"),
//               _buildLoanDetail(
//                   "Car loan for employees ",
//                   "Program type: The car is private"
//                       "Car type: New"
//                       "Interest Rate: 33%",
//                   "Loan Duration: Up to 7 years"
//                       "Guarantees:By salary transfer  "
//                       "Financing value:up to 1,000,000 pounds   "
//                       "Down payment: 0%"),
//               _buildLoanDetail(
//                   "Used car loan for employees ",
//                   "Program type: The car is private"
//                       "Car type: Used"
//                       "Interest Rate: 24.5%",
//                   "Loan Duration: Up to 5 years"
//                       "Guarantees: Without conversion"
//                       "Financing value:up to 750,000 pounds   "
//                       "Down payment: 25%"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // -------------------- AppBar & Buttons (Reusable) --------------------

// PreferredSizeWidget _buildAppBar(String title) {
//   return AppBar(
//     title: Text(title, style: const TextStyle(color: Colors.white)),
//     backgroundColor: Colors.green,
//     centerTitle: true,
//   );
// }

// Widget _buildHomeButton(
//     IconData icon, String text, BuildContext context, Widget page) {
//   return SizedBox(
//     width: double.infinity,
//     height: 60,
//     child: ElevatedButton.icon(
//       icon: Icon(icon, size: 30),
//       label: Text(text, style: const TextStyle(fontSize: 20)),
//       style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.green, foregroundColor: Colors.white),
//       onPressed: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => page));
//       },
//     ),
//   );
// }

// Widget _buildBankButton(String bankName,
//     [BuildContext? context, Widget? page]) {
//   return SizedBox(
//     width: double.infinity,
//     height: 60,
//     child: ElevatedButton(
//       child: Text(bankName, style: const TextStyle(fontSize: 18)),
//       style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.green, foregroundColor: Colors.white),
//       onPressed: () {
//         if (context != null && page != null) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => page!));
//         }
//       },
//     ),
//   );
// }

// Widget _buildLoanDetail(String title, String interest, String duration) {
//   return Card(
//     margin: const EdgeInsets.symmetric(vertical: 8),
//     child: Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 5),
//           Text(interest,
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//           Text(duration,
//               style: const TextStyle(fontSize: 16, color: Colors.black54)),
//         ],
//       ),
//     ),
//   );
// }

// // -------------------- About Us --------------------

// class AboutUsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("About Us"),
//       body: const const const const const const const const const const Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: const const const const const const const const const const Center(
//           child: const const const const const const const const const const Text(
//             "We are a team of students from Future University in Egypt.\n"
//             "Our mission is to provide smart financial consulting through our app.",
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // -------------------- Profile --------------------

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar("Profile"),
//       body: const Center(
//         child: Text("User Profile Page", style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }

// // -------------------- Placeholder Pages --------------------

// class ContactUsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: _buildAppBar("Contact Us"));
//   }
// }
