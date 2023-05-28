import 'package:flutter/material.dart';

import 'package:mahmoud/screans/Home_Screen.dart';

class search_page extends StatelessWidget {
  const search_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, HomeScreen());
                    },
                    child: Container(
                        child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  TextField(
                    decoration: InputDecoration(
                        // fillColor: Color.fromARGB(255, 244, 245, 246),
                        filled: true,
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.search),
                        ),
                        hintText: ' search ',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // searchitem(),
              // SizedBox(
              //   height: 15,
              // ),
              // searchitem(),
              // SizedBox(
              //   height: 15,
              // ),
              // searchitem(),
            ],
          ),
        ),
      ),
    );
  }
}
