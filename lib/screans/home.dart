import 'package:flutter/material.dart';
import 'package:mahmoud/componets/homeItem.dart';
import 'package:mahmoud/screans/donors/Donor_Screen.dart';
import 'package:mahmoud/screans/clinic/clinic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahmoud/screans/hospital/hospital_screen.dart';
import 'package:mahmoud/screans/lab/lab_search.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var collection = FirebaseFirestore.instance.collection('UsersDonors');
  late List<Map<String, dynamic>> items;
  bool isLoaded = false;
  _displayData() async {
    List<Map<String, dynamic>> tempList = [];
    var data = await collection.get();
    data.docs.forEach((element) {
      tempList.add(element.data());
    });

    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 120.0, right: 50.0),
          child: Text(
            ' Welcome ',
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: AutofillHints.countryName,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 30.0, top: 90.0, right: 30.0, bottom: 0.0),
            child: Row(
              children: [
                HomeItem(
                  text: ('Donors'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonorScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                HomeItem(
                  text: ('Hospitals'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SearchScreen();
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Divider(
          indent: 20.0,
          endIndent: 20.0,
          thickness: 2.0,
          color: Colors.grey[300],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              top: 20.0,
              right: 30.0,
              bottom: 60.0,
            ),
            child: Row(
              children: [
                HomeItem(
                  text: ('Analysis\n   Labs'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return lab_search();
                      }),
                    );
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                HomeItem(
                  text: ('Clinics'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return clinic();
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
