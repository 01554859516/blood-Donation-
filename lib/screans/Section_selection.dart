// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mahmoud/screans/clinic/clinic_login.dart';

import 'package:mahmoud/screans/donors/login_donor.dart';
import 'package:mahmoud/screans/hospital/hospital_login.dart';
import 'package:mahmoud/screans/lab/login_lab.dart';

class SectionSelection extends StatelessWidget {
  const SectionSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   title: const Text("Section Selection"),
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (_) {
      //           return WellcomeThree();
      //         }),
      //       );
      //     },
      //     icon: Icon(Icons.arrow_back_sharp),
      //   ),
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: 220,
                  // width: double.infinity,
                ),
                Stack(
                  children: [
                    Container(
                      height: 550,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: ElevatedButtontext(
                            text: 'Donors',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) {
                                  return loginDonor();
                                }),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: ElevatedButtontext(
                            text: 'Hospital',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) {
                                  return loginScreenHospital();
                                }),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: ElevatedButtontext(
                            text: 'AnalysisLabs',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) {
                                  return loginScreenLab();
                                }),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: ElevatedButtontext(
                            text: 'Clinics',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) {
                                  return loginScreenClinic();
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ElevatedButtontext extends StatelessWidget {
  const ElevatedButtontext({
    super.key,
    this.onPressed,
    required this.text,
  });
  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Container(
        width: 340,
        alignment: Alignment.center,
        // padding: const EdgeInsets.only(left: 20, right: 20),
        height: 65,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              (Color.fromARGB(255, 53, 158, 245)),
              Color.fromARGB(255, 53, 158, 245)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xffEEEEEE),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
