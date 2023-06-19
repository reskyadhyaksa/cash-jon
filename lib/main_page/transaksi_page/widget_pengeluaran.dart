import 'package:cash_jon/main_page/transaksi_page/count_pengeluaran.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class box_pengeluaran extends StatefulWidget {
  const box_pengeluaran({super.key});

  @override
  State<box_pengeluaran> createState() => _box_pengeluaranState();
}

class _box_pengeluaranState extends State<box_pengeluaran> {
  bool button_pressed = false;
  final email = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
            color: Color(0xFF2A2F4F), borderRadius: BorderRadius.circular(19)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Image.asset('assets/icon/pengeluaran.png', scale: 4),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pengeluaran',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                    count_pengeluaran(),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
