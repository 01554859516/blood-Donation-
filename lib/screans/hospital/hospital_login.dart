import 'package:flutter/material.dart';
import 'package:mahmoud/screans/Section_selection.dart';
import 'package:mahmoud/screans/donors/register_donors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mahmoud/screans/hospital/register_hospital.dart';
import 'package:mahmoud/screans/test_screen.dart';
import 'package:mahmoud/shared/snakbar.dart';

class loginScreenHospital extends StatefulWidget {
  @override
  _loginScreenHospital createState() => _loginScreenHospital();
}

class _loginScreenHospital extends State<loginScreenHospital> {
  bool isVisable = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // String _errorMessage = '';
  login() async {
    try {
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
                            builder: (context) => RegisterScreenHospital(),
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
