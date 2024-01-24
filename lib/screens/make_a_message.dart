import 'package:anithapp/screens/main_screens/feed_screen.dart';
import 'package:anithapp/services/firestore_methodes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendMessagePage extends StatefulWidget {
  final String name;
  final String email;
  SendMessagePage({super.key, required this.name, required this.email});

  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final FirestoreMethodes _firestore = FirestoreMethodes();

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        title: Text(
          'Send Message',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              widget.email,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 16.0),
            // Message Box
            TextField(
              controller: messageController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
                height:
                    16.0), // Add some space between the text field and the button
            // Send Button
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
              onPressed: () async {
                // Add your logic to send the message
                String message = messageController.text;
                //get the email of current user
                String senderEmail =
                    FirebaseAuth.instance.currentUser?.email ?? '';
                await _firestore.sendMessageToFirestore(
                    lecturerMail: widget.email,
                    messageContent: message,
                    senderEmail: senderEmail);

                //go to the home page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedScreen(),
                  ),
                );
                print('Sending message: $message');
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
