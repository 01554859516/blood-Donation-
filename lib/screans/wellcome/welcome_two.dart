import 'package:flutter/material.dart';
import 'package:mahmoud/screans/wellcome/welcime_three.dart';
import 'package:mahmoud/screans/wellcome/welcome_one.dart';

class Wellcometwo extends StatelessWidget {
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
                return WellcomeOne();
              }),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(
              "assets/welcome two.jpg",
              // width: 200,
              // height: 100,
            ),
          ),
          Text(
            "Share Your case !",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              // fontStyle: FontStyle.italic,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Add the case of a patient who needs blood",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.0,
                letterSpacing: 1,
              ),
            ),
          ),
          Text(
            "and also participated in the request for",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.0,
              letterSpacing: 1,
            ),
          ),
          Text(
            "donation",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.0,
              letterSpacing: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) {
                    return WellcomeThree();
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
                  "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
