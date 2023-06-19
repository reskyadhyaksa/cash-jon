// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget change_button(BuildContext context) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Color(0xFF2A2F4F)),
          minimumSize: MaterialStateProperty.all(Size(270, 42)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: () {},
      child: Text(
        'Update Detail Akun',
        style: GoogleFonts.poppins(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700),
      ));
}
