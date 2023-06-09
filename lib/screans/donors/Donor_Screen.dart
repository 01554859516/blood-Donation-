import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahmoud/screans/donors/Donor_Pofile.dart';

class DonorScreen extends StatefulWidget {
  @override
  State<DonorScreen> createState() => _DonorScreenState();
}

var docs;

class _DonorScreenState extends State<DonorScreen> {
  final _collection =
      FirebaseFirestore.instance.collection('UsersDonors').snapshots();
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
              // child: CircleAvatar(
              //   // maxRadius: 20,
              //   // minRadius: 20,
              //   radius: 20,
              //   backgroundImage: NetworkImage(
              //       "https://imag-88346a601842?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60"),
              // ),
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
                      return DonorProfile(
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
                      backgroundImage: NetworkImage(docs[index]["imgLink"]),
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

                    trailing: CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 16,
                      child: Text(
                        '${docs[index]["bloodgroup"]}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
        
          
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 5.0, top: 30, right: 0, bottom: 5),
            //   child: Row(
            //     children: [
            //       InkWell(
            //           onTap: () {
            //             Navigator.pop(context,
            //                 MaterialPageRoute(builder: (context) => home()));
            //           },
            //           child: Icon(Icons.arrow_back))
            //     ],
            //   ),
            // ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 2, top: 0),
            //       child: Container(
            //         height: 50,
            //         width: 55,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: NetworkImage(
            //                   'https://images.unsplash.com/photo-1615109398623-88346a601842?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60'),
            //               fit: BoxFit.cover),
            //           borderRadius: BorderRadius.circular(60),
            //           color: Color(
            //             0xffE4F6E3,
            //           ).withOpacity(.2),
            //           border: Border.all(color: Colors.blue),
            //         ),
            //       ),
            //     ),
            //     Search(),
            //     Padding(
            //       padding: const EdgeInsets.only(top: 0, right: 2),
            //       child: Icon(
            //         Icons.add_road_rounded,
            //         size: 35,
            //       ),
            //     ),
            //   ],
            // ),
            // ListView.builder(
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: ListTile(
            //           shape: RoundedRectangleBorder(
            //             side: BorderSide(width: 2),
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //           leading: CircleAvatar(backgroundColor: Color(0xff6ae792),
            //           child: Icon(Icons.person),
                      
            //           ),
            //           title: Row(
            //             children: [
            //               Text("name"),
            //               SizedBox(width: 10,),
            //               Text("Age 30"),
            //             ],
            //           ),
            //           subtitle: Text("Job"),
            //           trailing:  Icon(Icons.more_vert),
            //         ),
            //       );
            //     })
            // Container(
            //   height: 760,
            //   child: ListView.builder(
            //       itemCount: 50,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding:
            //               const EdgeInsets.only(left: 15.0, top: 12, right: 15),
            //           child: Container(
            //             height: 90,
            //             child: InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) => DonorProfile()));
            //               },
            //               child: Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(left: 3),
            //                     child: Container(
            //                       height: 65,
            //                       width: 67,
            //                       decoration: BoxDecoration(
            //                         image: DecorationImage(
            //                             image: NetworkImage(
            //                                 'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
            //                             fit: BoxFit.cover),
            //                         borderRadius: BorderRadius.circular(50),
            //                         color: Color(
            //                           0xffE4F6E3,
            //                         ).withOpacity(.2),
            //                         border: Border.all(color: Colors.blue),
            //                       ),
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     width: 20,
            //                   ),
            //                   Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Text(
            //                         'Abdullah Mamdouh',
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 20,
            //                             color: Colors.blue),
            //                       ),
            //                       SizedBox(
            //                         height: 10,
            //                       ),
            //                       Row(
            //                         children: [
            //                           Icon(Icons.location_on),
            //                           Text(
            //                             'Egypt , Fayoum',
            //                             style: TextStyle(
            //                                 fontWeight: FontWeight.bold),
            //                           )
            //                         ],
            //                       )
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     width: 30,
            //                   ),
            //                   Icon(Icons.bloodtype)
            //                 ],
            //               ),
            //             ),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(15),
            //                 color: Color(
            //                   0xffE4F6E3,
            //                 ).withOpacity(.25),
            //                 border: Border.all(color: Colors.blue)),
            //           ),
            //         );
            //       }),
            // )
          
        
      
    
