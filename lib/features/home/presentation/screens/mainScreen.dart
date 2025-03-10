import 'package:consulto/features/home/presentation/screens/aboutUsScreen.dart';
import 'package:consulto/features/home/presentation/screens/chatBotScreen.dart';
import 'package:consulto/features/home/presentation/screens/homeScreen.dart';
import 'package:consulto/features/home/presentation/screens/profileScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Default page index

  final List<Widget> _pages = [
    HomeScreen(), // Home page
    ChatBotScreen(), // Home page
    const ProfileScreen(), // Profile page
    const AboutUsScreen(), // About Us page
  ];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.grey, // ✅ White color for selected item
        unselectedItemColor: Colors.black54, // ✅ Dark gray for unselected items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Bot"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About Us"),
        ],
      ),
    );
  }
}
