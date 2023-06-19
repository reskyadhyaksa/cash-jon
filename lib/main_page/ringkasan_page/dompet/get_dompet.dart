import 'package:cash_jon/main_page/ringkasan_page/dompet/get_saldo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class get_dompet extends StatefulWidget {
  const get_dompet({super.key});

  @override
  State<get_dompet> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<get_dompet> {
  NumberFormat currencyFormat = NumberFormat.decimalPattern('vi_VN');
  final now_email = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users/$now_email/catatan')
          .where('jenis_dompet', isEqualTo: 'Bank BNI')
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
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(e.data()['jenis_dompet'],
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Color(0xFF2A2F4F),
                            fontWeight: FontWeight.w700)),
                    Spacer(),
                    get_saldo()
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