import 'package:anithapp/screens/main_screens/lec_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CivilLecData extends StatefulWidget {
  const CivilLecData({super.key});

  @override
  State<CivilLecData> createState() => _CivilLecDataState();
}

class _CivilLecDataState extends State<CivilLecData> {
  late Stream<QuerySnapshot> lecturerStream;

  @override
  void initState() {
    super.initState();

    // Initialize Firestore and set the collection name
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference lecturerCollection = firestore.collection('lecturer');

    // Fetch data where the department is DEIE
    lecturerStream =
        lecturerCollection.where('department', isEqualTo: 'DCEE').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        title: Text(
          "Civil Lec Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: lecturerStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          // If data is available, build the list of lecturers using LecCard
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              // Use the LecCard widget to display information
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LecturerData(
                        name: data['name'],
                        description: data['decription'],
                        department: data['department'],
                        email: data['email'],
                        mobile: data['mobile'],
                        profileImage: data['profile_image'],
                        role: data['role'],
                        roomNo: data['room_no'],
                        specialist: data['specialist'],
                        subjects: data['subjects'].cast<String>(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Card(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 219, 218, 218),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
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
                                  data['profile_image'],
                                  height: 50,
                                ),
                              ),
                              Text(
                                data['name'],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data['specialist'],
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey[700]),
                              ),
                              Text(
                                data['role'],
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey[900]),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
