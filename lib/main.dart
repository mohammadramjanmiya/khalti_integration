import 'package:flutter/material.dart';
import 'package:flutter_khalti_integration/home.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey:
            '4b89ec8f746b4d8ab1fea0e610d2004e', // Replace with your Live public key
        enabledDebugging: false, // Set to false for production
        builder: (context, navKey) {
          return MaterialApp(
            title: 'Flutter Khalti Integration',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: const Home(),
            navigatorKey: navKey,
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
          );
        });
  }
}
