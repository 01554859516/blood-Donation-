// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mahmoud/screans/wellcome/splash_screen.dart';
import 'package:mahmoud/screans/test_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mahmoud/shared/snakbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const blood_bank());
}

class blood_bank extends StatelessWidget {
  const blood_bank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else if (snapshot.hasError) {
            return showSnakBar(context, "Something went wrong");
          } else if (snapshot.hasData) {
            return TestScreen();
          } else {
            return Splash();
          }
        },
      ),
      // routes: {
      //   // '/': (context) => Splash(),
      //   // 'homeScreen': (context) => HomeScreen(),
      //   // 'signup': (context) => SocialSignupScreen(),
      //   // 'loginScreen': (context) => SocialloginScreen(),
      // },
    );
  }
}
