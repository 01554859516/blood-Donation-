import 'package:flutter/material.dart';

// ignore: must_be_immutable
class steps extends StatelessWidget {
  steps({this.text, this.icon, this.text1, this.text2});
  String? text;
  String? text1;
  String? text2;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 15,
      ),
      margin: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
      height: 125,
      width: 270,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0xffe6eeff),
            offset: Offset(0, 7),
            blurRadius: 13.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Icon(icon!),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text!,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    width: 170,
                    child: Text(
                      text1!,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            child: Text(
              text2!,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
