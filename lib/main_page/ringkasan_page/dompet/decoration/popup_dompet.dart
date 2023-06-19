import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void dompet_pop_up(BuildContext context) {
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
            'BERHASIL MENAMBAH DOMPET',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 19, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      )));
}

void invalid_dompet_pop_up(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xFFD34F4F),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'Gagal Menambah Dompet\nForm tidak boleh kosong',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      )));
}

void error_pop_up(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xFFD34F4F),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'Bank tidak terdaftar',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      )));
}
