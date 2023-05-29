// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahmoud/shared/data_from_firestore.dart';
import 'package:mahmoud/shared/user_image.dart';

class profile extends StatefulWidget {
  profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final credential = FirebaseAuth.instance.currentUser;
  File? imgPath;
  uploadImageScreen() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp))),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(125, 78, 91, 110)),
                child: Stack(
                  children: [
                    imgPath == null
                        ? ImgUserDonors()
                        : ClipOval(
                            child: Image.file(
                              imgPath!,
                              width: 145,
                              height: 145,
                              fit: BoxFit.cover,
                            ),
                          ),
                    Positioned(
                      left: 92,
                      bottom: -10,
                      child: IconButton(
                        onPressed: () {
                          uploadImageScreen();
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Color.fromARGB(255, 94, 115, 128),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(52, 0, 0, 0),
                child: GetDataFromFirestoreDonors(
                  fontSize1: 28,
                  fontSize: 0,
                  documentId: credential!.uid,
                  name2: "fullname",
                  name1: "",
                  icon: Icon(Icons.person_outlined),
                  width: 160,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text_proflie(
                Icon: Icon(Icons.email),
                text: 'Email: ${credential!.email}',
              ),
              SizedBox(
                height: 25,
              ),
              GetDataFromFirestoreDonors(
                fontSize1: 18,
                fontSize: 18,
                documentId: credential!.uid,
                name2: "phonenumber",
                name1: "Mobile :",
                icon: Icon(Icons.phone),
                width: 230,
              ),
              // Text_proflie(
              //   Icon: Icon(Icons.phone),
              //   text: 'Mobile : ',
              //   text2: '01554859516',
              // ),
              SizedBox(
                height: 25,
              ),
              GetDataFromFirestoreDonors(
                fontSize1: 18,
                fontSize: 18,
                documentId: credential!.uid,
                name2: "address",
                name1: "Location :",
                icon: Icon(Icons.location_on_rounded),
                width: 220,
              ),
              // Text_proflie(
              //   Icon: Icon(Icons.location_on_rounded),
              //   text: 'Location',
              //   text2: '        GIZA',
              // ),
              SizedBox(
                height: 25,
              ),
              GetDataFromFirestoreDonors(
                fontSize1: 18,
                fontSize: 18,
                documentId: credential!.uid,
                name2: "bloodgroup",
                name1: "Blood Group :",
                icon: Icon(Icons.bloodtype),
                width: 170,
              ),
              // Text_proflie(
              //   Icon: Icon(Icons.bloodtype),
              //   text: 'Blood Group',
              //   text2: '    B+',
              // ),

              // Text_proflie(
              //   Icon: Icon(Icons.person),
              //   text: 'Grender           ',
              //   text2: 'male',
              // ),
              SizedBox(
                height: 25,
              ),
              GetDataFromFirestoreDonors(
                fontSize1: 18,
                fontSize: 18,
                documentId: credential!.uid,
                name2: "age",
                name1: "Age:  ",
                icon: Icon(Icons.person),
                width: 240,
              ),
              SizedBox(
                height: 25,
              ),
              GetDataFromFirestoreDonors(
                fontSize1: 18,
                fontSize: 18,
                documentId: credential!.uid,
                name2: "gender",
                name1: "Grender : ",
                icon: Icon(Icons.person),
                width: 220,
              ),
              // Text_proflie(
              //   Icon: Icon(Icons.person_3_rounded),
              //   text: 'Age',
              //   text2: '                   28',
              // ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          // await FirebaseAuth.instance.signOut();

                          await FirebaseAuth.instance.signOut();
                          // setState(() {});
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Splash(),
                          //   ),
                          // );
                        },
                        icon: Icon(Icons.arrow_back_sharp)),
                    Text(
                      "Sign Out",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Text_proflie extends StatelessWidget {
  Widget Icon;
  final String text;
  final String? text2;
  Text_proflie({
    Key? key,
    required this.Icon,
    required this.text,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon,
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
