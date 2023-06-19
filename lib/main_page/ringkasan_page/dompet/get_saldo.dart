import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget get_saldo() {
  int sum = 0;
  NumberFormat currencyFormat = NumberFormat.decimalPattern('vi_VN');
  final email = FirebaseAuth.instance.currentUser!.email;

  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('users/$email/catatan')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Text('Rp *************',
            style: GoogleFonts.poppins(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700));
      } else {
        List? list_data = snapshot.data!.docs.map((e) => e.data()).toList();
        if (sum == 0) {
          for (int i = 0; i < list_data.length; i++) {
            int nominal = list_data[i]['nominal'];
            if (list_data[i]['jenis_transaksi'] == 'pemasukan') {
              sum += nominal;
            } else {
              sum -= nominal;
            }
          }
        }
        return Text(
            'Rp  ${currencyFormat.format(sum).length < 15 ? currencyFormat.format(sum) : currencyFormat.format(sum).substring(0, 15) + '...'}',
            style: GoogleFonts.poppins(
                fontSize: 17,
                color: Color(0xFF2A2F4F),
                fontWeight: FontWeight.w700));
      }
    },
  );
}
