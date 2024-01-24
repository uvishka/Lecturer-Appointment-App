import 'package:anithapp/services/auth_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anithapp/screens/profile_screen.dart';
import 'package:anithapp/utils/colors.dart';

class UserModel {}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // get the current user data
  String? username;
  String? email;

  @override
  void initState() {
    super.initState();
    // get the current user data
    User? currentUser = FirebaseAuth.instance.currentUser;
    username = currentUser?.displayName ?? "Guest";
    email = currentUser?.email ?? "guest@example.com";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        title: Text(
          "Profile Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 60,
                color: Color.fromARGB(255, 49, 0, 163),
              ),
            ),
            SizedBox(height: 20),
            Text(
              username!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              email!,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to profile editing screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => ProfileScreen(user: user)),
                // );
              },
              child: Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 49, 0, 163),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Color.fromARGB(255, 49, 0, 163),
                ),
              ),
            ),
            // faculties
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Please Select The Department",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 82, 81, 81),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
