// import 'package:cash_jon/entry_page/login_property/_login_page.dart';
import 'package:cash_jon/entry_page/SignIn_Page.dart';
import 'package:cash_jon/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class register_page extends StatefulWidget {
  const register_page({super.key});

  @override
  State<register_page> createState() => register_pageState();
}

class register_pageState extends State<register_page> {
  // ******* VARIABLE DECLARATION ******* //
  int error_code = 0;
  String errorMessage = '';
  bool password_visible = true;
  double height_error_bar = 50;
  Color error_color = Color(0xFF2A2F4F);
  FirebaseAuth signup_auth = FirebaseAuth.instance;
  TextEditingController email_controller_signup = TextEditingController();
  TextEditingController password_controller_signup = TextEditingController();
  TextEditingController username_controller_signup = TextEditingController();

  //! ******* MAIN PROGRAM SIGN UP PAGE ******* !//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(children: [
                Positioned(bottom: 0, child: background_wave(context)),
                Positioned(right: 0, child: top_icon()),
                Padding(
                    padding: const EdgeInsets.only(left: 38, top: 180),
                    child: signup_text()),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 20),
                    child: back_button(context)),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 285, left: 38, right: 33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        email_field(),
                        SizedBox(height: 8),
                        username_field(),
                        SizedBox(height: 10),
                        password_field(),
                        SizedBox(height: 55),
                        signup_button(),
                      ],
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 28, top: 710, right: 28),
                    child: Column(
                        children: [google_button(), dont_have_account()])),
              ]))),
    );
  }

  //! ******* METHOD SIGN UP AUTHENTICATION ******* !//
  Future signupmethod() async {
    //! CREATE USER
    try {
      final user_ = await signup_auth.createUserWithEmailAndPassword(
          email: email_controller_signup.text,
          password: password_controller_signup.text);

      await user_.user?.updateDisplayName(username_controller_signup.text);
      // await FirebaseAuth.instance.currentUser!.reload();
      await FirebaseAuth.instance.currentUser!.displayName.toString();
      print({FirebaseAuth.instance.currentUser!.displayName});

      add_account(username_controller_signup.text, email_controller_signup.text,
          password_controller_signup.text);

      //! POP UP USER DIRECTLY GO TO DASHBOARD !//
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF02C62D),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 50,
              width: 100,
              child: Text(
                'Daftar berhasil, \nAnda akan diantar ke Halaman Utama',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )));

      Timer(Duration(milliseconds: 1000), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => bottom_nav_bar()));
      });

      //! EXCEPTION TO CATCH EVERY ERROR !//
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == 'weak-password') {
        error_code = 1;
        height_error_bar = 60;
        error_color = Color(0xFFFF0808);
        errorMessage = 'Password anda terlalu lemah';
      } else if (e.code.toString() == 'email-already-in-use') {
        error_code = 2;
        height_error_bar = 60;
        error_color = Color(0xFF7707E9);
        errorMessage = 'Email telah terdaftar \nMohon gunakan email yang lain';
      } else if (e.code.toString() == 'invalid-email') {
        error_code = 3;
        height_error_bar = 60;
        error_color = Color(0xFF0C134F);
        errorMessage = 'Email Tidak Valid \nMohon gunakan email yang valid';
      } else {
        error_color = Color(0xFF02C62D);
        errorMessage = "Silahkan mengisi seluruh Form yang ada";
        print(e);
      }

      //! ERROR MESSAGE DISPLAY !//
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Padding(
            padding: const EdgeInsets.only(bottom: 300.0),
            child: Container(
              height: height_error_bar,
              width: 90,
              decoration: BoxDecoration(
                  color: error_color,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text('$errorMessage',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
            ),
          )));
    }
  }

  //! ******* METHOD ADD ACCOUNT PROPERTIES ******* !//
  Future add_account(
      String username_, String user_email, String user_pass) async {
    final data = {
      'username': username_,
      'email': user_email,
      'password': user_pass
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user_email)
        .set(data);
  }

  //? ******* TITLE TEXT SIGN UP ******* ?//
  Widget signup_text() {
    return Text('Sign Up',
        style: GoogleFonts.poppins(
            fontSize: 33, color: Colors.black, fontWeight: FontWeight.w700));
  }

  //? ******* BOTTOM BACKGROUND ******* ?//
  Widget background_wave(BuildContext context) {
    return Image.asset('assets/img/wave2.png',
        width: MediaQuery.of(context).size.width);
  }

  //? ******* TOP RIGHT BACKGROUND ******* ?//
  Widget top_icon() {
    return Image.asset('assets/icon/topicon2.png', scale: 2.5);
  }

  //? ******* BACK BUTTON ******* ?//
  Widget back_button(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
      iconSize: 40,
    );
  }

  //? ******* EMAIL FIELD ******* ?//
  Widget email_field() {
    return TextFormField(
      controller: email_controller_signup,
      textInputAction: TextInputAction.next,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onEditingComplete: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: GoogleFonts.poppins(
              fontSize: 17,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400)),
    );
  }

  //? ******* USERNAME FIELD ******* ?//
  Widget username_field() {
    return TextFormField(
      controller: username_controller_signup,
      textInputAction: TextInputAction.next,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onEditingComplete: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
          hintText: 'Username',
          hintStyle: GoogleFonts.poppins(
              fontSize: 17,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400)),
    );
  }

  //? ******* PASSWORD FIELD ******* ?//
  Widget password_field() {
    return TextFormField(
      controller: password_controller_signup,
      textInputAction: TextInputAction.done,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onEditingComplete: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: password_visible,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  password_visible = !password_visible;
                });
              },
              icon: Icon(password_visible
                  ? Icons.visibility_off
                  : Icons.remove_red_eye)),
          hintText: 'Password',
          hintStyle: GoogleFonts.poppins(
              fontSize: 17,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400)),
    );
  }

  //? ******* GOOGLE BUTTON ******* ?//
  Widget google_button() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Color(0xFFAD8ECD)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        child: Row(children: [
          Image.asset('assets/icon/google-logo.png', scale: 4),
          SizedBox(width: 50),
          Text('Login with Google',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700))
        ]),
        onPressed: () {});
  }

  //? ******* DON'T HAVE ACCOUNT TEXT BUTTON ******* ?//
  Widget dont_have_account() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //? WRAP ITEM VERTICAL
      crossAxisAlignment: CrossAxisAlignment.center, //? WRAP ITEM HORIZONTAL
      children: [
        SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => login_page()));
          },
          child: Row(
            children: [
              Text('Already have an account? ',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
              Text('Sign In',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        )
      ],
    );
  }

  //? ******* SIGN UP BUTTON ******* ?//
  Widget signup_button() {
    return ElevatedButton(
        child: Text('Sign Up',
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Color(0xFFAD8ECD)),
            minimumSize: MaterialStateProperty.all(Size(333, 42)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          signupmethod();
          setState(() {});
        });
  }
}



//* EXAMPLE THREAD ABOUT SIGN UP AUTH 
//* https://blog.logrocket.com/implementing-firebase-authentication-in-a-flutter-app/
