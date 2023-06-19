import 'package:cash_jon/main_page/ringkasan_page/dompet/backend/get_dompet.dart';
import 'package:cash_jon/main_page/ringkasan_page/dompet/tambah_dompet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dompet_field extends StatelessWidget {
  const dompet_field({super.key});

  //! BUTTON DOMPET LIHAT SEMUA
  Widget lihat_dompet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => tambah_dompet(),
            );
          },
          child: Text('Tambah Dompet',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF917FB3)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now_email = FirebaseAuth.instance.currentUser!.email;
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection("users/$now_email/catatan")
            .snapshots(),
        builder: (context, snapshot) {
          return Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20, right: 20),
              color: Colors.transparent,
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      'Dompet saya',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Spacer(),
                    lihat_dompet(context),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: 175,
                    decoration: BoxDecoration(
                        color: Color(0xFF2A2F4F),
                        borderRadius: BorderRadius.circular(10)),
                    child: get_dompet()),
              ]));
        });
  }
}
