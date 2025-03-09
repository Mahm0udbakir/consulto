import 'package:consulto/features/auth%20copy/presentation/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SmartConsultApp());
}

class SmartConsultApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Consult',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

// //loading time
//   Duration get loadingTime => const Duration(milliseconds: 2000);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FlutterLogin(
//         logo: const AssetImage('assets/logo.jpg'),
//         theme: LoginTheme(
//           pageColorLight: Colors.green, // ✅ Background color
//           pageColorDark: Colors.green, // ✅ For dark mode
//         ),
//         onSignup: _signupUser,
//         onRecoverPassword: _recoveryPassword,
//         onLogin: (LoginData data) async {
//           String? result = await _authUser(data);
//           if (result == null) {
//             Navigator.pushReplacement(
//               context,
//               PageRouteBuilder(
//                 transitionDuration: const Duration(milliseconds: 500),
//                 pageBuilder: (context, animation, secondaryAnimation) =>
//                     MainScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return SlideTransition(
//                     position: Tween<Offset>(
//                       begin: const Offset(1.0, 0.0), // Slide from right
//                       end: Offset.zero,
//                     ).animate(animation),
//                     child: child,
//                   );
//                 },
//               ),
//             );
//           }
//           return result;
//         },
//       ),
//     );
//   }
// }


// -------------------- Main Screen with Bottom Navigation --------------------

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Default page index

  final List<Widget> _pages = [
    HomeScreen(), // Home page
    const ProfileScreen(), // Profile page
    const AboutUsScreen(), // About Us page
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      // Logout logic (back to home)
      setState(() {
        _selectedIndex = 0;
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About Us"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
    );
  }
}


// -------------------- About Us Page --------------------

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

// -------------------- Profile Page --------------------

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(
        child: Text("User Profile Page", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}


