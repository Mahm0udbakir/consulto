import 'package:consulto/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

//loading time
  // Duration get loadingTime => const Duration(milliseconds: 2000);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: FlutterLogin(
  //       logo: const AssetImage('assets/logo.jpg'),
  //       theme: LoginTheme(
  //         pageColorLight: Colors.green, // ✅ Background color
  //         pageColorDark: Colors.green, // ✅ For dark mode
  //       ),
  //       onSignup: _signupUser,
  //       onRecoverPassword: _recoveryPassword,
  //       onLogin: (LoginData data) async {
  //         String? result = await _authUser(data);
  //         if (result == null) {
  //           Navigator.pushReplacement(
  //             context,
  //             PageRouteBuilder(
  //               transitionDuration: const Duration(milliseconds: 500),
  //               pageBuilder: (context, animation, secondaryAnimation) =>
  //                   MainScreen(),
  //               transitionsBuilder:
  //                   (context, animation, secondaryAnimation, child) {
  //                 return SlideTransition(
  //                   position: Tween<Offset>(
  //                     begin: const Offset(1.0, 0.0), // Slide from right
  //                     end: Offset.zero,
  //                   ).animate(animation),
  //                   child: child,
  //                 );
  //               },
  //             ),
  //           );
  //         }
  //         return result;
  //       },
  //     ),
  //   );
  // }
}
