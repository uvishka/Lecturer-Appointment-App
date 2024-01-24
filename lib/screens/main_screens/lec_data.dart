import 'package:anithapp/screens/make_a_message.dart';
import 'package:flutter/material.dart';

class LecturerData extends StatefulWidget {
  final String? name;
  final String? description;
  final String? department;
  final String? email;
  final String? mobile;
  final String? profileImage;
  final String? role;
  final String? roomNo;
  final String? specialist;
  final List<String?> subjects;

  LecturerData({
    super.key,
    required this.name,
    required this.description,
    required this.department,
    required this.email,
    required this.mobile,
    required this.profileImage,
    required this.role,
    required this.roomNo,
    required this.specialist,
    required this.subjects,
  });

  @override
  State<LecturerData> createState() => _LecturerDataState();
}

class _LecturerDataState extends State<LecturerData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        title: Text(
          widget.name ?? '', // Null check for name
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.profileImage ?? '', // Null check for profile image
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              widget.role ?? '', // Null check for role
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(widget.department ?? ''),
            Text(widget.description ?? ''),
            SizedBox(height: 16.0),
            Text('Contact Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Email: ${widget.email ?? ''}'), // Null check for email
            Text('Mobile: ${widget.mobile ?? ''}'), // Null check for mobile
            Text('Room No: ${widget.roomNo ?? ''}'), // Null check for roomNo
            SizedBox(height: 16.0),
            Text('Subjects',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (widget.subjects ?? [])
                  .map((subject) => Text('- $subject'))
                  .toList(), // Null check for subjects
            ),

            //button
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 49, 0, 163),
                ),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.white),
                ),
                foregroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                //go to make an appointment page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendMessagePage(
                      name: widget.name ?? '',
                      email: widget.email ?? '',
                    ),
                  ),
                );
              },
              child: Text('Make An Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
