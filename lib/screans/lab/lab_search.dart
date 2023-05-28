import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahmoud/screans/lab/lab_profile.dart';

class lab_search extends StatefulWidget {
  lab_search({
    super.key,
  });

  @override
  State<lab_search> createState() => _lab_searchState();
}

var docs;

class _lab_searchState extends State<lab_search> {
  final _collection =
      FirebaseFirestore.instance.collection('AnalysisLabs').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: CircleAvatar(
                // maxRadius: 20,
                // minRadius: 20,
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1615109398623-88346a601842?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60"),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    width: 250,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 244, 245, 246),
                          filled: true,
                          contentPadding: EdgeInsets.only(left: 25),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.search),
                          ),
                          hintText: ' search ',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 0, right: 2),
                  //   child: Icon(
                  //     Icons.add_road_rounded,
                  //     size: 50,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: StreamBuilder(
        stream: _collection,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("conection errorn");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading...");
          }

          docs = snapshot.data!.docs;
          // return Text("${docs.length}");
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) {
                      return lab_profile(
                        document: docs[index],
                      );
                    }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xff6ae792),
                      child: Icon(Icons.person),
                    ),

                    title: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Text(
                            docs[index]['fullname'],
                            style: TextStyle(
                                fontSize: 20, color: Colors.blue..shade500),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Text(docs[index]['age']),
                        ],
                      ),
                    ),
                    // title: Text(docs[index]['fullname']),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        '${docs[index]["address"]}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // trailing: CircleAvatar(
                    //   backgroundColor: Colors.black54,
                    //   radius: 16,
                    //   child: Text(
                    //     '${docs[index]["bloodgroup"]}',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
