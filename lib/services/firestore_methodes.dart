import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../services/storage_methodes.dart';
import 'package:uuid/uuid.dart';
import '../models/lec.dart';

class FirestoreMethodes {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Methode to send the meaasge to the email of the lecturerq
  Future<void> sendMessageToFirestore(
      {required String lecturerMail,
      required String messageContent,
      required String senderEmail}) async {
    try {
      // Get the current user's email (sender's email)
      String senderEmail = FirebaseAuth.instance.currentUser?.email ?? '';

      // Create a reference to the "messages" collection in Firestore
      CollectionReference messagesCollection =
          FirebaseFirestore.instance.collection('messages');

      // Add a new document to the "messages" collection
      await messagesCollection.add({
        'lecturerName': lecturerMail,
        'messageContent': messageContent,
        'senderEmail': senderEmail,
        'timestamp': FieldValue
            .serverTimestamp(), // Add a timestamp for sorting if needed
      });

      print('Message sent successfully to Firestore!');
    } catch (error) {
      print('Error sending message to Firestore: $error');
    }
  }
}
