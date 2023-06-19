import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class box_akun extends StatefulWidget {
  const box_akun({super.key});

  @override
  State<box_akun> createState() => _box_akunState();
}

class _box_akunState extends State<box_akun> {
  final email_now = FirebaseAuth.instance.currentUser!.email;
  final uname_now = FirebaseAuth.instance.currentUser!.displayName;
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.42,
        decoration: BoxDecoration(
            color: Color(0xFF2A2F4F), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5),
                Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFD9D9D9)),
                    child: TextField(
                        textInputAction: TextInputAction.next,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        onEditingComplete: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: email_controller,
                        maxLines: 4,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            hintText: '$email_now',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500),
                            border: InputBorder.none),
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Color(0xFF2A2F4F),
                            fontWeight: FontWeight.w700))),
                SizedBox(height: 20),
                Text('Username',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xFFD9D9D9)),
                  child: TextField(
                      textInputAction: TextInputAction.next,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: username_controller,
                      maxLines: 4,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: '$uname_now',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none),
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xFF2A2F4F),
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 20),
                Text('Password',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xFFD9D9D9)),
                  child: TextField(
                      textInputAction: TextInputAction.next,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: password_controller,
                      maxLines: 4,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: 'Change Password',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none),
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xFF2A2F4F),
                          fontWeight: FontWeight.w700)),
                )
              ]),
        ),
      ),
    );
  }
}
