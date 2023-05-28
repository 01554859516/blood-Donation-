import 'package:flutter/material.dart';
import 'package:mahmoud/screans/donors/Donor_Screen.dart';

class DonorProfile extends StatefulWidget {
  var document;
  DonorProfile({required this.document});
  @override
  State<DonorProfile> createState() => _DonorProfileState();
}

class _DonorProfileState extends State<DonorProfile> {
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
                              builder: (context) => DonorScreen()));
                    },
                    child: Icon(Icons.arrow_back))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 100.0, top: 20, right: 100, bottom: 10),
            child: Text(
              'Donor',
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
              height: 195,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${widget.document["imgLink"]}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(100),
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
                'Mobile:                 ${widget.document["phonenumber"]}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Text(
                'Location :                       ${widget.document["address"]}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.bloodtype,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Blood Group :                     ${widget.document["bloodgroup"]}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Gender :                            ${widget.document["gender"]}  ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.people_alt_sharp,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Age :                                     ${widget.document["age"]}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
