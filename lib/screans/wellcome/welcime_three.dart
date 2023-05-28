import 'package:flutter/material.dart';
import 'package:mahmoud/screans/Section_selection.dart';

import 'package:mahmoud/screans/wellcome/welcome_two.dart';

class WellcomeThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 135, 225),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Skip",
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) {
                return Wellcometwo();
              }),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              "assets/welcome three.jpg",
              // width: 200,
              // height: 100,
            ),
          ),
          Text(
            "Hospital? Manage",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              // fontStyle: FontStyle.italic,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Donation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Donate to hospitals and blood banks in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.0,
                letterSpacing: 1,
              ),
            ),
          ),
          Text(
            "one step",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.0,
              letterSpacing: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) {
                    return SectionSelection();
                  }),
                );
              },
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
                height: 54,
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
                  "Get Start",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
