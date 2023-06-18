import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class get_pemasukan extends StatefulWidget {
  const get_pemasukan({super.key});

  @override
  State<get_pemasukan> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<get_pemasukan> {
  NumberFormat currencyFormat = NumberFormat('#,##0', 'en-US');
  final now_email = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users/$now_email/pemasukan')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView(
            children: snapshot.data!.docs.map((e) {
              return Card(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(e.data()['deskripsi'],
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Color(0xFF2A2F4F),
                                fontWeight: FontWeight.w700)),
                        Container(
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 6, right: 6),
                            decoration: BoxDecoration(
                                color: Color(0xFF2A2F4F),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                                e.data()['tanggal'] + ' : ' + e.data()['waktu'],
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)))
                      ],
                    ),
                    Spacer(),
                    Text(
                      '+ Rp. ' + currencyFormat.format(e.data()['nominal']),
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Color(0xFF24A922),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ));
            }).toList(),
          );
        }
      },
    );
  }
}
