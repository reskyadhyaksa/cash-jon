import 'package:cash_jon/entry_page/SignUp_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:cash_jon/nav_bar.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  // ******* VARIABLE DECLARATION ******* //
  bool password_visible = true;
  TextEditingController login_email_controller = TextEditingController();
  TextEditingController login_password_controller = TextEditingController();

  //! ******** MAIN PROGRAM SIGN IN PAGE ******** !//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(bottom: 0, child: boticon_background()),
              Positioned(right: 0, child: topicon_background()),
              Positioned(bottom: 0, child: bottom_area()),
              Padding(
                  padding: const EdgeInsets.only(left: 38, top: 160),
                  child: text_login()),
              field_area()
            ],
          ),
        ),
      ),
    );
  }

  //! ******* METHOD SIGN IN USER ******* !//
  void SignInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login_email_controller.text.trim(),
          password: login_password_controller.text.trim());

      // await FirebaseAuth.instance.currentUser!.reload();
      // await FirebaseAuth.instance.currentUser!.displayName.toString();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => bottom_nav_bar()));
    } catch (e) {
      print('Error signing in: $e');
      // print('Email : ${FirebaseAuth.instance.currentUser!.email}');

      login_email_controller.text = '';
      login_password_controller.text = '';
      // Handle the error
    }
  }

  //? ******* LOGIN BUTTON ******* ?//
  Widget login_button() {
    return ElevatedButton(
      child: Text('Login',
          style: GoogleFonts.poppins(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700)),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Color(0xFF2A2F4F)),
          minimumSize: MaterialStateProperty.all(Size(333, 42)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: () {
        SignInUser();
        setState(() {});
      },
    );
  }

  //? ******* FORGOT PASSWORD TEXT ******* ?//
  Widget forgot_pass() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey,
                textStyle: TextStyle(decoration: TextDecoration.underline)),
          ),
          onPressed: () {}),
    );
  }

  //? ******* LOGIN TEXT ******* ?//
  Widget text_login() {
    return Text(
      'Login',
      style: GoogleFonts.poppins(
          color: Colors.black, fontSize: 33, fontWeight: FontWeight.w700),
    );
  }

  //? ******* TOP BACKGROUND ******* ?//
  Widget topicon_background() {
    return Image.asset('assets/icon/topicon.png', scale: 2.5);
  }

  //? ******* BOTTOM BACKGROUND ******* ?//
  Widget boticon_background() {
    return Image.asset("assets/img/wave1.png",
        width: MediaQuery.of(context).size.width);
  }

  //? ******* GOOGLE BUTTON ******* ?//
  Widget google_button() {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(333, 42)),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Color(0xFFAD8ECD)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/google-logo.png', scale: 4),
              SizedBox(width: 10),
              Text('Login with Google',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700))
            ]),
        onPressed: () {});
  }

  //? ******* GOOGLE BUTTON ******* ?//
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => register_page()));
          },
          child: Row(
            children: [
              Text('Don\'t have account? ',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
              Text('Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        )
      ],
    );
  }

  //? ******* BOTTOM AREA [ GOOGLE BUTTON & TEXT ] ******* ?//
  Widget bottom_area() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 40),
      child: Column(children: [google_button(), dont_have_account()]),
    );
  }

  //? ******* EMAIL TEXT FIELD ******* ?//
  Widget email_form() {
    return TextFormField(
        controller: login_email_controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.grey[300],
                fontWeight: FontWeight.w400)));
  }

  //? ******* EMAIL TEXT FIELD ******* ?//
  Widget password_form() {
    return TextFormField(
      obscureText: password_visible,
      controller: login_password_controller,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  password_visible = !password_visible;
                });
              },
              icon: Icon(password_visible
                  ? Icons.remove_red_eye
                  : Icons.visibility_off)),
          hintText: 'Password',
          hintStyle: GoogleFonts.poppins(
              fontSize: 17,
              color: Colors.grey[300],
              fontWeight: FontWeight.w400)),
    );
  }

  //? ******* FIELD AREA LOGIN ******* ?//
  Widget field_area() {
    return Padding(
      padding: const EdgeInsets.only(top: 285, left: 38, right: 33),
      child: Column(
        children: [
          email_form(),
          password_form(),
          forgot_pass(),
          SizedBox(height: 30),
          login_button(),
        ],
      ),
    );
  }
}
