// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ImgUserDonor extends StatefulWidget {
  ImgUserDonor({
    super.key,
  });

  @override
  State<ImgUserDonor> createState() => _ImgUserDonor();
}

class _ImgUserDonor extends State<ImgUserDonor> {
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users =
      FirebaseFirestore.instance.collection('UsersDonors');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(credential!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return CircleAvatar(
            backgroundColor: Color.fromARGB(255, 225, 225, 225),
            radius: 64,
            backgroundImage: NetworkImage("${data["imgLink"]}"),
          );
        }

        return Text("loading");
      },
    );
  }
}

class ImgUserClinic extends StatefulWidget {
  ImgUserClinic({
    super.key,
  });

  @override
  State<ImgUserClinic> createState() => _ImgUserClinic();
}

class _ImgUserClinic extends State<ImgUserClinic> {
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users =
      FirebaseFirestore.instance.collection('ClinicsUser');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(credential!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return CircleAvatar(
            backgroundColor: Color.fromARGB(255, 225, 225, 225),
            radius: 64,
            backgroundImage: NetworkImage("${data["imgLink"]}"),
          );
        }

        return Text("loading");
      },
    );
  }
}
