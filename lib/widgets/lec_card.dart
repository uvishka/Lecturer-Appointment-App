import 'package:flutter/material.dart';

class LecCard extends StatelessWidget {
  String name;
  String profile_image;
  String specialist;
  String role;
  LecCard({
    Key? key,
    required this.name,
    required this.profile_image,
    required this.specialist,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 219, 218, 218),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      profile_image,
                      height: 50,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    specialist,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    profile_image,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey[900]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
