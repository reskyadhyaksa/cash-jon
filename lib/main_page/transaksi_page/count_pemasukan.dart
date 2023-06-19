import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget count_pemasukan() {
  int sum = 0;
  NumberFormat currencyFormat = NumberFormat.decimalPattern('vi_VN');
  final email = FirebaseAuth.instance.currentUser!.email;

  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('users/$email/catatan')
        .where('jenis_transaksi', isEqualTo: 'pemasukan')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Container(color: Colors.transparent);
      } else {
        List? list_data = snapshot.data!.docs.map((e) => e.data()).toList();
        if (sum == 0) {
          for (int i = 0; i < list_data.length; i++) {
            int nominal = list_data[i]['nominal'];
            sum += nominal;
          }
        }
        return Text(
            'Rp  ${currencyFormat.format(sum).length < 10 ? currencyFormat.format(sum) : currencyFormat.format(sum).substring(0, 10) + '...'}',
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w700));
      }
    },
  );
}
