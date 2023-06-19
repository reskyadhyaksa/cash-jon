import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text_tambah() {
  return Align(
    alignment: Alignment.topCenter,
    child: Text(
      'Tambah Dompet',
      style: GoogleFonts.poppins(
          fontSize: 17, color: Colors.white, fontWeight: FontWeight.w700),
    ),
  );
}
