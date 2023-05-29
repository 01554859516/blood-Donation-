import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mahmoud/screans/lab/login_lab.dart';
import 'package:path/path.dart' show basename;
import 'package:mahmoud/screans/login_screen.dart';
import 'package:mahmoud/shared/snakbar.dart';

// ignore: must_be_immutable
class RegisterScreenLab extends StatefulWidget {
  RegisterScreenLab({super.key});

  @override
  State<RegisterScreenLab> createState() => _RegisterScreenLabState();
}

class _RegisterScreenLabState extends State<RegisterScreenLab> {
  bool isLoading = false;
  bool isVisable = true;
  File? imgPath;
  String? imgName;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final fullnameController = TextEditingController();
  final ageController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String collectionname;

  uploadImageScreen(ImageSource select) async {
    final pickedImg = await ImagePicker().pickImage(source: select);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
          imgName = basename(pickedImg.path);
          int random = Random().nextInt(99999999);
          imgName = "$random$imgName";
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
    if (!mounted) return;
    Navigator.pop(context);
  }

  showmodel() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(22),
          color: Color.fromARGB(255, 252, 253, 255),
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await uploadImageScreen(ImageSource.camera);
                },
                child: Row(
                  children: [
                    Icon(Icons.camera),
                    Text("from camera"),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () async {
                  await uploadImageScreen(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    Icon(Icons.photo_outlined),
                    Text("from Gallery"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final storageRef = FirebaseStorage.instance.ref("AnalysisLabs/$imgName");
      await storageRef.putFile(imgPath!);
      String url = await storageRef.getDownloadURL();

      credential.user!.uid;

      CollectionReference users =
          FirebaseFirestore.instance.collection('AnalysisLabs');

      users
          .doc(credential.user!.uid)
          .set({
            'imgLink': url,
            'email': emailController.text,
            'password': passwordController.text,
            'fullname': fullnameController.text,
            'age': ageController.text,
            'bloodgroup': bloodGroupController.text,
            'phonenumber': phoneNumberController.text,
            'address': addressController.text,
            'gender': genderController.text
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnakBar(
          context,
          "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        showSnakBar(
          context,
          "The account already exists for that email",
        );
      } else {
        showSnakBar(context, "ERROR - please try again late");
      }
    } catch (e) {
      showSnakBar(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    addressController.dispose();
    genderController.dispose();
    ageController.dispose();
    bloodGroupController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign up to continue',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //////////////
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(125, 78, 91, 110)),
                    child: Stack(
                      children: [
                        imgPath == null
                            ? CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 225, 225, 225),
                                radius: 64,
                                backgroundImage:
                                    AssetImage("assets/avatar.png"),
                              )
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
                              // uploadImageScreen();
                              showmodel();
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
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisable ? true : false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password should be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: isVisable
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your full name';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your age';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Age',
                      prefixIcon: Icon(
                        Icons.view_agenda,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: bloodGroupController,
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your blood group';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Blood Group',
                      prefixIcon: Icon(
                        Icons.bloodtype,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your phone number';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your phone number';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Address',
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: genderController,
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your phone number';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            imgName != null &&
                            imgPath != null) {
                          await register();
                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginScreenLab(),
                            ),
                          );
                        } else {
                          showSnakBar(context, "errer");
                        }
                      },
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text('Sign Up',
                              style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginScreenLab(),
                            ),
                          );
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
