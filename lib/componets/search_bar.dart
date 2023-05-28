import 'package:flutter/material.dart';

import 'package:mahmoud/screans/lab/lab_profile.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 40.0,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(
            0xffE4F6E3,
          ).withOpacity(.2),
          border: Border.all(color: Color(0xff519FE8), width: 2),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 18.0, bottom: 5),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'search',
                hintStyle: TextStyle(
                  height: .1,
                  fontSize: 18,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Color(0xff519FE8),
                ),
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none),
          ),
        ),
      ),
    );
  }
}

class Search_V extends StatelessWidget {
  const Search_V({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 12, right: 15),
      child: Container(
        height: 80,
        child: InkWell(
          // onTap: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => lab_profile(document: ,)));
          // },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 60,
                  width: 95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://media.istockphoto.com/id/1147921735/photo/background-image-clean-counter-at-front-of-elevators-in-building.jpg?s=170667a&w=0&k=20&c=wDV8k0vkq0m0v3cwF7L0E8bLhl4C_Qj-u3we2P2ZDG0='),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    color: Color(
                      0xffE4F6E3,
                    ).withOpacity(.2),
                    border: Border.all(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Alexander Gray',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        'Egypt , Fayoum',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(
              0xffE4F6E3,
            ).withOpacity(.25),
            border: Border.all(color: Colors.blue)),
      ),
    );
  }
}
