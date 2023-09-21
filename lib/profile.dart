import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  final String username;

  ProfilePage({required this.username, Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> userProfile = {};

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.10.10.139:5000/profile/${widget.username}'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          userProfile = data;
        });
      } else {
        // Handle error when user profile data cannot be fetched
        print('Failed to fetch user profile data');
      }
    } catch (e) {
      // Handle network or other exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${userProfile['name']}'),
            Text('Family: ${userProfile['family']}'),
            Text('Email: ${userProfile['email']}'),
            // Add more fields as needed
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement profile editing logic
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
