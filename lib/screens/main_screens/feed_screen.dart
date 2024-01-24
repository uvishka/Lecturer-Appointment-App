import 'dart:ffi';

import 'package:anithapp/screens/lec_screens/civil.dart';
import 'package:anithapp/screens/lec_screens/computer.dart';
import 'package:anithapp/screens/lec_screens/elec.dart';
import 'package:anithapp/screens/lec_screens/is.dart';
import 'package:anithapp/screens/lec_screens/mechanical.dart';
import 'package:anithapp/screens/lec_screens/merine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anithapp/utils/colors.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        title: Text(
          "Please Fill The Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.network(
              'http://innotal.unwe.bg/ufiles/partners/University%20of%20Ruhuna-%20Sri%20Lanka.jpg',
              height: 150,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Sure, I've updated your code and added a few widgets and buttons to enhance the profile page. I've added an Avatar widget, a RaisedButton for editing profile details, and a FlatButton for logging out. Additionally, I've imported the necessary dependencies and added a placeholder UserModel class for the user's information.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 82, 81, 81),
              ),
            ),
          ),
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

          //selecct faculty
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  //go to the merine lec data
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MechanicalLecData(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 0, 163),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "MECHANICAL",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ElecLecData(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 0, 163),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "ELECTRICAL",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComputeLecData(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 0, 163),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "COMPUTER",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CivilLecData(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 0, 163),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "CIIVIL",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IsLecData(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 0, 163),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "IS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MerineLecData(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 0, 163),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "MARIEN ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
