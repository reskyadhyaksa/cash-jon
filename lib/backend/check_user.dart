import 'package:cash_jon/entry_page/SignIn_Page.dart';
import 'package:cash_jon/app_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//! THIS CLASS WILL BE CHECK USER IF THEY HAVE BEEN SIGN IN OR NOT

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //? User is Logged In
          if (snapshot.hasData) {
            return bottom_nav_bar();
          }

          //? User is NOT Logged In
          else {
            return login_page();
          }
        },
      ),
    );
  }
}
