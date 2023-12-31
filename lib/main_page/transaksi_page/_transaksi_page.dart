import 'package:cash_jon/main_page/transaksi_page/box_transaksi.dart';
import 'package:cash_jon/main_page/transaksi_page/get_pemasukan.dart';
import 'package:cash_jon/main_page/transaksi_page/get_pengeluaran.dart';
import 'package:cash_jon/main_page/transaksi_page/widget_pemasukan.dart';
import 'package:cash_jon/main_page/transaksi_page/widget_pengeluaran.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class transaksi_page extends StatefulWidget {
  const transaksi_page({super.key});

  @override
  State<transaksi_page> createState() => _transaksi_pageState();
}

class _transaksi_pageState extends State<transaksi_page> {
  //* VARIABLE DECLARATION
  final now_email = FirebaseAuth.instance.currentUser!.email;
  bool jenis_transaksi = true; //? TRUE : PEMASUKAN || FALSE : PENGELUARAN
  bool onSelected_pengeluaran = false;
  bool onSelected_pemasukan = true;
  int sum = 0;

  Widget row_button() {
    return Row(children: [
      SizedBox(width: 15),
      ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19))),
            backgroundColor: onSelected_pemasukan
                ? MaterialStateColor.resolveWith((states) => Color(0xFF2A2F4F))
                : MaterialStateColor.resolveWith((states) => Color(0xFF917FB3)),
          ),
          onPressed: () {
            setState(() {
              onSelected_pemasukan = true;
              onSelected_pengeluaran = false;
              jenis_transaksi = !jenis_transaksi;
              jenis_transaksi = true;
              print(jenis_transaksi);
              get_pengeluaran();
            });
          },
          child: Text('Masuk',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white))),
      SizedBox(width: 5),
      ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19))),
            backgroundColor: onSelected_pengeluaran
                ? MaterialStateColor.resolveWith((states) => Color(0xFF2A2F4F))
                : MaterialStateColor.resolveWith((states) => Color(0xFF917FB3)),
          ),
          onPressed: () {
            setState(() {
              onSelected_pengeluaran = true;
              onSelected_pemasukan = false;
              jenis_transaksi = !jenis_transaksi;
              jenis_transaksi = false;
              print(jenis_transaksi);
              get_pemasukan();
            });
          },
          child: Text('Keluar',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white))),
      Spacer(),

      //? Line Beside Button
      Container(
          height: 6,
          width: MediaQuery.of(context).size.width * 0.43,
          decoration: BoxDecoration(
              color: Color(0xFF2A2F4F),
              borderRadius: BorderRadius.circular(3))),
      SizedBox(width: 3)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection("users/$now_email/catatan")
              .snapshots(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          box_pemasukan(),
                          SizedBox(width: 10),
                          box_pengeluaran()
                        ]),
                    SizedBox(height: 20),
                    row_button(),
                    SizedBox(height: 12),
                    box_transaksi(context, jenis_transaksi)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
