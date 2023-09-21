import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String username;
  final double totalScore; // Define 'totalScore' as a named parameter

  HomePage({required this.username, required this.totalScore, Key? key})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double totalScore = 0.0; // Initialize total score

  // Fetch user data from the server
  void fetchUserData() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.10.10.139:5000/user-data'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          totalScore = data['totalScore'];
        });
      } else {
        // Handle error when user data cannot be fetched
        print('Failed to fetch user data');
      }
    } catch (e) {
      // Handle network or other exceptions
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data when the page is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/settings'); // Navigate to settings page
            },
          ),
        ],
      ),
      drawer: Drawer(
          // ... (your existing code)
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ... (your existing code)
            Text(
              'Welcome, ${widget.username}!', // Display the actual username
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Total Score: $totalScore', // Display the actual total score
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
