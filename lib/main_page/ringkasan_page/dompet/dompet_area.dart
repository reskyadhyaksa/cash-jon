import 'package:cash_jon/main_page/ringkasan_page/dompet/get_dompet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dompet_field extends StatelessWidget {
  const dompet_field({super.key});

  //! BUTTON DOMPET LIHAT SEMUA
  Widget lihat_dompet() {
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: () {},
        child: Text('Lihat semua',
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF917FB3))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Colors.transparent,
        child: Column(children: [
          Row(
            children: [
              Text(
                'Dompet saya',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 2.7),
              lihat_dompet(),
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 175,
              decoration: BoxDecoration(
                  color: Color(0xFF2A2F4F),
                  borderRadius: BorderRadius.circular(10)),
              child: get_dompet()),
        ]));
  }
}
