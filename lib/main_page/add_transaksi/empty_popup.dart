import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void empty_pop_up(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xFFFF7A00),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'Gagal Menambah Transaksi\nSalah satu form tidak boleh kosong',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      )));
}
