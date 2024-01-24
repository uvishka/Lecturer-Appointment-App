import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anithapp/screens/main_screens/feed_screen.dart';
import '../screens/main_screens/search_screen.dart';
import '../screens/profile_screen.dart';

List<Widget> homeScreenLayouts = [
  const FeedScreen(),
  const SearchScreen(),
  const Text("Favorite"),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
