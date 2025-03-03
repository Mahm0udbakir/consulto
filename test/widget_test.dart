// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:consulto/main.dart';

// void main() {
//   late MockAuthRepository mockAuthRepository;

//   setUp(
//     () {
//       mockAuthRepository = MockAuthRepository(); // ✅ Create mock object
//     },
//   );

//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app with the mock repository
//     await tester.pumpWidget(MyApp(authRepository: mockAuthRepository));

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump(); // ✅ Rebuild UI after interaction

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
