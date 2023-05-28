// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// import 'package:mahmoud/screans/login_screen.dart';
// import 'package:mahmoud/shared/snakbar.dart';

// // ignore: must_be_immutable
// class RegisterScreen extends StatefulWidget {
//   RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   bool isLoading = false;
//   bool isVisable = true;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final genderController = TextEditingController();
//   final fullnameController = TextEditingController();
//   final ageController = TextEditingController();
//   final bloodGroupController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//   final addressController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   late String collectionname;

//   register() async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       print(credential.user!.uid);

//       CollectionReference users =
//           FirebaseFirestore.instance.collection('UsersDonors');

//       users
//           .doc(credential.user!.uid)
//           .set({
//             'email': emailController.text,
//             'password': passwordController.text,
//             'fullname': fullnameController.text,
//             'age': ageController.text,
//             'bloodgroup': bloodGroupController.text,
//             'phonenumber': phoneNumberController.text,
//             'address': addressController.text,
//             'gender': genderController.text
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         showSnakBar(
//           context,
//           "The password provided is too weak.",
//         );
//       } else if (e.code == 'email-already-in-use') {
//         showSnakBar(
//           context,
//           "The account already exists for that email",
//         );
//       } else {
//         showSnakBar(context, "ERROR - please try again late");
//       }
//     } catch (e) {
//       showSnakBar(context, e.toString());
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     fullnameController.dispose();
//     addressController.dispose();
//     genderController.dispose();
//     ageController.dispose();
//     bloodGroupController.dispose();
//     phoneNumberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Sign up to continue',
//                     style: TextStyle(
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   TextFormField(
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email address';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Email Address',
//                       prefixIcon: Icon(
//                         Icons.email,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: passwordController,
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: isVisable ? true : false,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password should be at least 6 characters';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: Icon(
//                         Icons.lock,
//                       ),
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isVisable = !isVisable;
//                           });
//                         },
//                         icon: isVisable
//                             ? Icon(Icons.visibility)
//                             : Icon(Icons.visibility_off),
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: fullnameController,
//                     keyboardType: TextInputType.name,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'Please enter your full name';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       labelText: 'Full Name',
//                       prefixIcon: Icon(
//                         Icons.person,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: ageController,
//                     keyboardType: TextInputType.number,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'Please enter your age';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       labelText: 'Age',
//                       prefixIcon: Icon(
//                         Icons.view_agenda,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: bloodGroupController,
//                     keyboardType: TextInputType.text,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'Please enter your blood group';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       labelText: 'Blood Group',
//                       prefixIcon: Icon(
//                         Icons.bloodtype,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: phoneNumberController,
//                     keyboardType: TextInputType.phone,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'Please enter your phone number';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       labelText: 'Phone Number',
//                       prefixIcon: Icon(
//                         Icons.phone,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: addressController,
//                     keyboardType: TextInputType.text,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'Please enter your phone number';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       labelText: 'Address',
//                       prefixIcon: Icon(
//                         Icons.location_on_outlined,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   TextFormField(
//                     controller: genderController,
//                     keyboardType: TextInputType.text,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return 'Please enter your phone number';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       labelText: 'Gender',
//                       prefixIcon: Icon(
//                         Icons.person,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     color: Colors.blue,
//                     child: MaterialButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           await register();
//                           if (!mounted) return;
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => loginScreen(),
//                             ),
//                           );
//                         } else {
//                           showSnakBar(context, "errer");
//                         }
//                       },
//                       child: isLoading
//                           ? CircularProgressIndicator(
//                               color: Colors.white,
//                             )
//                           : Text('Sign Up',
//                               style: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Already have an account?',
//                       ),
//                       MaterialButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => loginScreen(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'Log In',
//                           style: TextStyle(
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class LoginScreen extends StatefulWidget {
// //   @override
// //   _LoginScreenState createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   var emailController = TextEditingController();
// //   var passwordController = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Center(
// //           child: SingleChildScrollView(
// //             child: Form(
// //               key: _formKey,
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     'Log in to continue',
// //                     style: TextStyle(
// //                       fontSize: 40.0,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 40.0,
// //                   ),
// //                   TextFormField(
// //                     controller: emailController,
// //                     keyboardType: TextInputType.emailAddress,
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter your email address';
// //                       }
// //                       return null;
// //                     },
// //                     decoration: InputDecoration(
// //                       labelText: 'Email Address',
// //                       prefixIcon: Icon(
// //                         Icons.email,
// //                       ),
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   TextFormField(
// //                     controller: passwordController,
// //                     keyboardType: TextInputType.visiblePassword,
// //                     obscureText: true,
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter your password';
// //                       }
// //                       return null;
// //                     },
// //                     decoration: InputDecoration(
// //                       labelText: 'Password',
// //                       prefixIcon: Icon(
// //                         Icons.lock,
// //                       ),
// //                       suffixIcon: Icon(
// //                         Icons.remove_red_eye,
// //                       ),
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Container(
// //                     width: double.infinity,
// //                     color: Colors.blue,
// //                     child: MaterialButton(
// //                       onPressed: () async {
// //                         if (_formKey.currentState!.validate()) {
// //                           try {
// //                             UserCredential userCredential = await FirebaseAuth
// //                                 .instance
// //                                 .signInWithEmailAndPassword(
// //                               email: emailController.text,
// //                               password: passwordController.text,
// //                             );
// //                             print('User ${userCredential.user?.uid} logged in');

// //                             // Navigate to the next screen
// //                           } on FirebaseAuthException catch (e) {
// //                             if (e.code == 'user-not-found') {
// //                               print('No user found for that email.');
// //                             } else if (e.code == 'wrong-password') {
// //                               print('Wrong password provided for that user.');
// //                             }
// //                           }
// //                         }
// //                       },
// //                       child: Text(
// //                         'Log In',
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Text(
// //                         'Don\'t have an account?',
// //                       ),
// //                       MaterialButton(
// //                         onPressed: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => RegisterScreen(),
// //                             ),
// //                           );
// //                         },
// //                         child: Text(
// //                           'Sign Up',
// //                           style: TextStyle(
// //                             color: Colors.blue,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
