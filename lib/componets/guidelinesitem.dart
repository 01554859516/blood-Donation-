import 'package:flutter/material.dart';

// ignore: must_be_immutable
class guidelinesItem extends StatelessWidget {
  guidelinesItem({super.key, this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 5),
            child: CircleAvatar(
              radius: 4,
            )),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 300,
          child: Text(
            (text!),
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
      ],
    );
  }
}
