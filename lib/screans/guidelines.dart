import 'package:flutter/material.dart';
import 'package:mahmoud/componets/guidelinesitem.dart';
import 'package:mahmoud/componets/steps.dart';

class guidelines extends StatelessWidget {
  const guidelines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Text(
          'guidelines for Donation',
          style: TextStyle(color: Color(0xff0F1A29)),
        )),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Text(
            'Chapter 1',
            style: TextStyle(color: Colors.amber),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'General Guidelines for blood Donation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 23,
          ),
          Container(
            height: 320,
            width: 20,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe6eeff),
                  offset: Offset(0, 9),
                  blurRadius: 17,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                guidelinesItem(
                  text: ('Be in good general health and feeling well.\n'),
                ),
                guidelinesItem(
                  text:
                      ('Be at least 17 years old in most states (16 years old with parental consent in some states\n'),
                ),
                guidelinesItem(
                  text:
                      ('Weigh at least 110 pounds. Additional weight requirements apply for donors 18 years old and younger and all high school donors.\n'),
                ),
                guidelinesItem(
                  text: ('Have not donated blood in the last 56 days.\n\n'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                steps(
                  icon: Icons.local_drink,
                  text: ('step 1'),
                  text1: ('Drink Extra Liquids'),
                  text2: ('Drink plenty of water before the donation.'),
                ),
                const SizedBox(
                  width: 20,
                ),
                steps(
                  icon: Icons.restaurant,
                  text: ('step 2'),
                  text1: ('Enough Sleep'),
                  text2:
                      ('Get plenty of sleep the night before you plan to donate.'),
                ),
                steps(
                  icon: Icons.airline_seat_flat,
                  text: ('step 3'),
                  text1: ('Eat healthy'),
                  text2: ('Eat a healthy meal before your donation.'),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              'Whatever your reason, the need for blood is constant and you will feel good knowing your donation can help save up to 3 lives.\n\nBlood types are determined by the presence or absence of certain antigens – substances that can trigger an immune response if they are foreign to the body.  Since some antigens can trigger a patient\'s immune system to attack the transfused blood, safe blood transfusions depend on careful blood typing and cross-matching. Do you know what blood type is safe for you if you need a transfusion?',
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(
            thickness: .5,
            color: Colors.grey,
            indent: 50,
            endIndent: 50,
            height: 35,
          ),
          Text(
            'Chapter 2',
            style: TextStyle(color: Colors.amber),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'General benefits of blood donation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 23,
          ),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 800,
            ),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe6eeff),
                  offset: Offset(0, 9),
                  blurRadius: 17,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  child: Text(
                    'While blood donors don\'t expect to be rewarded for the act of kindness, rolling up your sleeve comes with some surprising health benefits. Here\'s what you get when you give blood:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      height: 1.2857142857,
                      color: Color(0xff0e1a29),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                guidelinesItem(
                  text:
                      ('A free health screening: \nBefore you are allowed to donate, your vital signs will be checked to make sure you are fit enough for the procedure. This exam might turn up a condition that needs medical attention, such as high blood pressure or a heart arrhythmia . In addition, you’ll be screened for infectious diseases you may be unaware of.\nThe health screening will also reveal if you have a rare blood type. This information can be useful if you ever face surgery or another medical situation in which a transfusion may be required. Plus, you’ll have the satisfaction of knowing your donation is particularly needed.\n'),
                ),
                guidelinesItem(
                  text:
                      ('A healthier heart and vascular system:\nRegular blood donation is linked to lower blood pressure and a lower risk for heart attacks.\n'),
                ),
                guidelinesItem(
                  text:
                      ('A happier, longer life:\nOne blood donation can save up to three lives, according to DeSimone. People usually donate because it feels good to help others, and altruism and volunteering have been linked to positive health outcomes, including a lower risk for depression and greater longevity.\n\n'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
