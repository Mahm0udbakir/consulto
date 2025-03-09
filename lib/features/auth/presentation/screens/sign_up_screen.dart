import 'package:consulto/features/auth/presentation/screens/sign_in_screen.dart';
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
      home: SignInScreen(),
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



