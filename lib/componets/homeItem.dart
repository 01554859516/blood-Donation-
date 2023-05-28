import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeItem extends StatelessWidget {
  HomeItem({required this.text, required this.onTap});
  String text;

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      (text),
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MaterialButton(
                  height: 50,
                  onPressed: () {},
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'More',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe6eeff),
                  offset: Offset(0, 5),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            )),
      ),
    );
  }
}
