import 'package:flutter/material.dart';
import 'package:mahmoud/screans/home.dart';
import 'package:mahmoud/screans/hospital/hospital_screen.dart';
import 'package:mahmoud/screans/lab/lab_search.dart';

class lab_profile extends StatefulWidget {
  lab_profile({super.key, required this.document});
  var document;
  @override
  State<lab_profile> createState() => _lab_profileState();
}

class _lab_profileState extends State<lab_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 50, right: 100, bottom: 10),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    child: Icon(Icons.arrow_back))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 100.0, top: 10, right: 100, bottom: 10),
            child: Text(
              'Labs Analysis',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 90.0, top: 15, right: 90, bottom: 20),
            child: Container(
              height: 180,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${widget.document["imgLink"]}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
                color: Color(
                  0xffE4F6E3,
                ).withOpacity(.2),
                border: Border.all(color: Colors.blue),
              ),
            ),
          ),
          Text(
            '${widget.document["fullname"]}',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.local_phone_sharp,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Mobile :                   ${widget.document["phonenumber"]}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Location :                ${widget.document["address"]}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  height: 35,
                  width: 28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/786/786407.png'),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Map',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 220,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/2958/2958783.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
