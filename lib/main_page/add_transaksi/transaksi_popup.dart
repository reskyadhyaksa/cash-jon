import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void pemasukan_pop_up(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xFF02C62D),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'BERHASIL MENAMBAH PEMASUKAN',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 19, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      )));
}

void pengeluaran_pop_up(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xFFEB1F39),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'BERHASIL MENAMBAH PENGELUARAN',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 19, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      )));
}
