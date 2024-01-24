import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anithapp/screens/login_screen.dart';
import 'package:anithapp/services/auth_logic.dart';
import 'package:anithapp/services/firestore_methodes.dart';
import 'package:anithapp/utils/colors.dart';
import 'package:anithapp/utils/util_functions.dart';
import '../widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Search For Lectures",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(),
    );
  }
}
