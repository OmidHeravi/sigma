import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'profile.dart';
import 'signup.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigma App',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue, // Change to your desired primary color
        ),
        scaffoldBackgroundColor: Colors.grey[900], // Dark background color
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/settings': (context) => SettingsPage(),
        '/profile': (context) => ProfilePage(
              username: 'Username', // Replace with actual username
            ),
      },
    );
  }
}
