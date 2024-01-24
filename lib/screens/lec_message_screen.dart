import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LecMessageScreen extends StatefulWidget {
  final String lecEmail;

  const LecMessageScreen({Key? key, required this.lecEmail}) : super(key: key);

  @override
  _LecMessageScreenState createState() => _LecMessageScreenState();
}

class _LecMessageScreenState extends State<LecMessageScreen> {
  late Stream<QuerySnapshot> messagesStream;

  @override
  void initState() {
    super.initState();
    // Initialize the stream to listen for changes in the "messages" collection
    messagesStream = FirebaseFirestore.instance
        .collection('messages')
        .where('lecturerName', isEqualTo: widget.lecEmail)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        title: Text(
          "Messages From Students",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: messagesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          List<DocumentSnapshot> messages = snapshot.data!.docs;

          if (messages.isEmpty) {
            return Center(
              child: Text(
                'No messages found for ${widget.lecEmail}',
                style: TextStyle(fontSize: 16.0),
              ),
            );
          }

          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              var message = messages[index].data() as Map<String, dynamic>;
              return Card(
                elevation: 3.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(
                    message['messageContent'] ?? '',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  subtitle: Text(
                    'From: ${message['senderEmail']}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  // You can add more details or styling as needed
                ),
              );
            },
          );
        },
      ),
    );
  }
}
