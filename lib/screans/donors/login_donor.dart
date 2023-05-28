import 'package:flutter/material.dart';
import 'package:mahmoud/screans/Section_selection.dart';
import 'package:mahmoud/screans/donors/register_donors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mahmoud/screans/test_screen.dart';
import 'package:mahmoud/shared/snakbar.dart';

class loginDonor extends StatefulWidget {
  @override
  _loginDonor createState() => _loginDonor();
}

class _loginDonor extends State<loginDonor> {
  bool isVisable = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // String _errorMessage = '';
  login() async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => print(Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) {
                  return TestScreen();
                }),
              )))
          .catchError((error) => showSnakBar(context, 'ERROR : ${error.code}'));
      // setState(() {});
      // showSnakBar(context, "Done... ");
    } on FirebaseAuthException catch (e) {
      showSnakBar(context, 'ERROR : ${e.code}');
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) {
                return SectionSelection();
              }),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log in to your account',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisable ? true : false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: isVisable
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () async {
                        await login();
                        if (!mounted) return;
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => loginScreen(),
                        //   ),
                        // );
                        // showSnakBar(context, "done ...");
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreenDonors(),
                          ),
                        );
                      },
                      child: Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  // if (_errorMessage.isNotEmpty)
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 10.0),
                  //     child: Center(
                  //       child: Text(
                  //         _errorMessage,
                  //         style: TextStyle(
                  //           color: Colors.red,
                  //           fontSize: 16.0,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:mahmoud/screans/register.dart';
// import 'package:mahmoud/shared/snakbar.dart';

// class loginScreen extends StatefulWidget {
//   @override
//   _loginScreen createState() => _loginScreen();
// }

// class _loginScreen extends State<loginScreen> {
//   bool isVisable = true;
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   // String _errorMessage = '';
//   login() async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       // showSnakBar(context, "Done... ");
//     } on FirebaseAuthException catch (e) {
//       showSnakBar(context, 'ERROR : ${e.code}');
//     }
//   }

//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
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
//                   Text(
//                     'Log in to your account',
//                     style: TextStyle(
//                       fontSize: 40.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40.0,
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
//                   Container(
//                     width: double.infinity,
//                     color: Colors.blue,
//                     child: MaterialButton(
//                       onPressed: () async {
//                         await login();
//                         if (!mounted) return;
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => loginScreen(),
//                         //   ),
//                         // );
//                         // showSnakBar(context, "done ...");
//                       },
//                       // onPressed: () async {
//                       //   setState(() {
//                       //     _errorMessage = '';
//                       //   });

//                       //   if (_formKey.currentState!.validate()) {
//                       //     try {
//                       //       UserCredential userCredential = await FirebaseAuth
//                       //           .instance
//                       //           .signInWithEmailAndPassword(
//                       //         email: emailController.text.trim(),
//                       //         password: passwordController.text.trim(),
//                       //       );

//                       //       // Retrieve user data from Firebase
//                       //       DatabaseReference userRef = FirebaseDatabase
//                       //           .instance
//                       //           .reference()
//                       //           .child('users/${userCredential.user!.uid}');
//                       //       DatabaseEvent userSnapshot = await userRef.once();
//                       //       Map<dynamic, dynamic>? userMap =
//                       //           userSnapshot as Map<dynamic, dynamic>?;

//                       //       if (userMap != null) {
//                       //         // Navigate to the next screen
//                       //         // You can pass the retrieved user data to the next screen using arguments
//                       //       } else {
//                       //         // If user data is not found, log out the user (if logged in)
//                       //         final currentUser =
//                       //             FirebaseAuth.instance.currentUser;
//                       //         if (currentUser != null) {
//                       //           await FirebaseAuth.instance.signOut();
//                       //         }
//                       //         setState(() {
//                       //           _errorMessage = 'User data not found';
//                       //         });
//                       //       }
//                       //     } on FirebaseAuthException catch (e) {
//                       //       setState(() {
//                       //         _errorMessage = e.message!;
//                       //       });
//                       //     }
//                       //   }
//                       // },
//                       child: Text(
//                         'Log in',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Center(
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => RegisterScreen(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Don\'t have an account? Sign up',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // if (_errorMessage.isNotEmpty)
//                   //   Padding(
//                   //     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                   //     child: Center(
//                   //       child: Text(
//                   //         _errorMessage,
//                   //         style: TextStyle(
//                   //           color: Colors.red,
//                   //           fontSize: 16.0,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
