// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ImgUserDonors extends StatefulWidget {
  ImgUserDonors({
    super.key,
  });

  @override
  State<ImgUserDonors> createState() => _ImgUserDonors();
}

class _ImgUserDonors extends State<ImgUserDonors> {
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

///////////////////////////////
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

/////////////////////////////////

class ImgUserHospitals extends StatefulWidget {
  ImgUserHospitals({
    super.key,
  });

  @override
  State<ImgUserHospitals> createState() => _ImgUserHospitals();
}

class _ImgUserHospitals extends State<ImgUserHospitals> {
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users =
      FirebaseFirestore.instance.collection('Hospitals');
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

/////////////////////////////////

class ImgUserAnalysisLabs extends StatefulWidget {
  ImgUserAnalysisLabs({
    super.key,
  });

  @override
  State<ImgUserAnalysisLabs> createState() => _ImgUserAnalysisLabs();
}

class _ImgUserAnalysisLabs extends State<ImgUserAnalysisLabs> {
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users =
      FirebaseFirestore.instance.collection('ImgUserAnalysisLabs');
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
