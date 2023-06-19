import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget delete_akun(BuildContext context) {
  return TextButton(
      style:
          TextButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      onPressed: () {},
      child: Text(
        'Tutup Akun',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            fontSize: 15, color: Colors.red[600], fontWeight: FontWeight.w700),
      ));
}
