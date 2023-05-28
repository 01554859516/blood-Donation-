// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataFromFirestoreDonors extends StatelessWidget {
  final String documentId;
  final String? fullname;
  final String? phonenumber;
  final String? address;
  final String? bloodgroup;
  final String? age;
  final String? gender;
  final double fontSize;
  final double fontSize1;
  Widget icon;
  final String? name1;
  final String? name2;
  final double width;

  GetDataFromFirestoreDonors({
    super.key,
    required this.documentId,
    this.fullname,
    this.phonenumber,
    this.address,
    this.bloodgroup,
    this.age,
    this.gender,
    this.name2,
    required this.fontSize,
    required this.fontSize1,
    required this.icon,
    this.name1,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('UsersDonors');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
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
          return Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Text(
                    "${name1}",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: width,
                    // color: Colors.blue,
                    child: Text(
                      "${data[name2]}",
                      style: TextStyle(fontSize: fontSize1),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}

///////////////////////////////////////////////////////

class GetDataFromFirestoreHospitals extends StatelessWidget {
  final String documentId;
  final String? fullname;
  final String? phonenumber;
  final String? address;
  final String? bloodgroup;
  final String? age;
  final String? gender;
  final double fontSize;
  final double fontSize1;
  Widget icon;
  final String? name1;
  final String? name2;
  final double width;

  GetDataFromFirestoreHospitals({
    super.key,
    required this.documentId,
    this.fullname,
    this.phonenumber,
    this.address,
    this.bloodgroup,
    this.age,
    this.gender,
    this.name2,
    required this.fontSize,
    required this.fontSize1,
    required this.icon,
    this.name1,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('UserHospitals');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
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
          return Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Text(
                    "${name1}",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: width,
                    // color: Colors.blue,
                    child: Text(
                      "${data[name2]}",
                      style: TextStyle(fontSize: fontSize1),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}

//////////////////////////////////////////////////////

class GetDataFromFirestoreLap extends StatelessWidget {
  final String documentId;
  final String? fullname;
  final String? phonenumber;
  final String? address;
  final String? bloodgroup;
  final String? age;
  final String? gender;
  final double fontSize;
  final double fontSize1;
  Widget icon;
  final String? name1;
  final String? name2;
  final double width;

  GetDataFromFirestoreLap({
    super.key,
    required this.documentId,
    this.fullname,
    this.phonenumber,
    this.address,
    this.bloodgroup,
    this.age,
    this.gender,
    this.name2,
    required this.fontSize,
    required this.fontSize1,
    required this.icon,
    this.name1,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('AnalysisLabs');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
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
          return Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Text(
                    "${name1}",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: width,
                    // color: Colors.blue,
                    child: Text(
                      "${data[name2]}",
                      style: TextStyle(fontSize: fontSize1),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}

/////////////////////////////////////////////////////

class GetDataFromFirestoreClincs extends StatelessWidget {
  final String documentId;
  final String? fullname;
  final String? phonenumber;
  final String? address;
  final String? bloodgroup;
  final String? age;
  final String? gender;
  final double fontSize;
  final double fontSize1;
  Widget icon;
  final String? name1;
  final String? name2;
  final double width;

  GetDataFromFirestoreClincs({
    super.key,
    required this.documentId,
    this.fullname,
    this.phonenumber,
    this.address,
    this.bloodgroup,
    this.age,
    this.gender,
    this.name2,
    required this.fontSize,
    required this.fontSize1,
    required this.icon,
    this.name1,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('ClinicsUser');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
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
          return Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Text(
                    "${name1}",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: width,
                    // color: Colors.blue,
                    child: Text(
                      "${data[name2]}",
                      style: TextStyle(fontSize: fontSize1),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}
