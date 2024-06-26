import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserDetails extends StatelessWidget {
  final String documentId;
  const GetUserDetails({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection("demouser");

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // ignore: prefer_interpolation_to_compose_strings
          return Text("${data['first name']}" ' ' +
              "${data['last name']}" +
              ' ' +
              "${data['age']}" +
              " years old");
        }
        return Text("Loading");
      },
    );
  }
}
