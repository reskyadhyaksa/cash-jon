import 'package:cash_jon/entry_page/SignIn_Page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

void sign_out(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => login_page()));
}

Widget logout_button(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        sign_out(context);
      },
      child: Text(
        'Sign Out',
        style: GoogleFonts.poppins(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700),
      ));
}
